//
//  RickAndMortyService.swift
//  R&MRest
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import Foundation
import Combine

protocol RickAndMortyService {
    func getAllCharacters () -> AnyPublisher<Characters,Error>
    func getAllLocations() -> AnyPublisher<PagedLocation, Error>
    func getAllEpisode() -> AnyPublisher<PagedEpisode, Error>
    func getAllLocationbyID(charID:Int) -> AnyPublisher<Location, Error>
}
