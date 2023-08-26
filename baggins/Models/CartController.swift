//
//  CartController.swift
//  baggins
//
//  Created by Agata on 25.08.2023.
//

import SwiftUI

class CartController: ObservableObject {
    @Published private(set) var coffeeList : [CoffeeCartCard] = []
    @Published private(set) var total: Int = 0
    @Published private(set) var numberOfProducts: Int = 0
    //@Published private(set) var cartItems: [CoffeeCartCard] = []
    
    /*func addToCart(coffee: Coffee, selectedSizeIndex: Int) {
        let selectedSize = coffee.sizes[selectedSizeIndex]
        coffeeList.append(coffee)
        total += selectedSize.price
        numberOfProducts = coffeeList.count
    }*/
    
    func addToCart(coffee: Coffee, selectedSizeIndex: Int) {
        let cartItem = CoffeeCartCard(id: UUID().uuidString, image: coffee.image, coffee: coffee.coffee, size: coffee.sizes[selectedSizeIndex].size, price: coffee.sizes[selectedSizeIndex].price, selectedSizeIndex: selectedSizeIndex)
        coffeeList.append(cartItem)
        total += coffee.sizes[selectedSizeIndex].price
        numberOfProducts = coffeeList.count
    }
    
    func removeFromCart(cartItemID: String) {
        if let existingCartItemIndex = coffeeList.firstIndex(where: { $0.id == cartItemID }) {
            let selectedCartItem = coffeeList[existingCartItemIndex]
            let selectedSizePrice = selectedCartItem.price
            coffeeList.remove(at: existingCartItemIndex)
            total -= selectedSizePrice
            numberOfProducts = coffeeList.count
        }
    }

    
    /*func removeFromCart(coffee: Coffee, selectedSizeIndex: Int) {
        let selectedSize = coffee.sizes[selectedSizeIndex]
        if let existingProductIndex = coffeeList.firstIndex(where: { $0 == coffee }) {
            coffeeList.remove(at: existingProductIndex)
            total -= selectedSize.price
            numberOfProducts = coffeeList.count
        }
    }*/
}
