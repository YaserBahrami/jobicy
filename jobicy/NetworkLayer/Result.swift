//
//  Result.swift
//  jobicy
//
//  Created by Yaser on 1.04.2024.
//

import Foundation

enum Result<T> {
    case success(value: T)
    case failure(error: String)
}
