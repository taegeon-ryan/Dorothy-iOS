//
//  Formatters.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/04.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation

// MARK: 시간(1, 2, ...)
let hourFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "H"
    return formatter
}()

// MARK: 요일(Monday, Tuesday, ...)
let dayFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.dateFormat = "EEEE"
    return formatter
}()

// MARK: 일(1, 2, ...)
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    return formatter
}()

// MARK: 월(1, 2, ...)
let monthFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "M"
    return formatter
}()

// MARK: 연도(2020, 2021, ...)
let yearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy"
    return formatter
}()

let fullDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.dateFormat = "M월 d일 EEEE"
    return formatter
}()
