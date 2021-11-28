//
//  MoreProductsView.swift
//  EcommerceApp (iOS)
//
//  Created by Michele Manniello on 28/11/21.
//

import SwiftUI

struct MoreProductsView: View {
    var body: some View {
        VStack{
            Text("More Products")
                .font(.custom(customFont, size: 24).bold())
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white.ignoresSafeArea())
    }
}

struct MoreProductsView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductsView()
    }
}
