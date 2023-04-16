//
//  EnvironmentView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 6/11/21.
//

import SwiftUI

/*
 Se usa EnvironmentObject cuando queremos pasar una propiedad a más de una vista, y no solo a una segunda, sino a una tercera...
 Este wrapper hace que podamos acceder a esa propiedad desde cualquier punto de nuestra app, pero si no lo hemos definido previamente nos va a dar error
 */

struct EnvironmentView: View {
    @EnvironmentObject var user: UserData
    
    var body: some View {
        VStack {
            Text(user.name)
            Text("\(user.age)")
        }
    }
}

struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().environmentObject(UserData())
    }
}
