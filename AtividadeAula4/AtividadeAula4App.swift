//
//  AtividadeAula4App.swift
//  AtividadeAula4
//
//  Created by Rafael Silva on 21/08/21.
//

import SwiftUI

@main
struct AtividadeAula4App: App {
    let persistenceController = PersistenceController.banco

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext,persistenceController.container.viewContext)
        }
    }
}
