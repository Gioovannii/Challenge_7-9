//
//  ContentView.swift
//  Challenge_7-9
//
//  Created by Giovanni Gaffé on 2021/11/1.
//

import SwiftUI

struct Dreams: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let image: String
    let description: String
}


class Activities: ObservableObject {
    @Published var items = [Dreams]()
}

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showDreams = false
    
    var body: some View {
        ZStack {
            Color("Color")
                .ignoresSafeArea()
            NavigationView {
                List {
                    ForEach(activities.items) { item in
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
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                
        }
            
    }
}
