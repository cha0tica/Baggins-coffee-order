//
//  CartManager.swift
//  baggins
//
//  Created by Agata on 22.08.2023.
//

import Foundation


struct CartProduct: Identifiable {
    var id: UUID = UUID()
    var coffee: Coffee
    var selectedSizeIndex: Int
    var productCount: Int
}

class CartManager: ObservableObject {
    @Published var cartProducts: [CartProduct] = []
    @Published private(set) var total: Int = 0
    
    func addToCart(product: Coffee, selectedSizeIndex: Int) {
        if let existingProductIndex = cartProducts.firstIndex(where: { $0.coffee == product && $0.selectedSizeIndex == selectedSizeIndex }) {
            cartProducts[existingProductIndex].productCount += 1
        } else {
            let cartProduct = CartProduct(coffee: product, selectedSizeIndex: selectedSizeIndex, productCount: 1)
            cartProducts.append(cartProduct)
        }
    }
    
    
    func removeFromCart(product: Coffee, selectedSize: CoffeeSize?) {
        if let existingProductIndex = cartProducts.firstIndex(where: { $0.coffee == product }) {
            cartProducts.remove(at: existingProductIndex)
            if let size = selectedSize {
                total -= size.price * cartProducts[existingProductIndex].productCount
            }
        }
    }
    
    func getProductCount(product: Coffee, selectedSizeIndex: Int) -> Int {
        if let existingProductIndex = cartProducts.firstIndex(where: { $0.coffee == product && $0.selectedSizeIndex == selectedSizeIndex }) {
            return cartProducts[existingProductIndex].productCount
        }
        return 0
    }
}
