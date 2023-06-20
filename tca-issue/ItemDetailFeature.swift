//
//  ItemDetailFeature.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import ComposableArchitecture

struct ItemDetailFeature: ReducerProtocol {
    struct State: Equatable {
        var item: String
    }
    
    enum Action: Equatable {
        
    }
    
    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            return .none
        }
    }
}
