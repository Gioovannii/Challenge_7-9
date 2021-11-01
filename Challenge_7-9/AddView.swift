//
//  AddView.swift
//  Challenge_7-9
//
//  Created by Giovanni Gaffé on 2021/11/1.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var name  = ""
    @State private var type = "Dream"
    @State private var image = "photo.fill"
    @State private var description = ""
    @State private var showingAlert = false
    
    static let types = ["Dream", "Nightmare"]
    static let moods = ["happy", "partying-face", "sad", "crying-face"]

    
    var body: some View {
        ZStack {
            Color("Color")
                .ignoresSafeArea()
            NavigationView {
                Form {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(Self.types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)

                    Picker("Mood", selection: $image) {
                        ForEach(Self.moods, id: \.self) {
                            Image($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    
                }
                .navigationTitle("Add a new dream")
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
        
    }
}
