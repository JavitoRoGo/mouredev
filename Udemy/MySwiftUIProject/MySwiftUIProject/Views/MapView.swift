//
//  MapView.swift
//  MySwiftUIProject
//
//  Created by Javier Rodríguez Gómez on 4/11/21.
//

import SwiftUI
// Para crear un mapa no hay componentes específicos en SwiftUI asi que lo hacemos como en UIKit
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> some MKMapView {
        //esta función devuelve la vista de mapkit
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //esta función es para trabajar o modificar la vista
        let coodinate = CLLocationCoordinate2D(latitude: 40.4380638, longitude: -3.7495762)
        let span = MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2)
        let region = MKCoordinateRegion(center: coodinate, span: span)
        
        uiView.setRegion(region, animated: true)
    }
        
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
