//
//  Episode.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 4.11.2022.
//

import Foundation

enum EpisodeViewModelState {
    case initial
    case loading
    case loaded(episode: PagedEpisode)
    case error(errorMessage: String)
}

struct PagedEpisode: Codable {
    let info: Info
    let results: [Episode]
}

struct Episode: Identifiable, Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
}

