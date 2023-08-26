//
//  CartCard.swift
//  baggins
//
//  Created by Agata on 23.08.2023.
//

import SwiftUI

struct CartProductView: View {
    //@Binding var coffee: Coffee?
       //var coffee: Coffee
       //@StateObject private var cartManager = CartManager()
       @State private var selectedSizeIndex = 0 // Индекс выбранного размера
       @State var numberOfProducts: Int = 0
       @EnvironmentObject var cartController: CartController
    var coffeeCard: CoffeeCartCard
    

    
    var body: some View {
       // if let coffee = coffee {
            HStack(spacing: 20){
                Image(coffeeCard.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                    .cornerRadius(9 )
                
                VStack(alignment: .leading, spacing: 5){
                    Text(coffeeCard.coffee)
                        .fontWeight(.regular)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text("\(coffeeCard.size) мл")
                        .fontWeight(.regular)
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                    
                    Text("\(coffeeCard.price) ₽")
                        .fontWeight(.bold)
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                }
                Spacer()
                
                HStack(spacing: 4){
                        Image(systemName: "trash")
                            .foregroundColor(Color("BagginsRed"))
                            .font(.system(size: 20))
                            .onTapGesture {
                                cartController.removeFromCart(cartItemID: coffeeCard.id)
                            
                    }
                }
                
            }
            .padding()
        }
    }

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        let cartManager = CartController()
        let cartItem = CoffeeCartCard(id: "B0773CB9-07DB-4E0C-AAAF-B507E100A3F0", image: "Americano", coffee: "Американо", size: 250, price: 120, selectedSizeIndex: 0)
        return CartProductView(coffeeCard: cartItem)
                    .environmentObject(cartManager)
    }
}
