//
//  LocationModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 25.11.2022.
//

import Foundation


struct LocationModel<T:Codable>: Codable {
    let info: T?
    let results: [LocationResult]?
}

struct LocationResult: Codable, Identifiable {
    let id: Int?
    let name: String?
    let type: String?
    let dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}

