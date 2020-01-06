//
//  View.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/06.
//  Copyright © 2020 유태건. All rights reserved.
//

import SwiftUI

extension View {
    func toast(isLoading: Binding<Bool>) -> some View {
        Toast(isLoading: isLoading,
              presenting: { self })
    }
}
