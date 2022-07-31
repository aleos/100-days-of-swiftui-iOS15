//
//  ContentView.swift
//  UnitConverter
//
//  Created by Alexander Ostrovsky on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 0.0
    @State private var fromSelection: UnitVolume = .liters
    @State private var toSelection: UnitVolume = .gallons
    
    let units: [UnitVolume] = [.milliliters, .liters, .cups, .pints, .gallons]
    var converted: Measurement<UnitVolume> {
        Measurement(value: value, unit: fromSelection).converted(to: toSelection)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the value", value: $value, format: .number)
                } header: {
                    Text("Value")
                }
                
                Section {
                    Picker("From", selection: $fromSelection) {
                        ForEach(units, id: \.symbol) {
                            Text("\($0.symbol)").tag($0)
                        }
                    }
                    Picker("To", selection: $toSelection) {
                        ForEach(units, id: \.symbol) {
                            Text("\($0.symbol)").tag($0)
                        }
                    }
                } header: {
                    Text("Units")
                }
                
                Section {
                    Text("\(converted.formatted(.measurement(width: .abbreviated, usage: .asProvided)))")
                } header: {
                    Text("Result")
                }
            }
            .navigationTitle("UnitConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
