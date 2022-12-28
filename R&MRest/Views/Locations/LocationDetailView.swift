//
//  LocationDetailView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.12.2022.
//

import SwiftUI

struct LocationDetailView: View {
    var location: LocationResult?
    @ObservedObject var residentThisLocation = LocationDetailViewModel()
    @State var selectedCharacter: Character?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "map")
                        .font(.system(size: 20))
                    Text(location?.dimension ?? "Dimension C-137")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                    Spacer()
                }
                HStack {
                    Image(systemName: "paperclip")
                        .font(.system(size: 20))
                        .padding(.leading, 2)
                    Text(location?.type ?? "Planet")
                        .font(.system(size: 15))
                        .padding(.leading, 3)
                    Spacer()
                }
                Divider()
                    .foregroundColor(Color.black)
                Text(LocaleKeys.Auth.ResidentinThisLocations.rawValue.locale())
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(10)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                    ForEach(residentThisLocation.chars) { character in
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
                                        .background(Color.black)
                                } placeholder: {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color.black)
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .overlay(ProgressView())
                                        .cornerRadius(8)
                                }
                                RoundedRectangle(cornerRadius: 4)
                                    .opacity(0.7)
                                    .frame(width: 150, height: 50)
                                    .background(Color.black)
                                Text(character.name ?? "")
                                    .foregroundColor(Color.white)
                                    .padding(10)
                            }
                        }
                    }
                }

                .onAppear {
                    residentThisLocation.initialize(location: location!)
                }

            }.padding(10)
                .navigationTitle(location?.name ?? "Earth (C-137)")
        }
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView()
    }
}

