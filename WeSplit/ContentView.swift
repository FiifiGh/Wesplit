//
//  ContentView.swift
//  WeSplit
//
//  Created by KOFI on 8/11/20.
//  Copyright © 2020 fiifi_gh. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfPeople   = ""
    @State private var tipPercentage    = 0
    @State private var checkAmount      = ""
    
    
    var totalPerPerson: (Double,Double) {
        let peopleCount = Double(numberOfPeople) ?? 1
        let tipSelection = Double(tipPercentage) / 100
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return (amountPerPerson,tipValue)
    }
    
    let students = ["Francis", "James", "Abigail"]
    @State private var selectedStudent = 0
    var body: some View {
        NavigationView{
            Form{
                Section{
                            TextField("Enter Bill Amount",text: $checkAmount)
                                .keyboardType(.decimalPad)
                
                            TextField("No of People",text: $numberOfPeople)
                                .keyboardType(.numberPad)
    
                }

                Section(header: Text("How much tip do you want to leave?")){
                    
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0 ..< 10){
                            Text("\($0)%")
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Bill Details")){
                    Text("Amount :   Ghs\(checkAmount)")
                    Text("Tip  :  \(totalPerPerson.1, specifier: "%.2f")")
                    Text("Amount per person  :  \(totalPerPerson.0, specifier: "%.2f") percent")
                }
                
            }.navigationBarTitle(Text("WeSplit"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
