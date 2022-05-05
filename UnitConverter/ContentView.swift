//
//  ContentView.swift
//  UnitConverter
//
//  Created by Gaurav Ganju on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    @State private var inputLength = 0.0
    @State private var inputUnit = "Meters"
    @State private var outputUnit = "Kilometers"
   // @FocusState private var isFocused:v Bool
    let conversionArray = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var convertMeters: Double {
        let length = Double(inputLength)
        if inputUnit == "Kilometers" {
            return length * 1000
        }
        else if inputUnit == "Feet" {
            return length * 0.3048
        }
        else if inputUnit == "Yard" {
            return length * 0.9144
        }
        else {
            return length * 1609.344
        }
    }
    
    var outputLength: Double {
        let convertedLength: Double
        if inputUnit == "Meters" {
            convertedLength = Double(inputLength)
        }
        else {
            convertedLength = convertMeters
        }
        if outputUnit == "Kilometers" {
            return convertedLength / 1000
        }
        else if outputUnit == "Feet" {
            return convertedLength / 0.3048
        }
        else if outputUnit == "Yard" {
            return convertedLength / 0.9144
        }
        else {
            return convertedLength / 1609.344
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input length", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                      //  .focused($isFocused)
                } header: {
                    Text("Enter Length")
                }
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(conversionArray, id:\.self) {
                            Text("\($0)")
                        }
                    }
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(conversionArray, id:\.self) {
                            Text("\($0)")
                        }
                    }

                }
                Section {
                    Text("\(outputLength.formatted()) \(outputUnit)")
                } header: {
                    Text("Converted Length is")
                }
                
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                    //    isFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
