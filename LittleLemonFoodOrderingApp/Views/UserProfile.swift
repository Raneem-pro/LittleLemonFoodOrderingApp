//
//  UserProfile.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

import SwiftUI

let kPhoneKey = "uniquePhoneKey"

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.presentationMode) private var  presentationMode: Binding<PresentationMode>
    @State var  firstName = UserDefaults.standard.string(forKey: kFirstNameKey) ?? ""
    @State var  lastName = UserDefaults.standard.string(forKey: kLastNameKey) ?? ""
    @State var  email = UserDefaults.standard.string(forKey: kEmailKey) ?? ""
    @State var phoneNumber = UserDefaults.standard.string(forKey: kPhoneKey) ?? "966"
    @State var isOrderStatesSelected = false
    @State var isPasswordChangeSelected = false
    @State var isSpecialOffersSelected = false
    @State var isNewsLtterSelected = false
    @State var isHome = false

    var body: some View {
        ScrollView{
            ZStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrowshape.left.fill")
                            .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .background(Color.primaryColor1)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }

                    Spacer()
                }.padding(.horizontal)
                Header()
            }
            GroupBox{
                    VStack(alignment: .leading){
                        Text("Personal information")
                            .font(.title3)
                            .bold()
                        Text("avatar")
                         .foregroundStyle(.secondary)
                        HStack{
                            Image("profile-image-placeholder")
                                .resizable()
                                .frame(width: 100, height: 100)
                            Button {
                                
                            } label: {
                                Text("Change")
                                    .frame(width: 100 ,height: 50)
                                    .background(Color.primaryColor1)
                                    .cornerRadius(10)
                                    .foregroundColor(.white)
                            }
                            
                            Button {
                                
                            } label: {
                                Text("Remove")
                                    .frame(width: 100 , height: 50)
                                    .border(Color.primaryColor1)
                                    .foregroundColor(.secondary)
                            }


                        }
                        VStack(alignment : .leading, spacing:0){
                            Text("First name")
                            TextField("First name" ,text: $firstName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom)
                            Text("Last name")
                                .padding(.top)
                            TextField("Last name" ,text: $lastName)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom)
                            Text("Email")
                                .padding(.top)
                            TextField("Email" ,text: $email)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom)
                            Text("Phone number")
                                .padding(.top)
                            TextField("Phone number" ,text: $phoneNumber)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(.roundedBorder)
                                .padding(.bottom)
                        }.padding(.vertical)
                        
                        Text("Email notificationa")
                            .font(.title3)
                            .bold()
                        Toggle(isOn: $isOrderStatesSelected) {
                                Text("Order States")
                            }
                         .toggleStyle(CustomCheckboxToggleStyle())
                          Toggle(isOn: $isPasswordChangeSelected) {
                                    Text("Password Change")
                            }
                            .toggleStyle(CustomCheckboxToggleStyle())
                         Toggle(isOn: $isSpecialOffersSelected) {
                                Text("Special Offers")
                            }
                         .toggleStyle(CustomCheckboxToggleStyle())
                         Toggle(isOn: $isNewsLtterSelected) {
                                    Text("News Letter")
                            }
                            .toggleStyle(CustomCheckboxToggleStyle())

                }
                VStack{
                    Button {
                        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                        self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("Log out")
                            .foregroundStyle(Color.black)
                    }.frame(width: 370 , height: 50)
                        .background(Color.main)
                        .cornerRadius(10)
                        .padding(.vertical)
                    
                    HStack {
                        Button {
                            firstName = UserDefaults.standard.string(forKey: kFirstNameKey) ?? ""
                            lastName = UserDefaults.standard.string(forKey: kLastNameKey) ?? ""
                            email = UserDefaults.standard.string(forKey: kEmailKey) ?? ""
                            phoneNumber = UserDefaults.standard.string(forKey: kPhoneKey) ?? "966"
                            isOrderStatesSelected = false
                            isPasswordChangeSelected = false
                            isSpecialOffersSelected = false
                            isNewsLtterSelected = false

                        } label: {
                            Text("Discard changes")
                                        .foregroundColor(.secondary)
                                        .frame(width: 160 , height: 50)
                                        .background(
                                            RoundedRectangle(
                                                cornerRadius: 10,
                                                style: .continuous
                                            )
                                            .stroke(.primaryColor1, lineWidth: 1)

                                        )
                        }
                        
                        
                        Button {
                            if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                                if Onboarding.isValidEmail(email) {
                                    UserDefaults.standard.set(firstName, forKey: kFirstNameKey)
                                    UserDefaults.standard.set(lastName, forKey: kLastNameKey)
                                    UserDefaults.standard.set(email, forKey: kEmailKey)
                                }
                            } else {
                                print("There are an empty field")
                            }

                        } label: {
                            Text("Save changes")
                                .frame(width: 160 , height: 50)
                                .background(Color.primaryColor1)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                    }.padding(.top)

                }.padding(.top)
            }.frame(maxWidth: .infinity , maxHeight: .infinity)
            .backgroundStyle(Color.white)
            .border(Color.secondary)
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    UserProfile()
}

struct CustomCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundColor(configuration.isOn ? .primaryColor1 : .gray)
                configuration.label
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
