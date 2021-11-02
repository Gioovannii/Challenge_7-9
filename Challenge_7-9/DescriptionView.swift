//
//  DescriptionView.swift
//  Challenge_7-9
//
//  Created by Giovanni Gaffé on 2021/11/2.
//

import SwiftUI

struct DescriptionView: View {
    let dream: Dreams
    
    var body: some View {
        
        ZStack {
            Color("Color")
                .ignoresSafeArea()
            VStack {
                Text("Dream name : \(dream.name)")
                Text("Dream type : \(dream.type)")
                HStack {
                    Text("Image")
                        .padding(.horizontal, 40)
                    Image(dream.image)
                }
                    Text("Dream Description : \(dream.description)")
            }
            .background(Color("Color"))
        .font(.title)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(dream: Dreams(name: "My name", type: "Nightmare", image: "sad", description: "A short example description"))
            .preferredColorScheme(.dark)
    }
}
