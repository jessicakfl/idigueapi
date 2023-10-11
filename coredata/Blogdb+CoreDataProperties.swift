//
//  Blogdb+CoreDataProperties.swift
//  IdigueApi
//
//  Created by jessica bai on 10/11/23.
//
//

import Foundation
import CoreData


extension Blogdb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Blogdb> {
        return NSFetchRequest<Blogdb>(entityName: "Blogdb")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var contents: String?
    @NSManaged public var timeofupdate: Date?

}

extension Blogdb : Identifiable {

}
