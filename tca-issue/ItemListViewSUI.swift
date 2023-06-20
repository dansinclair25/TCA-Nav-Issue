//
//  ItemListViewSUI.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import SwiftUI

struct ItemListViewSUI: View {
    var items: [String] = ["a", "b", "c"]
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(items, id: \.self) { item in
                    NavigationLink(item) {
                        ItemDetailViewSUI(item: item)
                    }
                }
            }
        }
    }
}
