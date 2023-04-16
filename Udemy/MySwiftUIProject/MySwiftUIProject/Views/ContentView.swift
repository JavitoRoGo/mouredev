//
//  ContentView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 3/11/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("¡Hola mundo!")
                .font(.largeTitle)
                .foregroundColor(Color.orange)
                .padding()
                .background(Color.gray)
            
            Spacer()
            
            ZStack {
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray)
                    .padding()
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.green)
                    .padding(40)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.red)
                    .padding(60)
                Text("")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.blue)
                    .padding(80)
                Text("Ejemplo de ZStack")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                    .padding(100)
            }
            
            Spacer()
            
            HStack {
                Text("Estoy empezando con SwiftUI")
                    .padding()
                    .background(Color.gray)
                
                Spacer()
                
                Text("¡Y me encanta!")
                    .padding()
                    .background(Color.gray)
            }
            
            VStack {
                Text("6")
                Text("7")
                Text("8")
                Text("9")
                Text("10")
                Text("11")
                Text("12")
                Text("13")
                Text("14")
                VStack {
                    Text("15")
                    Text("16")
                    Text("17")
                    //esto lo hacemos así para saber cómo poner muchas vistas o elementos, porque cada stack lleva máximo 10 vistas
                }
            }
        }
        .padding()
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
