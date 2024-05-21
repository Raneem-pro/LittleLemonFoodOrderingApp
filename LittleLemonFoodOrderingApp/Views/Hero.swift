//
//  Hero.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 12/11/1445 AH.
//

import SwiftUI

struct Hero: View {
    var body: some View {
                HStack {
                    VStack {
                        Text("Little Lemon")
                            .foregroundColor(Color.main)
                            .font(Font.custom("Markazi Text", size: 42).weight(.medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Chicago")
                            .foregroundColor(.white)
                            .font(Font.custom("Markazi Text", size: 22))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.bottom)
                        Text("""
                         We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                         """)
                        .foregroundColor(.white)
                        .font(Font.custom("Karla", size: 16).weight(.medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Image("Hero image")
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(maxWidth: 120, maxHeight: 140)
                        .clipShape(Rectangle())
                        .cornerRadius(16)
                }
        }
    }

#Preview {
    Hero()
        .padding()
        .background(Color.primaryColor1)
        .frame(maxWidth: .infinity, maxHeight: 240)
        
}
