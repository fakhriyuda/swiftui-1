//
//  ContentView.swift
//  WeSplit
//
//  Created by ISYS Macbook air 1 on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var numberOfPeople = 0
    @State private var selecTip = 20
    @FocusState private var amountIsFocus : Bool
    
    
    var totalPerPerson : Double{
        let peopleCount = numberOfPeople + 2
        let personWillPay = grandTotals / Double(peopleCount)
        return personWillPay
    }
    var grandTotals : Double{
        let totalTips = amount / Double(100) * Double(selecTip)
        let grandTotal = amount + totalTips
        return grandTotal
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocus)
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2 ..< 100){
                            Text("\($0) People")
                        }
                    }
//                    .pickerStyle(.navigationLink)
                }
                
               
                Section("How much do you want to tip?"){
                    Picker("Give Tips", selection: $selecTip){
                        ForEach(0 ..< 101,id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("Total Value"){
                    Text(grandTotals,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount per person"){
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocus {
                    Button("Done"){
                        amountIsFocus = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
