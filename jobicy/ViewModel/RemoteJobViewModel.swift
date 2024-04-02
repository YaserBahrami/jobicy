//
//  RemoteJobViewModel.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import Foundation

class RemoteJobViewModel {
    
    private var jobs: [Job] = []
    
    var favoriteJobs: [Job] = []
    
    init() {
        loadFavorites()
    }
    
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
                self.updateJobsWithFavorites()
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func addToFavorites(_ job: Job) {
        if !favoriteJobs.contains(where: { $0.id == job.id }) {
            
            var favoriteJob = job
            favoriteJob.isFavorite = true
            favoriteJobs.append(favoriteJob)
            saveFavorites()
        }
    }
    
    func removeFromFavorites(_ job: Job) {
        favoriteJobs.removeAll { $0.id == job.id }
        saveFavorites()
        updateJobsWithFavorites()
    }
    
    private func saveFavorites() {
        let data = try? JSONEncoder().encode(favoriteJobs)
        UserDefaults.standard.set(data, forKey: "FavoriteJobs")
        updateJobsWithFavorites()
    }
    
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "FavoriteJobs"),
           let savedFavorites = try? JSONDecoder().decode([Job].self, from: data) {
            favoriteJobs = savedFavorites
            print(favoriteJobs)
        }
    }
    
    private func updateJobsWithFavorites() {
        print(favoriteJobs.count)
        print(jobs.count)
        print(self.jobs.count)
        for index in 0..<jobs.count {
            let job = jobs[index]

            self.jobs[index].isFavorite = self.favoriteJobs.contains { $0.id == job.id }
        }
    }
    
}
