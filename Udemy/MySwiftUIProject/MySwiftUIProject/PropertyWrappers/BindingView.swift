//
//  BindingView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 6/11/21.
//

import SwiftUI

struct BindingView: View {
    /*
     Binding se usa en la vista que recibe el envío de la variable
     Hace que la variable se pueda mutar, pero ésta no se ha creado en la vista que la maneja
     
     Para recibir el envío de objetos complejos se usa ObservedObject
     */
    @Binding var value: Int
    @ObservedObject var user: UserData
    @State private var selection: Int?
    
    var body: some View {
        VStack {
            Text("El valor actual es \(value)")
            Button("Suma 2") {
                value += 2
            }
            Text("Mi nombre es \(user.name) y mi edad es \(user.age)")
            Button("Actualizar datos") {
                user.name = "MoureDev by Brais Moure"
                user.age = 30
            }
            NavigationLink(destination: EnvironmentView(), tag: 1, selection: $selection) {
                Button("Ir a EnvironmentView") {
                    selection = 1
                }
            }
        }
    }
}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView(value: .constant(5), user: UserData())
    }
}
