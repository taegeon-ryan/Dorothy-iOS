//
//  ScheduleView.swift
//  Dorothy
//
//  Created by 유태건 on 2019/12/30.
//  Copyright © 2019 유태건. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    let date: Date
    let schedule: [String]
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("schedule")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, maxHeight: 250)
                .modifier(RoundedMask())
            VStack(alignment: .leading, spacing: 3.0) {
                Text(fullDateFormatter.string(from: date))
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    scheduleDescription
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(0.0)
                    Spacer()
                    Text("사진 제공 - 박건은")
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                }
                
            }
            .shadow(radius: 10)
            .foregroundColor(.white)
            .padding()
        }
    }
}

private extension ScheduleView {
    var scheduleDescription: Text {
        guard schedule.first != "" && schedule.first != nil else {
            return Text("학사일정이 없습니다.")
        }
        var scheduleText = schedule.first!
        if schedule.count >= 2 {
            for s in schedule {
                scheduleText += ", "
                scheduleText += s
            }
        }
        return Text(scheduleText)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(date: Date(), schedule: ["학사일정이 없습니다."])
            .previewLayout(.sizeThatFits)
    }
}
