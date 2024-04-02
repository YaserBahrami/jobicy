//
//  JobModel.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import Foundation

struct APIResponse: Codable {
    var jobCount: Int
    var jobs: [Job]
}
struct Job: Codable {
    var id: Int
    var url: String
    var jobTitle: String
    var companyName: String
    var companyLogo: String
    var isFavorite: Bool? = false
}
