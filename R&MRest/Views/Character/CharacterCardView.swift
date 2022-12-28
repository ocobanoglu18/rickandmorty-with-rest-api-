//
//  CharacterCardView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 28.11.2022.
//

import SwiftUI

struct CharacterCardView: View {
    var character: Character?
    @State var selectedCharacter: Character?
    @ObservedObject var charactersThisEpisode = EpisodeViewViewModel()
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: URL(string: character?.image ?? "")) { image in
                    
                    image.resizable()
                        .cornerRadius(10)
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 130, height: 120)
            }
            Spacer()
            VStack {
                Spacer()
                Text(character?.name ?? "Rick Sanchez")
                    .font(.system(size: 22)).bold()
                HStack {
                    Text(character?.gender!.rawValue ?? "")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                    
                    Divider().foregroundColor(Color.white).fontWeight(.bold).frame(height: 16)
                    
                    Text(character?.species!.rawValue ?? "")
                        .font(.system(size: 16))
                        .fontWeight(.light)
                }
                Spacer()
            }
            Spacer()
            HStack {
                NavigationLink {
                    CharacterDetailView(selectedCharacter: character)
                } label: {
                    Image(systemName: "arrow.right.circle")
                        .font(.system(size: 25))
                        .padding(.top, 5)
                        .padding(.trailing, 6)
                        .foregroundColor(.white)
                }
            }
            Spacer()
        }.frame(width: 370, height: 70).background(CustomColor.cardColor)
            .cornerRadius(20)
        Divider()
    }
}

struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView()
    }
}

