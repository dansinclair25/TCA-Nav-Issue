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
    }
    
    enum Action {
        case itemTapped(String)
    }
    
    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .itemTapped:
                return .none

            }
        }
    }
}
