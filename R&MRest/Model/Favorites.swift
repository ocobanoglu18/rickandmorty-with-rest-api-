//
//  Favorites.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.


import Foundation


class Favorites: ObservableObject {
    // the actual resorts the user has favorited
    private var resorts: Set<Int>

    // the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"

    init() {
        // load our saved data

        // still here? Use an empty array
        resorts = []
    }

    // returns true if our set contains this resort
    func contains(_ resort: EpisodeResult) -> Bool {
        resorts.contains(resort.id!)
    }

    // adds the resort to our set, updates all views, and saves the change
    func add(_ resort: EpisodeResult) {
        objectWillChange.send()
        resorts.insert(resort.id!)
        save()
    }

    // removes the resort from our set, updates all views, and saves the change
    func remove(_ resort: EpisodeResult) {
        objectWillChange.send()
        resorts.remove(resort.id!)
        save()
    }

    func save() {
        // write out our data
    }
}

