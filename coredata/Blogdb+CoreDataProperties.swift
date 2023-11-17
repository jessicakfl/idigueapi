//
//  Blogdb+CoreDataProperties.swift
//  IdigueApi
//
//  Created by jessica bai on 11/16/23.
//
//

import Foundation
import CoreData


extension Blogdb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Blogdb> {
        return NSFetchRequest<Blogdb>(entityName: "Blogdb")
    }

    @NSManaged public var contents: String?
    @NSManaged public var id: Int64
    @NSManaged public var timeofupdate: Date?
    @NSManaged public var title: String?

}

extension Blogdb : Identifiable {

}
