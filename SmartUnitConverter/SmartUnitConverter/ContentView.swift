//
//  ContentView.swift
//  SmartUnitConverter
//
//  Created by Isaac Karam on 2/15/21.
//

import SwiftUI

struct ContentView: View {
    
    private let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var inputValue = ""
    
    var outputValue : Double{
        let initInput = Double(inputValue) ?? 0.0
        return initInput
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("From :")){
                    TextField("from value", text: $inputValue)
                    
                    createPicker(with: temperatureUnits, title: "Input unit", selection: $inputUnit)
                }
                .textCase(nil)
                
                
                Section(header: Text("To :")){
                    createPicker(with: temperatureUnits, title: "output unit", selection: $outputUnit)
                }.textCase(nil)
                Text("Result : \(outputValue, specifier: "%.2f") \(temperatureUnits[outputUnit])")
                
            }
            .navigationBarTitle("Unit Converter")
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.green/*@END_MENU_TOKEN@*/)
        }
    }
}

func createPicker(with dataList:[String], title: String, selection : Binding<Int>) -> some View{
   return  Picker(title, selection: selection) {
        ForEach(0..<dataList.count){
            Text("\(dataList[$0])")
        }
    }.pickerStyle(SegmentedPickerStyle())
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
