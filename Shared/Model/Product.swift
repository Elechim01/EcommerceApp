//
//  Product.swift
//  EcommerceApp (iOS)
//
//  Created by Michele Manniello on 28/11/21.
//

import SwiftUI

enum ProductType:String,CaseIterable {
    case Wearable = "Warable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

//Product Model...
struct Product: Identifiable,Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}
