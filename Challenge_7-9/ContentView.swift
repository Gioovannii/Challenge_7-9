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
            Color("Color")
                .ignoresSafeArea()
            VStack {
                Text("Hello, world !")
                    .foregroundColor(Color("ColorText"))
                    .padding()
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
            
    }
}
