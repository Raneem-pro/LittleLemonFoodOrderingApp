//
//  Home.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
           Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
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
}
