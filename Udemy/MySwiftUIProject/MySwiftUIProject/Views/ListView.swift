//
//  ListView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 5/11/21.
//

import SwiftUI

final class ProgrammersModelData: ObservableObject {
    @Published var programmers = [Programmer(id: 0, name: "Brais Moure", languages: "Swift, Kotlin", avatar: Image(systemName: "person"), favorite: true),
                               Programmer(id: 1, name: "Ana", languages: "Java, Kotlin", avatar: Image(systemName: "person.fill"), favorite: false),
                               Programmer(id: 2, name: "Pablo", languages: "C++, C#", avatar: Image(systemName: "person"), favorite: false),
                               Programmer(id: 3, name: "Sara", languages: "JavaScript", avatar: Image(systemName: "person.fill"), favorite: true),
                               Programmer(id: 4, name: "Carlos", languages: "Go, Python", avatar: Image(systemName: "person"), favorite: false)]
}

struct ListView: View {
    //recordar que private es para que no se pueda usar fuera de nuestra vista
    @State private var showFavorites = false
    @EnvironmentObject var programmersModelData: ProgrammersModelData
    
    private var filteredProgrammers: [Programmer] {
        return programmersModelData.programmers.filter { programer in
            return !showFavorites || programer.favorite
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $showFavorites) {
                    Text("Mostrar favoritos")
                }.padding()
                
                List(filteredProgrammers, id: \.id) { programmer in
                    NavigationLink(destination: ListDetailView(programmer: programmer, favorite: $programmersModelData.programmers[programmer.id].favorite)) {
                        RowView(programmer: programmer)
                        
                    }
                }
            }.navigationTitle("Programmers")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView().environmentObject(ProgrammersModelData())
        }
            
    }
}
