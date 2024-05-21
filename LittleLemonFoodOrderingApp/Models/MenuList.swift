//
//  MenuList.swift
//  LittleLemonFoodOrderingApp
//
//  Created by رنيم القرني on 11/11/1445 AH.
//

import Foundation

struct MenuList: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: String
    let description: String
    let image: String
    let category : String
}
