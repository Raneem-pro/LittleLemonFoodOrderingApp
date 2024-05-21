//
//  Onboarding.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

// Global String constants for UserDefaults keys


import SwiftUI

// Global String constants for UserDefaults keys
let kFirstNameKey = "uniqueFirstNameKey"
let kLastNameKey = "uniqueLastNameKey"
let kEmailKey = "uniqueEmailKey"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("Logo")
                VStack {
                    Hero()
                    Spacer()
                }.padding()
                    .background(Color.primaryColor1)
                    .frame(maxWidth: .infinity, maxHeight: 260)
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                TextField("First Name *", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Last Name *", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("Email *", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Register") {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        if Onboarding.isValidEmail(email) {
                            UserDefaults.standard.set(firstName, forKey: kFirstNameKey)
                            UserDefaults.standard.set(lastName, forKey: kLastNameKey)
                            UserDefaults.standard.set(email, forKey: kEmailKey)
                            isLoggedIn = true
                            UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        }
                    } else {
                        print("There are an empty field")
                    }
                }.frame(width: 370 , height: 50)
                    .background(Color.main)
                    .cornerRadius(10)
                    .padding(.vertical)
                    .foregroundColor(.black)
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
            Spacer()
            
        }
        
    }
    
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

#Preview {
    Onboarding()
}
