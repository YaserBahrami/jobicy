//
//  JobModel.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import Foundation

struct apiResponse: Codable {
    var jobCount: Int
    var jobs: [job]
}
struct job: Codable {
    var id: Int
    var url: String
    var jobTitle: String
    var companyName: String
    var companyLogo: String
}

/*
 "id": Unique Job ID,
 "url": Job link,
 "jobTitle": Job title,
 "companyName": Company name,
 "companyLogo": Company logo link,
 "jobIndustry": Job function (industry),
 "jobType": Job type (full-time, contract, part-time or internship)
 "jobGeo": Geographic restriction for employment (or Anywhere if not applicable),
 "jobLevel": Seniority level (or Any if not applicable),
 "jobExcerpt": Excerpt job description (max 55 characters),
 "jobDescription": Full job description (HTML),
 "pubDate": Publication date and time (UTC+00:00),
 "annualSalaryMin": Annual min salary (if applicable),
 "annualSalaryMax": Annual max salary (if applicable),
 "salaryCurrency": ISO 4217 salary currency code (if applicable)

 */
