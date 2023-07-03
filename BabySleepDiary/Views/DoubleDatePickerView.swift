//
//  DoubleDatePickerView.swift
//  BabySleepDiary
//
//  Created by ozinchenko.dev on 26/06/2023.
//

import SwiftUI

struct DoubleDatePickerView: View {
    @Binding var selectedDate: Date

    var body: some View {
        VStack {

            DatePicker(
                "Select Date and Time",
                selection: $selectedDate,
                displayedComponents: [.hourAndMinute, .date]
            )
            .labelsHidden()
            .datePickerStyle(.compact)
            .padding(1)
        }
    }
}

struct DoubleDatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DoubleDatePickerView(selectedDate: .constant(.now))
    }
}
