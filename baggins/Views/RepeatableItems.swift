//
//  RepeatableItems.swift
//  baggins
//
//  Created by Agata on 20.08.2023.
//

import SwiftUI

// Header...
struct TopMenu: View {
    var body: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color("BagginsRed"))
                    .padding(20)
            })
            .frame(height: 40)
            .font(.system(size: 25))
            Spacer()
            Button(action: {}, label: {
                Image(systemName: "bag")
                    .foregroundColor(Color("BagginsRed"))
                    .padding(20)
            })
            .frame(height: 40)
            .font(.system(size: 25))
        }
        .overlay(
            HStack(spacing: 4) {
                Text("BAGGINS COFFEE")
                    .font(.system(size: 20, weight: .bold))
            }
        )
        .padding()    }
}

// Small Coffee Card...
struct CoffeeCard: View {
    let coffee: Coffee
    
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
                    Text("\(coffee.size) мл")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    
                    Text("\(coffee.price) ₽")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                }
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundColor(Color("BagginsRed"))
                })
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
