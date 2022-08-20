 //
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Alexander Ostrovsky on 18.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var orderViewModel = OrderViewModel()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $orderViewModel.order.type) {
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(orderViewModel.order.quantity)", value: $orderViewModel.order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn: $orderViewModel.order.specialRequestEnabled.animation())

                    if orderViewModel.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $orderViewModel.order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $orderViewModel.order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink {
                        AddressView(orderViewModel: orderViewModel)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
