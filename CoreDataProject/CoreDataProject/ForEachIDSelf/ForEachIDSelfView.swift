//
//  ForEachIDSelfView.swift
//  CoreDataProject
//
//  Created by Alexander Ostrovsky on 27.08.2022.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ForEachIDSelfView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
        .navigationTitle("🧑‍🎓 ForEach id \\.self")
    }
}

struct ForEachIDSelfView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ForEachIDSelfView()
        }
        .preferredColorScheme(.dark)
    }
}
