//
//  AppViewSUI.swift
//  tca-issue
//
//  Created by Dan Sinclair on 20/06/2023.
//

import SwiftUI

struct AppViewSUI: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            NavigationLink("Items") {
                ItemListViewSUI()
            }
        }
    }
}

struct AppViewSUI_Previews: PreviewProvider {
    static var previews: some View {
        AppViewSUI()
    }
}
