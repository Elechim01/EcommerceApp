//
//  HomeViewModel.swift
//  EcommerceApp (iOS)
//
//  Created by Michele Manniello on 28/11/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
//    Sample Products
    @Published var products: [Product] = [
        Product(type: .Wearable, title: "p1", subtitle: "p2", price: "400€",productImage: "p1"),
        Product(type: .Laptops, title: "p2", subtitle: "p3", price: "4000€",productImage: "p2"),
        Product(type: .Phones, title: "p3", subtitle: "p4", price: "700€",productImage: "p3"),
        Product(type: .Tablets, title: "p4", subtitle: "p5", price: "500€",productImage: "p4")
    ]
//    Filtered Products..
    @Published var filteredProducts: [Product] = []
    
//    More products on the type...
    @Published var showMoreProductsOnType: Bool = false
    
    init(){
        filterProductByType()
    }
    
    func filterProductByType(){
//        filtering product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
//            Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
//            Limiting result...
                .prefix(4)
            DispatchQueue.main.async {
                self.filteredProducts = result.compactMap({ product in
                    return product
                })
            }
        }
    }
}

