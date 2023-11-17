//
//  Imagedb+CoreDataProperties.swift
//  IdigueApi
//
//  Created by jessica bai on 11/16/23.
//
//

import Foundation
import CoreData


extension Imagedb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Imagedb> {
        return NSFetchRequest<Imagedb>(entityName: "Imagedb")
    }

    @NSManaged public var id: Int64
    @NSManaged public var imagebinary: Data?
    @NSManaged public var name: String?
    @NSManaged public var timeofupdate: Date?
    @NSManaged public var uid: Int64

}

extension Imagedb : Identifiable {

}
