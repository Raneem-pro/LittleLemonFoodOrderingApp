//
//  LittleLemonFoodOrderingAppApp.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 01/11/1445 AH.
//

import SwiftUI

@main
struct LittleLemonFoodOrderingAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
