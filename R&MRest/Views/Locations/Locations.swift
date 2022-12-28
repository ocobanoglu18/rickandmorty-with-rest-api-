//
//  Locations.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 2.11.2022.
//

import SwiftUI

struct Locations: View {
    @StateObject private var viewModelLocation: LocationViewViewModel = .init()
    @State private var searchText = ""

    @ObservedObject var locationViewModel = LocationViewViewModel()

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(locationViewModel.locationResponse) { location in
                        VStack {
                            NavigationLink(destination: LocationDetailView(location: location)) {
                                LocationCardView(location: location)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .padding(.horizontal)
                            }
                            Divider()
                        }
                    }
                }
            }
            .onAppear {
                locationViewModel.initialize()
            }

            .navigationTitle("Locations")
        }
    }
}

struct Locations_Previews: PreviewProvider {
    static var previews: some View {
        Locations()
    }
}

