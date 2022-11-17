//
//  MenuView.swift
//  OrderAppSwiftUI
//
//  Created by Ahmed Yamany on 17/11/2022.
//

import SwiftUI

struct MenuView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List{
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            NavigationLink {
                                ItemView(item: item)
                            } label: {
                                ItemCell(item: item)
                            }
                        }
                    }
                }
            }
        }
        
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
