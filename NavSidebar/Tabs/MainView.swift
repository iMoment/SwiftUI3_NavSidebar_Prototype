//
//  MainView.swift
//  NavSidebar
//
//  Created by Stanley Pan on 2022/01/29.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 15) {
                Image("laptop")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getScreenSize().width - 30, height: 250)
                    .cornerRadius(18)
                
                Text("iOS Development, SwiftUI3, etc.")
                    .font(.caption)
                    .foregroundColor(Color.gray)
            }
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
