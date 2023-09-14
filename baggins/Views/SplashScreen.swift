//
//  ContentView.swift
//  baggins
//
//  Created by Agata on 18.08.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    
    var body: some View {
        if isActive {
            MainScreen()
        } else {
            ZStack {
                VStack {
                    Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("Logo")
                    Spacer()
                }
                .padding(.top, 150)
                .scaleEffect(size)
                                .onAppear {
                                    withAnimation(.easeOut(duration: 2.0)) {
                                        self.size = 1
                                    }
                                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
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
