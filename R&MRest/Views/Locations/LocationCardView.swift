//
//  LocationCardView.swift
//  R&M
//
//  Created by Adnan Cobanoglu on 7.12.2022.
//

import SwiftUI

struct LocationCardView: View {
    var location: LocationResult?

    var body: some View {
        HStack {
            VStack {
                Text((location?.name)!)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
            }
            Spacer()
            HStack {
                VStack {
                    Text(LocaleKeys.Auth.Dimension.rawValue.locale()).foregroundColor(Color.white).font(.system(size: 12))
                    Text((location?.dimension)!).foregroundColor(Color.white).font(.system(size: 13)).lineLimit(1)
                }
                Image(systemName: "location.viewfinder").foregroundColor(Color.white).padding(.trailing, 15)
            }

        }.background(Color.black)
    }
}

struct LocationCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationCardView()
    }
}

