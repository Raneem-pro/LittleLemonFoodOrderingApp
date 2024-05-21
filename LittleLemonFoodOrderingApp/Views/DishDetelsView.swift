//
//  DishDetelsView.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 13/11/1445 AH.
//

import SwiftUI

struct DishDetelsView: View {
    var dish: Dish?
    
    var body: some View {
        NavigationStack {
            VStack {
                if let imageUrlString = dish?.image, let imageUrl = URL(string: imageUrlString) {
                    AsyncImage(url: imageUrl) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                }
                if let title = dish?.title {
                    Text("\(title)")
                        .font(.title)
                        .bold()
                }
                if let description = dish?.descriptiondeish {
                    Text("\(description)")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            Spacer()
        }
    }
}
#Preview {
    DishDetelsView()
}
