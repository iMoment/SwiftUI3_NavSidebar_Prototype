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
    
    // Menu Option
    @State var showSidebar: Bool = false
    
    // Hiding Native Tab Bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            // MARK: Custom Side Menu...
            Sidebar(currentTab: $currentTab)
            
            // MARK: Main Tab View
            CustomTabView(currentTab: $currentTab, showSidebar: $showSidebar)
                .cornerRadius(showSidebar ? 25 : 0)
            // Making 3D rotation
                .rotation3DEffect(.init(degrees: showSidebar ? -15 : 0), axis: (x: 0, y: 1, z: 0), anchor: .trailing)
            // Move view apart
                .offset(x: showSidebar ? getScreenSize().width / 2 : 0)
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

// MARK: Extension to get Safe Area
extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return .zero }
        
        return safeArea
    }
}
