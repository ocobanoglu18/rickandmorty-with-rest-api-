//
//  RickAndMortyViewModel.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import Combine
import Foundation

class RickAndMortyViewModel: ObservableObject {
    @Published var charactersState: CharacterViewModelState = .initial
    let rickAndMoortyDataService: RickAndMortyDataServices = .init()
    var cancellable = Set<AnyCancellable>()
    @Published var charList = [Results]()
    @Published var location = [Location]()

    let service = Service.shared
    @Published var rickAndMortyResponse = [Character]()

//    init() {
//        getAllCharacters()
//    }
//
//    func getAllCharacters(){
//        charactersState=CharacterViewModelState.loading
//        rickAndMoortyDataService.getAllCharacters()
//            .sink { [weak self] completion in
//                switch completion{
//
//                case .finished:
//                    print("finish")
//                case .failure(let error):
//                    self?.charactersState=CharacterViewModelState.error(errorMessage: "\(error)")
//                }
//            } receiveValue: { [weak self] Characters in
//                self?.charactersState=CharacterViewModelState.loaded(characters: Characters)
//                self!.charList=Characters.results!
//            }
//            .store(in: &cancellable)
//    }

    func initialize(filter: String) {
        fetchContent(filter: filter)
    }

    func fetchContent(filter: String) {
        service.fetchCharactersRequest(filter: filter, endpointType: endpointType.character) { [weak self] response in
            switch response {
            case .success(let model):
                guard let results = model.results else { return }
                self?.rickAndMortyResponse = results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

