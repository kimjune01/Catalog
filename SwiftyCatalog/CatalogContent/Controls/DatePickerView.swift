//
//  DatePickerView.swift
//  SwiftyCatalog
//
//  Created by June Kim on 2024-10-10.
//

import SwiftUI

struct DatePickerView: View {
  @State private var date1: Date = Date()
  @State private var date2: Date = Date()
  @State private var date3: Date = Date()
  @State private var date4: Date = Date()
  
  let allComponents: [DatePickerComponents] = [.hourAndMinute, .date]
  var selectedComponents: DatePickerComponents = [.hourAndMinute, .date]
  
  let componentsIndices = [0, 1, 2]
  @State private var selectedComponentsIndex = 0
  let components: [DatePickerComponents] = [[.hourAndMinute, .date], [.hourAndMinute], [.date]]
  
  @State var isLimitedDates: Bool = false
  var dateClosedRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
    let max = Calendar.current.date(byAdding: .day, value: 2, to: Date())!
    return min...max
  }

  var dateOpenRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .day, value: -20000, to: Date())!
    let max = Calendar.current.date(byAdding: .day, value: 20000, to: Date())!
    return min...max
  }

  
  var body: some View {
    ScrollView {
      VStack(spacing: 20) {
        Text("Compact").font(.headline)
        DatePicker("Select a date",
                   selection: $date2,
                   in: isLimitedDates ? dateClosedRange : dateOpenRange,
                   displayedComponents: components[selectedComponentsIndex]
        )
        .datePickerStyle(.compact)
        .block()
        Divider()
        
        Text("Graphical").font(.headline)
        DatePicker("Select a date",
                   selection: $date3,
                   in: isLimitedDates ? dateClosedRange : dateOpenRange,
                   displayedComponents: components[selectedComponentsIndex]
        )
          .datePickerStyle(.graphical)
          .block()
        Divider()
        
        Text("Wheel").font(.headline)
        DatePicker("", selection: $date4,
                   in: isLimitedDates ? dateClosedRange : dateOpenRange,
                   displayedComponents: components[selectedComponentsIndex])
          .datePickerStyle(.wheel)
          .block()
        Divider()
        
        Text("Limit selection to components").font(.headline)
        Picker("Which components",
               selection: $selectedComponentsIndex) {
          Text(".hourAndMinute, .date").tag(0)
          Text(".hourAndMinute").tag(1)
          Text(".date").tag(2)
        }
        .pickerStyle(.menu)
        Divider()

        Text("Limit selection to certain dates").font(.headline)
        Toggle("Limit dates", isOn: $isLimitedDates)
          .toggleStyle(.switch)
        
      }
    }.padding()
  }
}

#Preview {
  DatePickerView()
}
