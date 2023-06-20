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
            case let .path(.element(id: id, action: .itemList(.itemTapped(item)))):
                guard case .itemList = state.path[id: id] else { return .none }
                
                state.path.append(.itemDetail(ItemDetailFeature.State(item: item)))
                return .none
                
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
            case itemDetail(ItemDetailFeature.State)
            case itemList(ItemListFeature.State)
        }
        
        enum Action {
            case itemDetail(ItemDetailFeature.Action)
            case itemList(ItemListFeature.Action)
        }
        
        var body: some ReducerProtocolOf<Self> {
            Scope(state: /State.itemDetail, action: /Action.itemDetail) {
                ItemDetailFeature()
            }
            
            Scope(state: /State.itemList, action: /Action.itemList) {
                ItemListFeature()
            }
        }
    }
}
