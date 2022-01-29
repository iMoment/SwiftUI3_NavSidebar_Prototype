//
//  CustomTabView.swift
//  NavSidebar
//
//  Created by Stanley Pan on 2022/01/29.
//

import SwiftUI

struct CustomTabView: View {
    @Binding var currentTab: String
    
    var body: some View {
        VStack {
            // MARK: Static Header View for all pages
            HStack {
                // MARK: Menu Button
                Button {
                    
                } label: {
                    Image(systemName: "line.3.horizontal.decrease")
                        .font(.title)
                        .foregroundColor(Color.white)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image("laptop")
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .cornerRadius(5)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
