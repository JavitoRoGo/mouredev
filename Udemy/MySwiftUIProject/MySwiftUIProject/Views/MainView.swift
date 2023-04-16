//
//  MainView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 4/11/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView {
            VStack {
                MapView()
                    .frame(height: 400)
                ImageView()
                    .offset(y: -150)
                Divider()
                    .padding()
                ContentView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainView()
            MainView()
                .preferredColorScheme(.dark)
                .previewDevice("iPad (9th generation)")
        }
    }
}
