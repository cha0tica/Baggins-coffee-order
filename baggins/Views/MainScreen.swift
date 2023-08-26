//
//  MainScreen.swift
//  baggins
//
//  Created by Agata on 18.08.2023.
//

import SwiftUI

struct MainScreen: View {

    @State private var isCoffeeModalPresented = false
        @State private var selectedCoffee = ClassicItemsMenu.first
        //@StateObject private var cartManager = CartManager()
        @State private var selectedCategoryIndex = 0
        //@State var numberOfProducts = 0
        //@EnvironmentObject var cartController: CartController
        @StateObject private var cartController = CartController()
        //@Binding var numberOfProducts: Int
    
//    @State private var isCoffeeModalPresented = false
//    @State private var selectedCoffee = ClassicItemsMenu.first
//    //@StateObject private var cartManager = CartManager()
//    @State private var selectedCategoryIndex = 0
//    //@State var numberOfProducts = 0
//    @EnvironmentObject var cartController: CartController
//    //@StateObject private var cartController = CartController()
//    @Binding var numberOfProducts : Int
    
    private let menuType = ["Классика", "Фирменные напитки", "Сезонное меню"]
    
    var body: some View {
        NavigationView {
            VStack {
                // Header...
                HStack {
                    // Profile
                    Button(action: {}, label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color("BagginsRed"))
                            .padding(20)
                    })
                    .frame(height: 40)
                    .font(.system(size: 25))
                    Spacer()
                    
                    // Logo
                    Text("BAGGINS COFFEE")
                        .font(.system(size: 20, weight: .bold))
                    Spacer()
                    
                    //Cart
                    NavigationLink(destination: CartView()
                        .environmentObject(cartController)){
                            ZStack(alignment: .topTrailing) {
                                Image(systemName: "bag")
                                    .foregroundColor(Color("BagginsRed"))
                                    .font(.system(size: 25))
                                    .padding(.horizontal, 20)
                                if cartController.numberOfProducts > 0{
                                    Text("\(cartController.numberOfProducts)")
                                        .font(.caption2)
                                        .foregroundColor(.white)
                                        .frame(width: 18,height: 18)
                                        .background(.black)
                                        .cornerRadius(50)
                                        .padding(.horizontal, 15)
                                        .padding(.vertical, 1)
                                }
                            }
                        }
                }
                
                .padding()
                
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
                            
                            // ToDo: Эта часть должна прилепляться...
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
                            // ToDo: Тут заканчивается зона прилепления
                            
                            
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
                                            .onTapGesture {
                                                selectedCoffee = coffee
                                                print(selectedCoffee)
                                                isCoffeeModalPresented = true
                                            }
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
                                            .onTapGesture {
                                                selectedCoffee = coffee
                                                print(selectedCoffee)
                                                isCoffeeModalPresented = true
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        .sheet(isPresented: $isCoffeeModalPresented) {
                            if let selectedCoffee = selectedCoffee {
                                CoffeView(coffee: $selectedCoffee)
                                    .environmentObject(cartController)
                            }
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
            .environmentObject(CartController())
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
extension View {
    @ViewBuilder
    func offset(coordinateSpace: CoordinateSpace, complition: @escaping (CGFloat)->()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let minY = proxy.frame(in: coordinateSpace).minY
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                        .onPreferenceChange(OffsetKey.self){ value in
                            complition(value)
                        }
                }
            }
    }
}
