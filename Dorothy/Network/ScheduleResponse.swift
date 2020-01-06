//
//  ScheduleResponse.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/04.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation

/// Request Example - GET /school/schedule/2019/1/25
/// Response Example - {"today": ["겨울방학", "설연휴"]}
struct ScheduleResponse: Decodable {
    let today: [String]
}
