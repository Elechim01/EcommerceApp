//
//  HomeViewModel.swift
//  EcommerceApp (iOS)
//
//  Created by Michele Manniello on 28/11/21.
//

import SwiftUI

//using Combine to monitor search field if users leaves for .5 secs then starts searching...
//to avoid memory issue..
import Combine

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
    @Published var searchActivated: Bool = false
    @Published var searchedProducts: [Product]?
    
//    Search Data..
    @Published var searchText: String = ""
    
    var searchCancellable: AnyCancellable?
    
    init(){
        filterProductByType()
        
        searchCancellable = $searchText.removeDuplicates()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink(receiveValue: { str in
                if str != ""{
                    self.filterProductBySearch()
                }else{
                    self.searchedProducts = nil
                }
            })
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
    
    func filterProductBySearch(){
//        filtering product By Product Type...
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
//            Since it will require more memory so were using lazy to perform more...
                .lazy
                .filter { product in
                    return product.title.lowercased().contains(self.searchText.lowercased())
                }

            DispatchQueue.main.async {
                self.searchedProducts = result.compactMap({ product in
                    return product
                })
            }
        }
    }
}

