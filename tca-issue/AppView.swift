//
//  AppView.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    let store: StoreOf<AppFeature>
    
    var body: some View {
        NavigationStackStore(store.scope(state: \.path, action: { .path($0) } )) {
            NavigationLink("Items", state: AppFeature.Path.State.itemList(.init()))
            .buttonStyle(.borderless)
        } destination: { state in
            switch state {
            case .itemList:
                CaseLet(
                      state: /AppFeature.Path.State.itemList,
                      action: AppFeature.Path.Action.itemList,
                      then: ItemListView.init(store:)
                    )
            }
        }
    }
}
