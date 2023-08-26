//
//  CartView.swift
//  baggins
//
//  Created by Agata on 23.08.2023.
//

import SwiftUI

struct CartView: View {
    
    // @Binding var coffee: Coffee?
        @Environment(\.presentationMode) var presentationMode
        @EnvironmentObject var cartController: CartController
        //@EnvironmentObject var cartManager: CartManager
        @State private var selectedSizeIndex = 0 // Индекс выбранного размера
        @State var numberOfProducts: Int = 0
    
    
    var body: some View {
        VStack{
            
            if cartController.coffeeList.count > 0 {
                ScrollView(){
                    VStack(alignment: .leading, spacing: 0){
                        
                        Text("Ваш заказ:")
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .padding()
                        
                        
                        ForEach(cartController.coffeeList) { cartItem in
                            NavigationLink {
                                CartProductView(coffeeCard: cartItem) // Передаем coffeeCard
                            } label: {
                                CartProductView(coffeeCard: cartItem) // Передаем coffeeCard
                            }
                        }

                        

                        HStack{
                            Text("Всего: ")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                            Text("\(cartController.total) ₽")
                                .bold()
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                        }
                        .padding()
                        
                        Button(action: {}) {
                            Text("Заказать")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("BagginsRed"))
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                    //.padding()
                }
                
                
                
                
            }else{
                VStack(spacing: 10){
                    Image(systemName: "cup.and.saucer")
                        .resizable()
                        .frame(width: 200,height: 170)
                        .opacity(0.2)
                        .foregroundColor(.gray)
                    
                    Text("""
                         В вашей корзине нет
                         вкусного кофе :(
                        """)
                    .opacity(0.4)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
                    .padding()
                    .multilineTextAlignment(.center)
                }
                
            }
            
            
        }
        .padding(.top)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true) // Скрытие стандартной кнопки "Back"
        .navigationBarItems(leading:
                                Image(systemName: "arrow.backward")
            .foregroundColor(Color("BagginsRed"))
            .font(.system(size: 20))
            .padding(.horizontal, 20)
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
        )
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
