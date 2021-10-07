//
//  ContentView.swift
//  iDine0
//
//  Created by Student on 10/4/21.
//

import SwiftUI


struct ContentView: View {

    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)){
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}


