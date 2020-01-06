//
//  HomeViewModel.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/05.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var date = Date()
    @Published var schedules: [String] = []
    @Published var meals: MealResponse = MealResponse(breakfast: [""], lunch: [""], dinner: [""])
    
    private let apiService: APIServiceType
    private var disposables = Set<AnyCancellable>()
    
    init(apiService: APIServiceType = APIService(),
         scheduler: DispatchQueue = DispatchQueue(label: "HomeViewModel")) {
        self.apiService = apiService
    }
    
    func load(forDate: Date) {
        self.date = forDate
        fetchSchedule(date: date)
        fetchMeal(date: date)
    }
    
    private func fetchSchedule(date: Date) {
        let request = ScheduleRequest(date: date)
        apiService.response(from: request)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.schedules = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] schedule in
                    guard let self = self else { return }
                    self.schedules = schedule.today
                }
            )
            .store(in: &disposables)
    }
    
    private func fetchMeal(date: Date) {
        let request = MealRequest(date: date)
        apiService.response(from: request)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let self = self else { return }
                    switch value {
                    case .failure:
                        self.schedules = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] meal in
                    guard let self = self else { return }
                    self.meals = meal
                }
            )
            .store(in: &disposables)
    }
}
