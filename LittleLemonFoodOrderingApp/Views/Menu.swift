//
//  Menu.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
                    Text("Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("Chicago")
                        .font(.title2)
                        .padding(.top, 10)
                    
                    Text("Order easily with Little Lemon: browse the menu, customize, pay securely, and track your delivery in real-time.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding([.top, .leading, .trailing], 10)
                    
                    List {
                    }
                    .padding(.top, 10)
                }
                .padding()
            }
}

#Preview {
    Menu()
}
