//
//  CoreDataStack.swift
//  IdigueApi
//
//  Created by jessica bai on 11/8/23.
//

import Foundation
import CoreData

class CoreDataStack {
//persistantcoo:NSPersistentStoreCoordinator=new pers
    lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType) //
    //managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
    return managedObjectContext
    }()}
