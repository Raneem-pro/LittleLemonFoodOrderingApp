//
//  UserProfile.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    let  firstName = UserDefaults.standard.string(forKey: kFirstNameKey)
    let  lastName = UserDefaults.standard.string(forKey: kLastNameKey)
    let  email = UserDefaults.standard.string(forKey: kEmailKey)

    var body: some View {
        VStack{
            Text("Personal information")
            Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(maxHeight: 75)
                    .clipShape(Circle())
                    .padding(.trailing)
            Text("\(firstName ?? "No")")
            Text("\(lastName ?? "No")")
            Text("\(email ?? "No")")
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
              Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
