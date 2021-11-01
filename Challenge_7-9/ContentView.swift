//
//  ContentView.swift
//  Challenge_7-9
//
//  Created by Giovanni Gaffé on 2021/11/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(red: 0.184, green: 0.212, blue: 0.251)
                .ignoresSafeArea()
            VStack {
                Text("Hello, world !")
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
