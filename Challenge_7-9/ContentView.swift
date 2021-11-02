//
//  ContentView.swift
//  Challenge_7-9
//
//  Created by Giovanni Gaffé on 2021/11/1.
//

import SwiftUI

struct DreamRepresentable: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let image: String
    let description: String
}


class Dreams: ObservableObject {
    @Published var dreams = [DreamRepresentable]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(dreams) {
                UserDefaults.standard.set(encoded, forKey: "Dreams")
            }
        }
    }
    
    init() {
        if let dreams = UserDefaults.standard.data(forKey: "Dreams") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([DreamRepresentable].self, from: dreams) {
                self.dreams = decoded
                return
            }
        }
        
        self.dreams = []
    }
    
    
}

struct ContentView: View {
    @ObservedObject var activities = Dreams()
    @State private var showDreams = false
    
    var body: some View {
        ZStack {
            Color("Color")
                .ignoresSafeArea()
            NavigationView {
                List {
                    ForEach(activities.dreams) { item in
                        NavigationLink(destination: DescriptionView(dream: DreamRepresentable(name: item.name, type: item.type, image: item.image, description: item.description))) {
                            
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                    
                                }
                                
                                Spacer()
                                Image(item.image)
                            }
                        }
                    }
                    .onDelete(perform: removeDreams(at:))
                }
                .navigationTitle("Dream Reminder")
                .navigationBarItems(leading: EditButton(), trailing:
                                        Button(action: {
                    self.showDreams = true
                }) {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $showDreams) {
                    AddView(activities: self.activities)
                }
            }
        }
    }
    
    func removeDreams(at offsets: IndexSet) {
        activities.dreams.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
        
    }
}
