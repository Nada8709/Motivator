//
//  MotivatorApp.swift
//  Motivator
//
//  Created by Nada Ashraf on 12/09/2023.
//

import SwiftUI

@main
struct MotivatorApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
