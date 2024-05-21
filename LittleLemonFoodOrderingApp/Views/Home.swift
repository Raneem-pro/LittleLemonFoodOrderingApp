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
        NavigationStack{
            NavigationLink {
                UserProfile()
            } label: {
                Header()
            }

           Menu()
       
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
