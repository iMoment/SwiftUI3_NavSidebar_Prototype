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
            HStack(spacing: 15) {
                Image("laptop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
                
                Text("iMoment")
                    .font(.title2.bold())
                    .foregroundColor(Color.white)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: Tab Buttons
            VStack(alignment: .leading, spacing: 25) {
                CustomTabButton(icon: "theatermasks.fill", title: "Home")
            }
            .padding()
            .padding(.top, 60)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("background")
        )
    }
    
    // MARK: Custom Button
    @ViewBuilder
    func CustomTabButton(icon: String, title: String) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: 48, height: 48)
                    .background(
                        Color.white
                            .clipShape(Circle())
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
            .padding(.trailing)
            .background(
                Color("purple")
                    .clipShape(Capsule())
            )
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
