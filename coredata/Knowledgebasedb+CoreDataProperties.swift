//
//  Knowledgebasedb+CoreDataProperties.swift
//  IdigueApi
//
//  Created by jessica bai on 11/16/23.
//
//

import Foundation
import CoreData


extension Knowledgebasedb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Knowledgebasedb> {
        return NSFetchRequest<Knowledgebasedb>(entityName: "Knowledgebasedb")
    }

    @NSManaged public var contents: String?
    @NSManaged public var id: Int64
    @NSManaged public var timeofupdate: Date?
    @NSManaged public var title: String?

}

extension Knowledgebasedb : Identifiable {

}
