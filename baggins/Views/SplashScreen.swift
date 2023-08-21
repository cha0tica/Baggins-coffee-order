//
//  ContentView.swift
//  baggins
//
//  Created by Agata on 18.08.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var opacity = 0.5
    @State private var size = 0.5
    
    var body: some View {
        if isActive {
            MainScreen()
        } else {
            ZStack {
                GeometryReader { geometry in
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .clipped()
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Logo")
                    Spacer()
                }
                .padding(.top, 100)
                .onAppear() {
                    withAnimation(.easeIn(duration: 2.0)) {
                        self.size = 1.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
            
        }
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
