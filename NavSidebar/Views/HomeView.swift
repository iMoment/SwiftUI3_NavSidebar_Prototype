//
//  HomeView.swift
//  NavSidebar
//
//  Created by Stanley Pan on 2022/01/29.
//

import SwiftUI

struct HomeView: View {
    // Current Tab
    @State var currentTab: String = "Home"
    
    var body: some View {
        ZStack {
            // MARK: Custom Side Menu...
            Sidebar(currentTab: $currentTab)
            
            // MARK: Main Tab View
            CustomTabView(currentTab: $currentTab)
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
