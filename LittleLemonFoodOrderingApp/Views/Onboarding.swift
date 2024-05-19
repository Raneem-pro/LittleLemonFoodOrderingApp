//
//  Onboarding.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

// Global String constants for UserDefaults keys
let kFirstNameKey = "uniqueFirstNameKey"
let kLastNameKey = "uniqueLastNameKey"
let kEmailKey = "uniqueEmailKey"
let kIsLoggedIn = "kIsLoggedIn"

import SwiftUI

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                
                TextField("First Name", text: $firstName)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
                       
                TextField("Last Name", text: $lastName)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
                       
                TextField("Email", text: $email)
                           .textFieldStyle(RoundedBorderTextFieldStyle())
                           .padding()
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty{
                        if isValidEmail(email){
                            UserDefaults.standard.set(firstName, forKey: kFirstNameKey)
                            UserDefaults.standard.set(lastName, forKey: kLastNameKey)
                            UserDefaults.standard.set(email, forKey: kEmailKey)
                            isLoggedIn = true
                            UserDefaults.standard.set(true,forKey: kIsLoggedIn)
                        }
                    }else{
                        print("there are an empty field")
                    }
                }
            }.onAppear{
                if UserDefaults.standard.bool(forKey: kIsLoggedIn){
                    isLoggedIn = true
                }
            }
        }
    }
    func isValidEmail(_ email: String) -> Bool {
           let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
           return emailPred.evaluate(with: email)
       }
}

#Preview {
    Onboarding()
}
