//
//  NetworkService.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import Foundation
import Moya

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    private let provider = MoyaProvider<NetworkProvider>()
    
    func fetchJobs(callBack: @escaping (Result<[Job]>)-> Void) -> Void {
        provider.request(.remoteJobs) { result in
            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode
                if statusCode == 200 {
                    let jobsResponse = try! JSONDecoder().decode(APIResponse.self, from: data)
                    callBack(.success(value: jobsResponse.jobs))
                } else {
                    callBack(.failure(error: "something went wrong"))
                }
            case .failure(_):
                callBack(Result.failure(error: "Something went wrong, Try again."))
            }
        }
    }
    
}
