//
//  EpisodeViewViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 10.11.2022.
//

import Foundation
import Combine
import SwiftUI



class EpisodeViewViewModel: ObservableObject {
    let service = Service.shared
    
    @Published var episodeResponse = [EpisodeResult]()

    func initialize() {
        fetchContent()
    }
    
    func fetchContent() {
        service.fetchRequest(endpointType: endpointType.episode) { [weak self] (response: Result<EpisodesModel<InfoModel>, RickandMortyError>) in
            switch response {
            case .success(let model):
                guard let results = model.results else { return }
                self?.episodeResponse = results
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
}
    
    
  


