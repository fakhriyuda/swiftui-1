//
//  TemperatureView.swift
//  WeSplit
//
//  Created by ISYS Macbook air 1 on 16/05/24.
//

import SwiftUI

struct TemperatureView: View {
    
    @State private var celciusDegree : Double = 0
    @State private var fahrenheitDegree: Double = 0
    @State private var kelvinDegree : Double = 0
    
    var tempKelvin : Double{
        let tempKelvin = celciusDegree + 273.15
        return tempKelvin
    }
    var fahrenheit : Double{
        let tempfahrenheit = celciusDegree * 1.8 + 32
        return tempfahrenheit
    }
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Celcius"){
                    TextField("Is it Hot?", value: $celciusDegree, format: .number)
                }
                Section("Fahrenheit"){
                    Text("\(fahrenheit,specifier: "%.2f")")
                }
                Section("Kelvin"){
                    Text("\(tempKelvin,specifier: "%.2f")")
                }
                
            }
            .navigationTitle("Temperatures App")
        }
    }
}

#Preview {
    TemperatureView()
}
