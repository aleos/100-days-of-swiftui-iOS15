//
//  ContentView.swift
//  UnitConverter
//
//  Created by Alexander Ostrovsky on 31.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 1.0
    @State private var dimension: Conversion = .volume
    @State private var inputUnit: Dimension = UnitVolume.liters
    @State private var outputUnit: Dimension = UnitVolume.gallons
    @FocusState private var inputIsFocused: Bool
    
    enum Conversion: String, CaseIterable {
        case duration, length, mass, temperature, volume
        
        var units: [Dimension] {
            switch self {
            case .duration:
                return [UnitDuration]([.hours, .minutes, .seconds])
            case .length:
                return [UnitLength]([.meters, .kilometers, .feet, .yards, .miles])
            case .mass:
                return [UnitMass]([.grams, .kilograms, .ounces, .pounds])
            case .temperature:
                return [UnitTemperature]([.celsius, .fahrenheit, .kelvin])
            case .volume:
                return [UnitVolume]([.milliliters, .liters, .cups, .pints, .gallons])
            }
        }
    }
    
    var converted: Measurement<Dimension> {
        Measurement(value: input, unit: inputUnit).converted(to: outputUnit)
    }
    
    private static let formatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        return formatter
    }()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the value", value: $input, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Value")
                }
                
                Section {
                    Picker("Conversion", selection: $dimension) {
                        ForEach(Conversion.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    Picker("From", selection: $inputUnit) {
                        ForEach(dimension.units, id: \.self) {
                            Text("\(Self.formatter.string(from: $0))").tag($0)
                        }
                    }
                    Picker("To", selection: $outputUnit) {
                        ForEach(dimension.units, id: \.self) {
                            Text("\(Self.formatter.string(from: $0))").tag($0)
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            .onChange(of: dimension) { newValue in
                inputUnit = newValue.units[0]
                outputUnit = newValue.units[1]
            }
        }.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
