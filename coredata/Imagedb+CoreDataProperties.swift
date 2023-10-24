//
//  Imagedb+CoreDataProperties.swift
//  IdigueApi
//
//  Created by jessica bai on 10/11/23.
//
//

import Foundation
import CoreData
import UIKit

extension Imagedb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Imagedb> {
        return NSFetchRequest<Imagedb>(entityName: "Imagedb")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var imagebinary: Data?
    @NSManaged public var timeofupdate: Date?
    @NSManaged public var uid: Int64

}

extension Imagedb : Identifiable {

}
