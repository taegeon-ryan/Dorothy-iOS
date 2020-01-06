//
//  Toast.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/06.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation
import SwiftUI

struct Toast<Presenting>: View where Presenting: View {
    @Binding var isLoading: Bool
    
    let presenting: () -> Presenting
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.presenting()
                    .blur(radius: self.isLoading ? 1 : 0)
                VStack {
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .opacity(self.isLoading ? 1 : 0)
                .transition(.slide)
//                .frame(width: geometry.size.width / 2.5,
//                       height: geometry.size.height / 5)
//                .background(Color.secondary.colorInvert())
//                .foregroundColor(Color.primary)
//                .cornerRadius(20)
            }
        }
    }
}
