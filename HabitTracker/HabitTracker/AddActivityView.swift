//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 17.08.2022.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var data: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Name", text: $title)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding([.top, .bottom], 20)
                TextField("Description", text: $description)
                Spacer()
            }
            .padding()
            .toolbar {
                Button("Save") {
                    data.add(title, description: description)
                    dismiss()
                }
            }
            .navigationTitle("Add Activity")
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(data: Activities())
    }
}
