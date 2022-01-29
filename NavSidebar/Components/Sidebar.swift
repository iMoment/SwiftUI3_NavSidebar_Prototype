//
//  Sidebar.swift
//  NavSidebar
//
//  Created by Stanley Pan on 2022/01/29.
//

import SwiftUI

struct Sidebar: View {
    @Binding var currentTab: String
    
    // MARK: Smooth transition with Matched Geometry
    @Namespace var animation
    
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
            
            // MARK: For Small Screens
            ScrollView(getScreenSize().height < 750 ? .vertical : .init(), showsIndicators: false) {
                // MARK: Tab Buttons
                VStack(alignment: .leading, spacing: 25) {
                    CustomTabButton(icon: "theatermasks.fill", title: "Home")
                    CustomTabButton(icon: "safari.fill", title: "Discover")
                    CustomTabButton(icon: "applewatch", title: "Devices")
                    CustomTabButton(icon: "person.fill", title: "Profile")
                    CustomTabButton(icon: "gearshape.fill", title: "Setting")
                    CustomTabButton(icon: "info.circle.fill", title: "About")
                    CustomTabButton(icon: "questionmark.circle.fill", title: "Help")
                    
                    Spacer()
                    
                    CustomTabButton(icon: "rectangle.portrait.and.arrow.right", title: "Logout")
                }
                .padding()
                .padding(.top, 45)
            }
            .frame(width: getScreenSize().width / 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("background")
        )
    }
    
    // MARK: Custom Button
    @ViewBuilder
    func CustomTabButton(icon: String, title: String) -> some View {
        Button {
            if title == "Logout" {
                print("User has logged out.")
            } else {
                withAnimation {
                    currentTab = title
                }
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.title3)
                    .frame(width: currentTab == title ? 48 : nil, height: 48)
                    .foregroundColor(currentTab == title ? Color("purple") : (title == "Logout" ? Color("salmon") : Color.white))
                    .background(
                        ZStack {
                            if currentTab == title {
                                Color.white
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "TABCIRCLE", in: animation)
                            }
                        }
                    )
                
                Text(title)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(title == "Logout" ? Color("salmon") : Color.white)
            }
            .padding(.trailing, 18)
            .background(
                ZStack {
                    if currentTab == title {
                        Color("purple")
                            .clipShape(Capsule())
                            .matchedGeometryEffect(id: "TABCAPSULE", in: animation)
                    }
                }
            )
        }
        .offset(x: currentTab == title ? 15 : 0)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: Getting Screen Bounds
extension View {
    func getScreenSize() -> CGRect {
        return UIScreen.main.bounds
    }
}
