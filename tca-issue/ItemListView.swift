//
//  ItemListView.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import ComposableArchitecture
import SwiftUI

struct ItemListView: View {
    let store: StoreOf<ItemListFeature>
    
    var body: some View {
//        NavigationStackStore(store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(store, observe: { $0 }) { viewStore in
                List {
                    ForEach(viewStore.state.items, id: \.self) { item in
                        Button {
                            viewStore.send(.itemTapped(item))
                        } label: {
                            Text(item)
                        }
                        .buttonStyle(.borderless)
                    }
                }
            }
//        } destination: { state in
//            switch state {
//            case .itemDetail:
//                CaseLet(
//                    state: /ItemListFeature.Path.State.itemDetail,
//                    action: ItemListFeature.Path.Action.itemDetail,
//                    then: ItemDetailView.init(store:)
//                )
//            }
//        }
    }
}
