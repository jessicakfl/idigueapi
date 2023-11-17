//
//  Imagedb.swift
//  IdigueApi
//
//  Created by jessica bai on 11/15/23.
//

import Foundation
import CoreData

extension Imagedb {
    static func withid(id:Int64, context:NSManagedObjectContext)-> Imagedb {
        let request = fetchRequest(NSPredicate(format: "id = %@", String(id)))
       // request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let imgs = try? context.fetch(request) ?? []
        if let img = imgs?.first{
            return img
        }else{
            let img = Imagedb(context: context)
            img.id=id
            return img
        }
    }
    static func update( image:Image,context:NSManagedObjectContext){
        if let id = image.id {
            let img = self.withid(id: Int64(id)!, context: context)
            img.name=image.name
            let imagedata = Data(image.imagebinary?.utf8 ?? "".utf8)
            img.imagebinary = imagedata
            try? context.save()
            
        }
    }
    static func fetchRequest(_ predicate: NSPredicate) -> NSFetchRequest<Imagedb> {
        let request = NSFetchRequest<Imagedb>(entityName: "Imagedb")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.predicate = predicate
        return request
    }
}
