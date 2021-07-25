//
//  CoreDataManager.swift
//  ToDoApp
//
//  Created by Sabari on 25/07/21.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init() {
        persistentContainer = NSPersistentContainer(name: "ToDoApp")
        persistentContainer.loadPersistentStores { desc, error in
            if let error = error{
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
    
    //Save object to coredata
    func save(){
        do{
            try viewContext.save()
        }
        catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    
    /// Get All Task
    /// - Returns: [Task]
    func getAllTask() -> [Task]{
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        do{
            return try viewContext.fetch(request)
        }
        catch{
            return []
        }
    }
    
}
