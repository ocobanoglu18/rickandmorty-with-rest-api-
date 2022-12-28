//
//  RickAndMortyDataServices.swift
//  R&MRest
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import Foundation
import Combine


class RickAndMortyDataServices: RickAndMortyService {

    
    func getAllCharacters() -> AnyPublisher<Characters, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map({$0.data})
            .decode(type: Characters.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAllLocations() -> AnyPublisher<PagedLocation, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/location")!)
            .map({$0.data})
            .decode(type: PagedLocation.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    func getAllEpisode() -> AnyPublisher<PagedEpisode, Error> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/episode")!)
            .map({$0.data})
            .decode(type: PagedEpisode.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getAllLocationbyID(charID:Int) -> AnyPublisher<Location, Error> {
      
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/episode/\(charID)")!)
            .map({$0.data})
            .decode(type: Location.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    
  
}
