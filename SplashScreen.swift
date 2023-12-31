//
//  SplashScreen.swift
//  PlanIt
//
//  Created by Jacob Gino on 8/26/23.
//

import SwiftUI

struct myvariables {
    @State static var passed: Int = 0
    
    
}

struct SplashScreen: View {
    

    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    @State var events: [NewEvent] = [NewEvent]()
    var body: some View {
        if isActive {
            HomeView()
        }
        else {
            VStack {
                Image("PlanItLogo").resizable().aspectRatio(contentMode: .fit)
                    .padding()
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration:1.2)) {
                    self.size = 0.9
                    self.opacity = 1.0
            }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
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
