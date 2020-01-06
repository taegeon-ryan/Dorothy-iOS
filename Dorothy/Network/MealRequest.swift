//
//  MealRequest.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/05.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation

struct MealRequest: APIRequestType {
    typealias Response = MealResponse
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
        return "school/meal/\(year)/\(month)/\(day)"
    }
}
