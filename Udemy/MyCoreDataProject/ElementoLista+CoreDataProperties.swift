//
//  ElementoLista+CoreDataProperties.swift
//  MyCoreDataProject
//
//  Created by Javier Rodríguez Gómez on 31/10/21.
//
//

import Foundation
import CoreData


extension ElementoLista {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementoLista> {
        return NSFetchRequest<ElementoLista>(entityName: "ElementoLista")
    }

    @NSManaged public var nombre: String?

}

extension ElementoLista : Identifiable {

}
