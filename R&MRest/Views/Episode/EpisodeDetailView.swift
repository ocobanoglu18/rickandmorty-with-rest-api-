//
//  EpisodeDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.
//

import SwiftUI

struct EpisodeDetailView: View {
    @ObservedObject var viewModel: RickAndMortyViewModel = .init()
    @State var liked = false
    var episode: EpisodeResult?
    @ObservedObject var charactersThisEpisode = EpisodeDetailViewModel()
    @ObservedObject var episodeViewModel = EpisodeViewViewModel()
    @State var selectedCharacter: Character?
    @EnvironmentObject var favorites: Favorites
    var episode2: EpisodeResult?

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "text.quote").fontWeight(.bold).padding(.leading)
                Text(episode?.name ?? "").fontWeight(.bold).font(.system(size: 30))
                Spacer()
                Button(favorites.contains(episode!) ? LocaleKeys.Auth.Removefromfavorites.rawValue.locale() : LocaleKeys.Auth.AddtoFavorites.rawValue.locale())
                    {
                        if favorites.contains(episode!) {
                            favorites.remove(episode!)
                        } else {
                            favorites.add(episode!)
                        }
                    }.tint(.indigo)
                    .buttonStyle(.borderedProminent)
                    .padding()
            }

            HStack {
                Image(systemName: "list.dash.header.rectangle").padding(.leading)
                Spacer()
                Text(episode?.episode ?? "")
                Spacer()
            }

            HStack {
                Image(systemName: "calendar").padding(.leading)
                Spacer()
                Text(episode?.airDate ?? "")
                Spacer()
            }
            Spacer()
            HStack {
                Image(systemName: "ellipsis.curlybraces").padding(.leading)
                Spacer()
                Text(episode?.url ?? "")
                Spacer()
            }
            Spacer()
            HStack {
                Text(LocaleKeys.Auth.CharactersinThisEpisode.rawValue.locale()).padding(.leading).font(.system(size: 20)).fontWeight(.bold)
                Spacer()
            }.padding(.top)

            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach(charactersThisEpisode.chars) { character in
                        NavigationLink {
                            CharacterDetailView(selectedCharacter: character)
                        } label: {
                            ZStack(alignment: .bottom) {
                                AsyncImage(url: URL(string: character.image ?? "")) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .cornerRadius(8)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.black)
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .overlay(ProgressView())
                                        .cornerRadius(8)
                                }
                                RoundedRectangle(cornerRadius: 4)
                                    .opacity(0.7)
                                    .frame(width: 150, height: 50).background(CustomColor.cardColor)
                                Text(character.name ?? "")
                                    .foregroundColor(Color.white)
                                    .padding(10)
                            }
                        }
                    }
                }
            }
            Spacer()
        }.background(CustomColor.cardColor)
            .onAppear {
                charactersThisEpisode.initialize(episode: episode!)
            }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView()
    }
}

