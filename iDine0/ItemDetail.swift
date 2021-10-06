//
//  ItemDetail.swift
//  iDine0
//
//  Created by Student on 10/5/21.
//

import SwiftUI

struct ItemDetail : View {
    let item: MenuItem

    static var previews: some View {
        ItemDetail(item: MenuItem.example)
    }
    
    var body: some View {
        VStack {
        ZStack (alignment: .bottomTrailing){
            Image(item.mainImage)
                .resizable()
                .scaledToFit()
            Text("Photo: \(item.photoCredit)")
                .padding(4)
                .background(Color.black)
                .font(.caption)
                .foregroundColor(.white)
                .offset(x: -5, y: -5)
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
        }
    }
}
}