//
//  ContentView.swift
//  Dorothy
//
//  Created by 유태건 on 2019/12/26.
//  Copyright © 2019 유태건. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var presentDate = Date()
    @State var isLoading = false
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Group {
                    VStack() {
                        ScheduleView(date: viewModel.date, schedule: viewModel.schedules)
                        ScrollView(.horizontal) {
                            HStack(spacing: 15) {
                                MealView(date: viewModel.date, mealtime: .breakfast, meals: viewModel.meals)
                                MealView(date: viewModel.date, mealtime: .lunch, meals: viewModel.meals)
                                MealView(date: viewModel.date, mealtime: .dinner, meals: viewModel.meals)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 350, maxHeight: 350)
                            .padding(.vertical)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 10)
                InfoView()
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle("학교")
            .navigationBarItems(leading:
                Button(action: {
                    self.isLoading = true
                    self.presentDate -= 86400
                    self.viewModel.load(forDate: self.presentDate)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.isLoading = false
                        }
                    }
                }, label: {
                    Text("어제")
                }),
                                trailing:
                Button(action: {
                    self.isLoading = true
                    self.presentDate += 86400
                    self.viewModel.load(forDate: self.presentDate)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            self.isLoading = false
                        }
                    }
                }, label: {
                    Text("내일")
                })
            )
        }
        .onAppear {
            self.isLoading = true
            self.viewModel.load(forDate: self.presentDate)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isLoading = false
                }
            }
        }
        .toast(isLoading: $isLoading)
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
                .environment(\.colorScheme, .light)
            HomeView()
                .environment(\.colorScheme, .dark)
        }
    }
}
