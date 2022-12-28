//
//  Episodes.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 4.11.2022.
//

import SwiftUI

struct EpisodeView: View {
    @StateObject private var viewModelEpisode = EpisodeViewViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    @StateObject var favorites = Favorites()

    var body: some View {
        VStack {
            NavigationView {
                ScrollView {
                    VStack(spacing: 2) {
                        ForEach(viewModelEpisode.episodeResponse) { episode in
                            VStack {
                                NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                                    EpisodeCardView(episode: episode)
                                        .background(Color.white)
                                        .cornerRadius(8)
                                        .padding(.horizontal)
                                    if favorites.contains(episode) {
                                        Spacer()
                                        Image(systemName: "heart.fill").foregroundColor(Color.red)
                                    }
                                }
                                Divider()
                            }
                        }
                    }
                }
                .onAppear {
                    viewModelEpisode.initialize()
                }
                .navigationTitle(LocaleKeys.Auth.Episodes.rawValue.locale())
            }.environmentObject(favorites)

                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(LocaleKeys.Auth.Episodes.rawValue.locale()).foregroundColor(Color.white).fontWeight(.bold)
                    }
                }
        }
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView()
    }
}

