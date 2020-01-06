//
//  RoundedMask.swift
//  Dorothy
//
//  Created by 유태건 on 2019/12/31.
//  Copyright © 2019 유태건. All rights reserved.
//

import SwiftUI

struct RoundedMask: ViewModifier {
    func body(content: Content) -> some View {
        let mask = RoundedRectangle(cornerRadius: 19, style: .continuous)
        return content
            .clipShape(mask)
            .contentShape(mask)
    }
}
