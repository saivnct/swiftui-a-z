//
//  Persistence.swift
//  6-Devote
//
//  Created by giangbb on 15/11/2022.
//

import CoreData

struct PersistenceController {
    // MARK: -  1. SINGLETON PERSISTENT CONTROLLER
    //PersistenceController set up the model context and store coordinator all at once
    static let shared = PersistenceController()

    
    // MARK: -  2. PERSISTENT CONTAINER
    //PersistentContainer is the storage property for core data. Using PersistentContainer is the preferred way to initialize core data stack and load core data model later 
    let container: NSPersistentContainer

    // MARK: -  3. INITIALIZATION (load the persistent store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "__Devote") //referring the data model
        if inMemory {
            //using in memory storage (non disk storage) perfect for unit testing and SwiftUI preview
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")    // path to temporary storage
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })  //load the store (persistent or temporary)
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    // MARK: -  4. PREVIEW
    //Using in-memory store for providing sample data to the preview is optional, but highly recommended
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true) //switch to in memory store
        let viewContext = result.container.viewContext

        //set up sample data for the preview
        for i in 0..<1 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task No\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()  //save to in-memory storage
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
