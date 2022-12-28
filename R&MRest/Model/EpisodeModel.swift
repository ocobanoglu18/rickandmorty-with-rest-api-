//
//  EpisodeModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 25.11.2022.
//

import Foundation

struct EpisodesModel<T:Codable>: Codable {
    let info: T?
    let results: [EpisodeResult]?
}

struct EpisodeResult: Codable, Identifiable {
    let id: Int?
    let name: String?
    let airDate: String?
    let episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

    enum CodingKeys: String, CodingKey {
        case id, name, airDate = "air_date", episode, characters, url, created
    }
}

