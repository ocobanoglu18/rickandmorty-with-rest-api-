//
//  Character.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import Foundation

enum CharacterViewModelState {
case initial
case loading
case loaded(characters:Characters)
case error(errorMessage:String)
}


struct Characters : Codable{
    let info: Info?
    let results: [Results]?
}

struct Info : Codable{
    let count:Int//": 826,
    let pages:Int//": 42,
    let next:String//": "https://rickandmortyapi.com/api/character?page=2",
    let prev:String?//": null
}

struct Results: Identifiable,Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin:Location?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct LocationChar:Codable {
    let name:String?
  
}

