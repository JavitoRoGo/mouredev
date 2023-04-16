//
//  ListDetailView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 5/11/21.
//

import SwiftUI

struct ListDetailView: View {
    
    var programmer: Programmer
    @Binding var favorite: Bool
    //Binding es una variable que le viene dado el valor de otra vista y puede modificarse
    
    var body: some View {
        VStack {
            programmer.avatar.resizable().frame(width: 200, height: 200).clipShape(Circle()).overlay(Circle().stroke(Color.black, lineWidth: 4)).shadow(color: .gray, radius: 5)
            HStack {
                Text(programmer.name).font(.largeTitle)
                Button {
                    favorite.toggle()
                } label: {
                    if favorite {
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star").foregroundColor(.black)
                    }
                }
            }
            Text(programmer.languages).font(.title)
            Spacer()
        }
    }
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(programmer: Programmer(id: 1, name: "Brais Moure", languages: "Swift, Kotlin", avatar: Image(systemName: "person"), favorite: true), favorite: .constant(false))
    }
}
