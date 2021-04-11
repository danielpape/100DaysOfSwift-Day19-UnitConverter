//
//  ContentView.swift
//  UnitConverter
//
//  Created by Daniel Pape on 11/04/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount:String = "5"
    @State private var unitFrom = 0
    @State private var unitTo = 1
    
    let units = ["Centimeters", "Inches", "Meters", "Yards"]
    
    var convertedAmount : Double {
        let amountToConvert = Double(amount) ?? 1.0
        var convertedAmount : Double = 0.0
        var fromValue:Double = 0.0
        var toValue:Double = 0.0
        
        switch unitTo {
        case 0:
            fromValue = 1
        case 1:
            fromValue = 0.3937008
        case 2:
            fromValue = 0.01
        case 3:
            fromValue = 0.01093613
        default:
            fromValue = 1
        }
        
        switch unitFrom {
        case 0:
            toValue = 1
        case 1:
            toValue = 0.3937008
        case 2:
            toValue = 0.01
        case 3:
            toValue = 0.01093613
        default:
            toValue = 1
        }
        
        convertedAmount = (Double(fromValue) / Double(toValue)) * Double(amountToConvert)
        return convertedAmount
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Which units would you like to convert?")){
                    Picker("from", selection: $unitFrom){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    Picker("to", selection: $unitTo){
                        ForEach(0..<units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                }
                Section(header: Text("How much would you like to convert?")){
                    TextField("Enter the amount", text: $amount)
                        .keyboardType(.decimalPad)
                        
                }
                Section{
                    Textgithub("\(amount) \(units[unitFrom]) is equal to \(convertedAmount, specifier: "%.2f") \(units[unitTo])")
                    
                }
            }
            .navigationTitle("Convert")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
