//
//  RemoteJobViewModel.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import Foundation

class RemoteJobViewModel {
    private var jobs: [Job] = []
    
    var numberOfJobs: Int {
        return jobs.count
    }
    
    func job(at index: Int) -> Job {
        return jobs[index]
    }
    
    func fetchJobs(completion: @escaping () -> Void) {
        NetworkService.shared.fetchJobs { result in
            switch result {
            case .success(let _jobs):
                self.jobs = _jobs
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
