//
//  ScheduleRequest.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/04.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation

struct ScheduleRequest: APIRequestType {
    typealias Response = ScheduleResponse
    let date: Date
    
    let year: String
    let month: String
    let day: String
    
    init(date: Date) {
        self.date = date
        self.year = yearFormatter.string(from: date)
        self.month = monthFormatter.string(from: date)
        self.day = dateFormatter.string(from: date)
    }
    
    var path: String {
        return "school/schedule/\(year)/\(month)/\(day)"
    }
}
