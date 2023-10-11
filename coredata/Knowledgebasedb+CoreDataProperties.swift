//
//  Knowledgebasedb+CoreDataProperties.swift
//  IdigueApi
//
//  Created by jessica bai on 10/11/23.
//
//

import Foundation
import CoreData


extension Knowledgebasedb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Knowledgebasedb> {
        return NSFetchRequest<Knowledgebasedb>(entityName: "Knowledgebasedb")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var contents: String?
    @NSManaged public var timeofupdate: Date?

}

extension Knowledgebasedb : Identifiable {

}
