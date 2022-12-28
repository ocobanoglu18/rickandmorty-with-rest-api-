//
//  CharacterDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.11.2022.
// g

import SwiftUI

struct CharacterDetailView: View {
    @State var results: Results?
    @State var location: Location?
    var selectedCharacter: Character?
    var episodes: EpisodeResult?
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    AsyncImage(url: URL(string: selectedCharacter?.image ?? "")) { image in
                        
                        image.resizable()
                            .cornerRadius(10)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 360, height: 320)
                }
                VStack {
                    HStack {
                        Text(LocaleKeys.Auth.CharacterName.rawValue.locale())
                        Spacer()
                        Text(selectedCharacter?.name ?? "").fontWeight(.bold)
                        Spacer()
                    }.padding(.leading).padding(.top)
                    HStack {
                        Text(LocaleKeys.Auth.CharacterGender.rawValue.locale())
                        Spacer()
                        Text(selectedCharacter?.gender?.rawValue ?? "").fontWeight(.bold)
                        Spacer()
                    }.padding(.leading).padding(.top)
                    HStack {
                        Text(LocaleKeys.Auth.CharacterType.rawValue.locale())
                        Spacer()
                        Text(selectedCharacter?.type ?? "").fontWeight(.bold)
                        Spacer()
                    }.padding(.leading).padding(.top)
                    HStack {
                        Text(LocaleKeys.Auth.CharacterCreatedDate.rawValue.locale())
                        Spacer()
                        Text(selectedCharacter?.created ?? "").fontWeight(.bold)
                        Spacer()
                    }.padding(.leading).padding(.top)
                    HStack {
                        Text(LocaleKeys.Auth.CharacterSpecies.rawValue.locale())
                        Spacer()
                        Text(selectedCharacter?.species?.rawValue ?? "").fontWeight(.bold)
                        Spacer()
                    }.padding(.leading).padding(.top)
                    HStack {
                        Text(LocaleKeys.Auth.CharacterStatus.rawValue.locale())
                        Spacer()
                        Text(selectedCharacter?.status?.rawValue ?? "").fontWeight(.bold)
                        Spacer()
                    }.padding(.leading).padding(.top)
                    HStack {
                        Text("Episodes with \((selectedCharacter?.name)!)")
                        
                        ScrollView(.horizontal) {
                            HStack(spacing: 5) {
                                ForEach((selectedCharacter?.episode)!, id: \.self) { episode in
                                    NavigationLink {} label: {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: 50, height: 50, alignment: .center)
                                                .foregroundColor(.purple)
                                            Text("\(episode.getEpisodeNumber())")
                                        }
                                    }
                                }
                            }.frame(height: 80)
                        }
                    }.padding(.leading).padding(.top)
                    
                }.padding(.top)
                Spacer()
                Spacer()
                    .padding(.bottom)
                
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text(LocaleKeys.Auth.DetailView.rawValue.locale()).foregroundColor(Color.white).fontWeight(.bold)
                        }
                    }
            }
        }
        Spacer()
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}

