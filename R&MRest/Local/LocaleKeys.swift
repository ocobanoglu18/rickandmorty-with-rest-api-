//
//  LocaleKeys.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.12.2022.
//

import Foundation
import SwiftUI

struct LocaleKeys{
    enum Auth: String{
        case Imagesfromepisodes = "Imagesfromepisodes"
        case Characters = "Characters"
        case Main = "Main"
        case Dead = "Dead"
        case Unknowm = "Unknown"
        case RickMortyAppTitle = "Rick&MortyApp!"
        case CharacterName="CharacterName"
        case CharacterGender="CharacterGender"
        case CharacterType="CharacterType"
        case CharacterCreatedDate="CharacterCreatedDate"
        case CharacterSpecies="CharacterSpecies"
        case CharacterStatus="CharacterStatus"
        case DetailView="DetailView"
        case Episodes="Episodes"
        case Removefromfavorites="Removefromfavorites"
        case AddtoFavorites="AddtoFavorites"
        case CharactersinThisEpisode="CharactersinThisEpisode"
        case ResidentinThisLocations="ResidentinThisLocations"
        case Dimension="Dimension"
    }
}

extension String {
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}

