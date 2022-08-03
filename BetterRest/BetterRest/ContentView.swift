//
//  ContentView.swift
//  BetterRest
//
//  Created by Alexander Ostrovsky on 01.08.2022.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var idealBedtime: Date? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            return sleepTime
        } catch {
            return nil
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("Your ideal bedtime is…")
                            .font(.title3)
                        Text(idealBedtime!.formatted(date: .omitted, time: .shortened))
                            .font(.title.weight(.semibold))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .listRowSeparator(.hidden)
                    
                    
                    Section {
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    } header: {
                        Text("When do you want to wake up?")
                    }
                    
                    Section {
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    } header: {
                        Text("Desired amount of sleep")
                    }
                    
                    Section {
                        Picker("Number of cups per day", selection: $coffeeAmount) {
                            ForEach(1...20, id: \.self) { cups in
                                Text(cups == 1 ? "1 cup" : "\(cups) cups")
                            }
                        }
                    } header: {
                        Text("Daily coffee intake")
                    }
                }
                .navigationTitle("BetterRest")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
