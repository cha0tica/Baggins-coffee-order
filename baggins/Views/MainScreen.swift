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
    @State private var selectedCategoryIndex = 0
    @StateObject private var cartController = CartController()
    
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
                .padding(.horizontal)
                .padding(.top, 5)
                
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
                                    .padding(.vertical)
                            })
                            
                            // Sticky Menu
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
                                                    scrollViewProxy.scrollTo(index, anchor: .top)
                                                }
                                            }
                                            .id(index)
                                    }
                                }
                                .padding(.horizontal)
                            }
                            .frame(height: 55)
                            .background(.white)
                            .id(0)
                            
                            .sticky()
                            
                            // End of sticky
                            
                            // Classic Menu...
                            HStack {
                                
                                Text("Классическое меню")
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                            }
                            .padding(.horizontal)
                            .padding(.top, 10)
                            
                            // ClassicItems...
                            HStack(spacing: 15) {
                                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 15) {
                                    ForEach(ClassicItemsMenu) { coffee in
                                        CoffeeCard(coffee: coffee)
                                            .onTapGesture {
                                                selectedCoffee = coffee
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
                            .padding(.top, 60)
                            .id(1)
                            
                            // Branded Items...
                            HStack(spacing: 15) {
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                                    ForEach(BrandedItemsMenu) { coffee in
                                        CoffeeCard(coffee: coffee)
                                            .onTapGesture {
                                                selectedCoffee = coffee
                                                isCoffeeModalPresented = true
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal)
                            
                            // Season Menu...
                            VStack {
                                Text("Cезонное меню")
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                            }
                            .padding(.horizontal)
                            .padding(.top, 60)
                            .id(2)
                            
                            // Season Items...
                            HStack(spacing: 15) {
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 15)], spacing: 15) {
                                    ForEach(SeasnonItemsMenu) { coffee in
                                        CoffeeCard(coffee: coffee)
                                            .onTapGesture {
                                                selectedCoffee = coffee
                                                isCoffeeModalPresented = true
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                                    .navigationBarTitleDisplayMode(.inline)
                                    .toolbarBackground(.white, for: .navigationBar)
                                    .toolbarBackground(.visible, for: .navigationBar)
                        .sheet(isPresented: $isCoffeeModalPresented) {
                            if let selectedCoffee = selectedCoffee {
                                CoffeView(coffee: $selectedCoffee)
                                    .environmentObject(cartController)
                            }
                        }
                    }
                }
                .coordinateSpace(name: "Container")
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)

    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .environmentObject(CartController())
    }
}

struct Sticky : ViewModifier {
    @State var stickyFrame: CGRect = .zero
    var isStickying : Bool {
        stickyFrame.minY < 0
    }
    func body(content: Content) -> some View {
        content
            .offset(y: isStickying ? -stickyFrame.minY : 0)
            .zIndex(isStickying ? .infinity : 0)
            .overlay(GeometryReader {proxy in
                let frame = proxy.frame(in: .named("Container"))
                Color.clear
                    .onAppear { stickyFrame = frame }
                    .onChange(of: frame) { stickyFrame = $0 }
            })
    }
}

extension View {
    func sticky() -> some View {
        modifier(Sticky())
    }
}
