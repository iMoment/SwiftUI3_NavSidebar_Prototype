//
//  Sidebar.swift
//  NavSidebar
//
//  Created by Stanley Pan on 2022/01/29.
//

import SwiftUI

struct Sidebar: View {
    @Binding var currentTab: String
    
    var body: some View {
        VStack {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("background")
        )
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
