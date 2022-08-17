//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 17.08.2022.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $name)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom], 20)
                TextField("Description", text: $description)
                Spacer()
            }
            .padding()
            .toolbar {
                Button("Save") {
                    activities.add(name, description: description)
                    dismiss()
                }
            }
            .navigationTitle("Add new activity")
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Activities())
    }
}
