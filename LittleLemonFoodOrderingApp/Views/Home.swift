//
//  Home.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

import SwiftUI

struct Home: View {
    @State var persistence = PersistenceController.shared
    var body: some View {
        TabView{
           Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .environment(\.managedObjectContext, persistence.container.viewContext)
            UserProfile()
                 .tabItem {
                     Label("Profile", systemImage: "square.and.pencil")
                 }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
