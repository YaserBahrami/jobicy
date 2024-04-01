//
//  NetworkProvider.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

//import Foundation
import Moya

enum NetworkProvider {
    case remoteJobs
}

extension NetworkProvider: TargetType {
    var baseURL: URL {
        return URL(string: "https://jobicy.com/api/v2/")!
    }
    
    var path: String {
        switch self {
        case .remoteJobs:
            return "remote-jobs"
        }
    }
    
    var method: Method {
        switch self {
        case .remoteJobs:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .remoteJobs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
