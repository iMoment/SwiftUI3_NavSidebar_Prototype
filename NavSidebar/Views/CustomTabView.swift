//
//  CustomTabView.swift
//  NavSidebar
//
//  Created by Stanley Pan on 2022/01/29.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    @Binding var showSidebar: Bool
    
    var body: some View {
        VStack {
            // MARK: Static Header View for all pages
            HStack {
                // MARK: Menu Button
                Button {
                    // Toggle Sidebar Option
                    withAnimation(.spring()) {
                        showSidebar = true
                    }
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title2)
                        .foregroundColor(Color.white)
                }
                // Hiding when menu is visible
                .opacity(showSidebar ? 0 : 1)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("laptop")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .cornerRadius(5)
                }
            }
            // Page Title
            .overlay(
                Text(currentTab)
                    .font(.title2.bold())
                    .foregroundColor(Color.white)
                    .opacity(showSidebar ? 0 : 1)
            )
            .padding([.horizontal, .top])
            .padding(.bottom, 8)
            .padding(.top, getSafeArea().top)
            
            TabView(selection: $currentTab) {
                MainView()
                    .tag("Home")
                
                Text("Discover")
                    .tag("Discover")
                
                Text("Devices")
                    .tag("Devices")
                
                Text("Profile")
                    .tag("Profile")
                
                Text("Setting")
                    .tag("Setting")
                
                Text("About")
                    .tag("About")
                
                Text("Help")
                    .tag("Help")
            }
        }
        // Disabling actions when menu is visible
        .disabled(showSidebar)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(
            // MARK: Close Button
            Button {
                // Toggle Sidebar Option
                withAnimation(.spring()) {
                    showSidebar = false
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(Color.white)
            }
            // Hiding when menu is visible
            .opacity(showSidebar ? 1 : 0)
            .padding()
            .padding(.top)
            ,alignment: .topLeading
        )
        .background(
            Color.black
        )
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
