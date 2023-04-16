//
//  RowView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 4/11/21.
//

import SwiftUI

struct RowView: View {
    var programmer: Programmer
    
    var body: some View {
        HStack {
            programmer.avatar
                .resizable()
                .frame(width: 40, height: 40)
                .padding(10)
            
            VStack(alignment: .leading) {
                Text(programmer.name)
                    .font(.title)
                Text(programmer.languages)
                    .font(.subheadline)
            }
            
            Spacer()
            
            if programmer.favorite {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        //aquí se define un dato pero solo para poder ver la preview
        RowView(programmer: Programmer(id: 1, name: "Brais Moure", languages: "Swift, Kotlin", avatar: Image(systemName: "person"), favorite: true))
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
