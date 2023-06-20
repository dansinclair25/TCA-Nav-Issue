//
//  ItemDetailView.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import ComposableArchitecture
import SwiftUI

struct ItemDetailView: View {
    let store: StoreOf<ItemDetailFeature>
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            Text(viewStore.state.item)
                .font(.largeTitle)
        }
    }
}
