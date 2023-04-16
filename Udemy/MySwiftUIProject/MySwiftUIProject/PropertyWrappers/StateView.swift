//
//  StateView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 6/11/21.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var name = "MoureDev"
    @Published var age = 34
    //Para modificar un objeto complejo como una clase, se debe conformar como ObservableObject y sus propiedades como Published
}

struct StateView: View {
    /*
     Recuerda que los struct por definición son inmutables, por lo que necesitamos los wrappers para modificar los parámetros y que puedan mutar
    State se usa cuando una propiedad tiene que cambiar su valor, y será de tipo State en la vista que se va a encargar de modificar su valor
    Por otro lado, en SwiftUI el modificar un valor implica un repintado de la vista, por eso se actualiza el valor al pulsar el botón y cambiar el valor
     
     StateObject es exactamente igual que State pero para objetos complejos
     */
    @State private var value = 0
    @State private var selection: Int?
    @StateObject private var user = UserData()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("El valor actual es \(value)")
                Button("Suma 1") {
                    value += 1
                }
                Text("Mi nombre es \(user.name) y mi edad es \(user.age)")
                Button("Actualizar datos") {
                    user.name = "Brais Moure"
                    user.age = 35
                }
                NavigationLink(destination: BindingView(value: $value, user: user), tag: 1, selection: $selection) {
                    Button("Ir a BindingView") {
                        selection = 1
                    }
                }
                //se pone $ para que pueda mutar y hacer referencia al binding
            }.navigationTitle("StateView")
        }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView().environmentObject(UserData())
    }
}
