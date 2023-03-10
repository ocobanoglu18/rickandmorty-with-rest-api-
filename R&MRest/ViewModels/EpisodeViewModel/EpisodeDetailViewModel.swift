//
//  EpisodeDetailViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.11.2022.
//

import Foundation
class EpisodeDetailViewModel: ObservableObject {
    let service = Service.shared
    @Published var chars = [Character]()
    @Published var showPopup = Bool()

    func initialize(episode: EpisodeResult) {
        getCharactersInThisEpisode(episode: episode)
    }

    func getCharactersInThisEpisode(episode: EpisodeResult) {
        for char in episode.characters! {
            service.fetchOnlyCharRequest(url: char) { [weak self] response in
                switch response {
                case .success(let model):
                    self?.chars.append(model)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

}

