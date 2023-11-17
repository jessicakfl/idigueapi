//
//  Knowledgebasedb.swift
//  IdigueApi
//
//  Created by jessica bai on 11/17/23.
//

import Foundation
import CoreData

extension Knowledgebasedb {
    static func withid(id:Int64, context:NSManagedObjectContext)-> Knowledgebasedb {
        let request = fetchRequest(NSPredicate(format: "id = %@", String(id)))
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let knows = try? context.fetch(request) ?? []
        if let know = knows?.first{
            return know
        }else{
            let know = Knowledgebasedb(context: context)
            know.id=id
            return know
        }
    }
    static func update( know:Knowledgebase,context:NSManagedObjectContext){
        if let id = know.id {
            let know = self.withid(id: Int64(id)!, context: context)
            know.title=know.title
            know.contents = know.contents
            try? context.save()
            
        }
    }
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Knowledgebasedb> {
        let request = NSFetchRequest<Knowledgebasedb>(entityName: "Knowledgebasedb")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = predicate
        return request
    }
}
