//
//  ItemDetailViewSUI.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import SwiftUI

struct ItemDetailViewSUI: View {
    var item: String
    
    var body: some View {
        Text(item)
            .font(.largeTitle)
    }
}
