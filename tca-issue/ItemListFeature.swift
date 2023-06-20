//
//  ItemListFeature.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import ComposableArchitecture

struct ItemListFeature: ReducerProtocol {
    struct State: Equatable {
        var items: [String] = ["a", "b", "c"]
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

extension ItemListFeature {
    struct Path: ReducerProtocol {
        enum State: Equatable {
            case itemDetail(ItemDetailFeature.State)
        }
        
        enum Action: Equatable {
            case itemDetail(ItemDetailFeature.Action)
        }
        
        var body: some ReducerProtocolOf<Self> {
            Scope(state: /State.itemDetail, action: /Action.itemDetail) {
                ItemDetailFeature()
            }
        }
    }
}
