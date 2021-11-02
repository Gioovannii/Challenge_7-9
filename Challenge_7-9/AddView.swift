//
//  AddView.swift
//  Challenge_7-9
//
//  Created by Giovanni Gaffé on 2021/11/1.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Dreams
    @State private var name  = ""
    @State private var type = "Dream"
    @State private var image = "partying-face"
    @State private var description = ""
    @State private var showingAlert = false
    
    static let types = ["Dream", "Nightmare"]
    static let moods = ["happy", "partying-face", "sad", "dizzy-face", "crying-face"]

    
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
                    
                    TextField("What happened in your \(type)", text: $description)
                        .font(.headline)
                        .frame(height: 200)
                    
                }
                .navigationTitle("Add a new dream")
                .navigationBarItems(trailing:
                                        Button("Save") {
                    let dream = DreamRepresentable(name: name, type: type, image: image, description: description)
                    self.activities.dreams.append(dream)
                    
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Dreams())
        
    }
}
