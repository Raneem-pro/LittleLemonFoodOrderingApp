//
//  Header.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 12/11/1445 AH.
//

import SwiftUI

struct Header: View {
    var body: some View {
        ZStack{
            Image("Logo")
            HStack{
                Spacer()
                Image("profile-image-placeholder")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(maxHeight: 75)
                    .clipShape(Circle())
                    .padding(.trailing)
            }
        }
    }
}

#Preview {
    Header()
}
