//
//  MealResponse.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/05.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation

/// Request Example - GET /school/meal/2020/1/6
/// Response Example - {"조식":["백미밥","깍두기","파인애플","초코머핀","황태포두부무국","골뱅이소면무침","수제소시지채소볶음"],"중식":["마파두부덮밥","얼갈이된장국","왕새우무조림","배추김치","배","닭북채구이&머스터드소스"],"석식":["대패돈육데리덮밥","콩나물얼큰국","오징어무초무침","배추김치","미니버터크로와상","냉매실차","모듬떡볶이&찹쌀순대"]}
struct MealResponse: Decodable {
    let breakfast: [String]
    let lunch: [String]
    let dinner: [String]
    
    enum CodingKeys: String, CodingKey {
        case breakfast = "조식"
        case lunch = "중식"
        case dinner = "석식"
    }
    
    init(breakfast: [String], lunch: [String], dinner: [String]) {
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }
}
