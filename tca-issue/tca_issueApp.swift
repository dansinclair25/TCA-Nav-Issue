//
//  tca_issueApp.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import ComposableArchitecture
import SwiftUI

@main
struct tca_issueApp: App {
    let store = Store(
        initialState: AppFeature.State()) {
            AppFeature()
        }
    
    var body: some Scene {
        WindowGroup {
            AppView(store: store)
//            AppViewSUI()
        }
    }
}

struct AppFeature: ReducerProtocol {
    struct State {
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case path(StackAction<Path.State, Path.Action>)
    }
    
    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            Path()
        }
    }
}

extension AppFeature {
    struct Path: ReducerProtocol {
        enum State {
            case itemList(ItemListFeature.State)
        }
        
        enum Action {
            case itemList(ItemListFeature.Action)
        }
        
        var body: some ReducerProtocolOf<Self> {
            Scope(state: /State.itemList, action: /Action.itemList) {
                ItemListFeature()
            }
        }
    }
}
