//
//  CoffeView.swift
//  baggins
//
//  Created by Agata on 20.08.2023.
//

import SwiftUI

struct CoffeView: View {
    @Binding var coffee: Coffee?
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedSizeIndex = 0 // Индекс выбранного размера
    
    var body: some View {
        if let coffee = coffee {
            VStack {
                //TopMenu()
                HStack {
                    Spacer()
                    Button(action: {
                        // Закрыть модальное окно
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title)
                            .foregroundColor(Color("BagginsRed"))
                            .padding()
                    }
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Image(coffee.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .cornerRadius(10)
                        
                        Text(coffee.coffee)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                        
                        Text(coffee.description)
                            .fontWeight(.regular)
                            .font(.system(size: 16))
                            .foregroundColor(.black)
                        
                        //Выбор размера ...
                        Picker(selection: $selectedSizeIndex, label: Text("Объем: ")) {
                            ForEach(coffee.sizes.indices, id: \.self) { index in
                                Text("\(coffee.sizes[index].size) мл")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        //Размер выбрали
                        
                        Text("БЖУ: \(coffee.sizes[selectedSizeIndex].value)")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text("\(coffee.sizes[selectedSizeIndex].price) ₽")
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .foregroundColor(.black)
                        
                        Button(action: {
                            // Добавить в корзину
                        }) {
                            Text("Добавить в корзину")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color("BagginsRed"))
                                .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct CoffeView_Previews: PreviewProvider {
    static var previews: some View {
        let tempCoffee: Coffee? = SeasnonItemsMenu.first // Используйте первый кофе из списка для превью
        
        return CoffeView(coffee: .constant(tempCoffee))    }
}
