//
//  Blogdb.swift
//  IdigueApi
//
//  Created by jessica bai on 11/17/23.
//

import Foundation
import CoreData

extension Blogdb {
    static func withid(id:Int64, context:NSManagedObjectContext)-> Blogdb {
        let request = fetchRequest(NSPredicate(format: "id = %@", String(id)))
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let blogs = try? context.fetch(request) ?? []
        if let blog = blogs?.first{
            return blog
        }else{
            let blog = Blogdb(context: context)
            blog.id=id
            return blog
        }
    }
    static func update( blog:Blog,context:NSManagedObjectContext){
        if let id = blog.id {
            let blog = self.withid(id: Int64(id)!, context: context)
            blog.title=blog.title
            blog.contents = blog.contents
            try? context.save()
            
        }
    }
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Blogdb> {
        let request = NSFetchRequest<Blogdb>(entityName: "Blogdb")
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        request.predicate = predicate
        return request
    }
}
