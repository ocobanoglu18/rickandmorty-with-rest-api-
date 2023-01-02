//
//  Favorites.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.


import Foundation


class Favorites: ObservableObject {
    private var resorts: Set<Int>
    private let saveKey = "Favorites"

    init() {

        resorts = []
    }

    func contains(_ resort: EpisodeResult) -> Bool {
        resorts.contains(resort.id!)
    }

    func add(_ resort: EpisodeResult) {
        objectWillChange.send()
        resorts.insert(resort.id!)
        save()
    }

    func remove(_ resort: EpisodeResult) {
        objectWillChange.send()
        resorts.remove(resort.id!)
        save()
    }

    func save() {

    }
}

