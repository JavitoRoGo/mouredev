//
//  ImageView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 4/11/21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("paisaje")
            //OJO: el orden en que apliquemos los comandos es importante
            //ajuste de tamaño a la pantalla
                .resizable()
            //margen a la imagen dentro de su vista
                .padding(50)
            //tamaño de la vista
                .frame(width: 300, height: 300, alignment: .center)
            //color de fondo
                .background(Color.gray)
            //hacer la imagen circular
                .clipShape(Circle())
            //poner un borde
                .overlay(Circle().stroke(lineWidth: 4))
            //agregar sombra
            .shadow(color: .gray, radius: 5)
            
            Image(systemName: "person.fill.badge.minus")
                .resizable()
                .padding(50)
                .frame(width: 300, height: 300, alignment: .center)
                .background(Color.brown)
                .clipShape(Circle())
                .overlay(Circle().stroke(lineWidth: 4))
                .shadow(color: .gray, radius: 5)
                .foregroundColor(.pink)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
