//
//  Location.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.


import Foundation


enum LocationViewModelState {
case initial
case loading
case loaded(location:PagedLocation)
case error(errorMessage:String)
}

enum LocationViewModelState2 {
case initial
case loading
case loaded(location2:Location)
case error(errorMessage2:String)
}


struct PagedLocation: Codable {
    let info: Info
    let results: [Location]
}

struct Location: Identifiable,Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
}

