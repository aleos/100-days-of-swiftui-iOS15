//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Alexander Ostrovsky on 17.08.2022.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(activity.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Completion count: \(activity.completionCount)")
                    .font(.callout)
                    .padding([.top], 20)
            }
            Spacer()
            Button("Mark completed") {
                data.complete(activity: activity)
            }
        }
        .padding()
        .navigationTitle(activity.title)
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity(title: "Learn English", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ultricies tempor sagittis. Quisque cursus rutrum orci vel lobortis. Etiam porttitor odio at aliquet vulputate. Maecenas sed ultricies erat. Proin id lobortis sem. Vivamus congue accumsan risus nec consequat. Proin posuere lectus eros, ac ultrices sem scelerisque iaculis. Maecenas non convallis purus, a venenatis diam."))
    }
}
