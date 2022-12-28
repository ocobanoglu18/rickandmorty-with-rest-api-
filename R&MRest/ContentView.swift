//
//  ContentView.swift
//  R&MRest
//
//  Created by Adnan Cobanoglu on 28.12.2022.
//

import Combine
import SwiftUI

struct CustomColor {
    static let cardColor = Color("cardColor")
}

struct ContentView: View {
    var body: some View {
        TabView {
            CharacterView()
                .tabItem {
                    Image(systemName: "house")
                }
         
            EpisodeView()
                .tabItem {
                    Image(systemName: "list.triangle")
                }
            Locations()
                .tabItem {
                    Image(systemName: "map.circle")
                }
        
        }.accentColor(Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
