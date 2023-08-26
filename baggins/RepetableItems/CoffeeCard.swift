//
//  CoffeeCard.swift
//  baggins
//
//  Created by Agata on 23.08.2023.
//

import SwiftUI

// Small Coffee Card...
struct CoffeeCard: View {
    let coffee: Coffee
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            Image(coffee.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(0)
                .cornerRadius(10)
            
            Text(coffee.coffee)
                .fontWeight(.regular)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding(.top, 10)
                .frame(height: 50)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(coffee.sizes.first?.size ?? 0) мл")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text("\(coffee.sizes.first?.price ?? 0) ₽")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }
                Spacer()
                
                //Button(action: {}, label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(Color("BagginsRed"))
                //})
                .frame(height: 40)
                .font(.system(size: 25))
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5) // настройка непрозрачности тени
    }
}
