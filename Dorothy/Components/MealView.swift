//
//  MealView.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/02.
//  Copyright © 2020 유태건. All rights reserved.
//

import SwiftUI

enum MealTime: String {
    case breakfast = "아침"
    case lunch = "점심"
    case dinner = "저녁"
}

struct MealView: View {
    let date: Date
    let mealtime: MealTime
    let meals: MealResponse
    var menus: [String] = []
    
    init(date: Date, mealtime: MealTime, meals: MealResponse) {
        self.date = date
        self.mealtime = mealtime
        self.meals = meals
        
        switch mealtime {
        case .breakfast: menus = meals.breakfast
        case .lunch: menus = meals.lunch
        case .dinner: menus = meals.dinner
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 19, style: .continuous)
                .foregroundColor(Color("background"))
                .shadow(color: Color(.sRGB, white: 0, opacity: 0.1), radius: 10, x: 0, y: 1)
            VStack(alignment: .leading) {
                MealtimeView(mealtime: mealtime)
                Group {
                    if menus.first != "" && menus.first != nil {
                        MenuExistsView(menus: menus)
                    } else {
                        MenuNoneView()
                    }
                }
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(.bottom, 10)
            }
            .padding()
        }
        .frame(width: 175, height: 350)
    }
}

struct MealtimeView: View {
    let hour = Int(hourFormatter.string(from: Date()))!
    var presentMeal: MealTime = .breakfast
    let mealtime: MealTime
    
    init(mealtime: MealTime) {
        self.mealtime = mealtime
        
        switch hour {
        case 0..<8: presentMeal = .breakfast
        case 8..<13: presentMeal = .lunch
        case 13..<24: presentMeal = .dinner
        default: break
        }
    }
    var body: some View {
        Text(mealtime.rawValue)
            .foregroundColor(presentMeal == mealtime ? Color("meal") : nil)
            .font(.title)
            .fontWeight(.bold)
            .padding(.top, 10.0)
            .padding(.bottom, 15.0)
    }
}

struct MenuExistsView: View {
    let menus: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(menus, id: \.self) { menu in
                Group {
                    Spacer()
                    Text(menu)
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
            }
        }
    }
}

struct MenuNoneView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                Spacer()
                Text("급식이 없습니다.")
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MealView(date: Date(), mealtime: .breakfast, meals: MealResponse(
                breakfast: ["스크램블채소볶음밥&케찹", "즉석구이김", "배추김치", "슈크림붕어빵", "수제햄버거", "배", "비피더스"],
                lunch: ["백미밥", "치즈오븐스파게티", "도라지오이생채", "간고등어구이", "깍두기"],
                dinner: [""]
            ))
                .previewLayout(.sizeThatFits)
            MealView(date: Date(), mealtime: .lunch, meals: MealResponse(
                breakfast: ["스크램블채소볶음밥&케찹", "즉석구이김", "배추김치", "슈크림붕어빵", "수제햄버거", "배", "비피더스"],
                lunch: ["백미밥", "치즈오븐스파게티", "도라지오이생채", "간고등어구이", "깍두기"],
                dinner: [""]
            ))
                .previewLayout(.sizeThatFits)
            MealView(date: Date(), mealtime: .dinner, meals: MealResponse(
                breakfast: ["스크램블채소볶음밥&케찹", "즉석구이김", "배추김치", "슈크림붕어빵", "수제햄버거", "배", "비피더스"],
                lunch: ["백미밥", "치즈오븐스파게티", "도라지오이생채", "간고등어구이", "깍두기"],
                dinner: [""]
            ))
                .previewLayout(.sizeThatFits)
        }
    }
}
