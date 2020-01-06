//
//  InfoView.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/06.
//  Copyright © 2020 유태건. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("dimmed"))
            VStack {
                Image("github")
                    .resizable()
                    .frame(minWidth: 50, maxWidth: 50, minHeight: 50, maxHeight: 50)
                    .padding(.bottom, 5)
                Text("made with ❤️ by 유태건")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .padding(.bottom, 2)
                Text("https://github.com/taegeon-ryan/Dorothy-iOS")
                    .font(.system(size: 10))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 130, maxHeight: 130)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoView()
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .light)
            
            InfoView()
                .previewLayout(.sizeThatFits)
                .environment(\.colorScheme, .dark)
        }
    }
}
