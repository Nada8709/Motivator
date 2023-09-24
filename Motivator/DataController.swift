//
//  DataController.swift
//  Motivator
//
//  Created by NadaAshraf on 25/09/2023.
//

import CoreData
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "WidgetModel")
   
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
