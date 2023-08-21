//
//  MainScreen.swift
//  baggins
//
//  Created by Agata on 18.08.2023.
//

import SwiftUI

struct MainScreen: View {
    // Selected Category...
    @State var selectedCategory : Category = categories.first!
    @State private var scrollToCategory: Category?
    
    @State private var isCoffeeModalPresented = false
    @State private var selectedCoffee: Coffee?
    
    @State private var selectedCategoryIndex = 0
    
    private let menuType = ["Классика", "Фирменные напитки", "Сезонное меню"]
    
    var body: some View {
        VStack {
            // Header...
            TopMenu()
            
            // Scrolling Screen...
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { scrollViewProxy in
                    VStack(alignment: .leading, spacing: 15) {
                        
                        // Image...
                        VStack(alignment: .leading, content: {
                            Image("MainImg")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 300)
                                .padding(.bottom)
                        })
                        
                        // Эта часть должна прилепляться...
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                ForEach(menuType.indices, id: \.self) { index in
                                    Text(menuType[index])
                                        .padding(.vertical, 12)
                                        .padding(.horizontal)
                                        .background(selectedCategoryIndex == index ? Color("PaleGray") : Color(.white))
                                        .cornerRadius(15)
                                        .onTapGesture {
                                            withAnimation(.spring()) {
                                                selectedCategoryIndex = index
                                                print(selectedCategoryIndex)
                                                // Выполняем прокрутку к соответствующему разделу
                                                scrollViewProxy.scrollTo(index, anchor: .top)
                                            }
                                        }
                                        .id(index)
                                }
                            }
                            .padding(.horizontal)
                        }
                        .overlay(
                            GeometryReader { proxy in
                                Color.clear.preference(key: ViewOffsetKey.self, value: proxy.frame(in: .global).minY)
                            }
                                .frame(height: 1)
                            , alignment: .top
                        )
                    
                            
                        
                        // Тут заканчивается зона прилепления
                        
                        
                        // Classic Menu...
                        HStack {
                            Text("Классическое меню")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .id(0)
                        
                        // Items...
                        HStack(spacing: 15) {
                            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 15) {
                                ForEach(ClassicItemsMenu) { coffee in
                                    CoffeeCard(coffee: coffee)
                                        .onTapGesture {
                                            selectedCoffee = coffee
                                            print(selectedCoffee)
                                            isCoffeeModalPresented = true
                                        }
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Branded Menu...
                        HStack {
                            Text("Фирменное меню")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                        .id(1)
                        
                        // Items...
                        HStack(spacing: 15) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                                ForEach(BrandedItemsMenu) { coffee in
                                    CoffeeCard(coffee: coffee)
                                }
                            }
                        }
                        .padding(.horizontal)
                        
                        // Season Menu...
                        HStack {
                            Text("Cезонное меню")
                                .fontWeight(.bold)
                                .font(.system(size: 22))
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 20)
                        .id(2)
                        
                        // Items...
                        HStack(spacing: 15) {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                                ForEach(SeasnonItemsMenu) { coffee in
                                    CoffeeCard(coffee: coffee)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    .sheet(isPresented: $isCoffeeModalPresented) {
                        if let selectedCoffee = selectedCoffee {
                            CoffeView(coffee: $selectedCoffee)
                        }
                    }
                }
            }
        }
    }
    
}


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}