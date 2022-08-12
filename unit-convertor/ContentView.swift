//
//  ContentView.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import SwiftUI


struct ContentView: View {
    

    @State var selectedSystem: Unit = .Time
    
    @State var fromUnit: String = Time.Day.rawValue
    @State var fromValue: Double = 1
    
    @State var toUnit: String = Time.Hour.rawValue
    
    var selectedUnitPair: UnitPair {
        return UnitPair(from: fromUnit, to: toUnit)
    }
    
    var toValue: Double {
        return conversionService.convertUnits(pair: selectedUnitPair, value: fromValue)
    }
    
    @State var fromUnits: [String] = Temperature.allCases.map{value in value.rawValue}
    @State var toUnits: [String] = Temperature.allCases.map{value in value.rawValue}
    
    var conversionService = ConversionService()
    
    @FocusState private var ammountIsFocused: Bool
    
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    Picker("Select unit system:", selection: $selectedSystem){
                        ForEach(Unit.allCases, id: \.self) {
                            Text("\($0.rawValue)")
                        }
                    }
                }
                switch(selectedSystem) {
                    case .Temperature:
                        Picker("In Unit", selection: $fromUnit) {
                            ForEach(Temperature.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("Out Unit", selection: $toUnit) {
                            ForEach(Temperature.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    case .Time:
                        Picker("In Unit", selection: $fromUnit) {
                            ForEach(Time.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("Out Unit", selection: $toUnit) {
                            ForEach(Time.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    case .Volume:
                        Picker("In Unit", selection: $fromUnit) {
                            ForEach(Volume.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("Out Unit", selection: $toUnit) {
                            ForEach(Volume.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    case .Length:
                        Picker("In Unit", selection: $fromUnit) {
                            ForEach(Length.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        Picker("Out Unit", selection: $toUnit) {
                            ForEach(Length.allCases.map{value in value.rawValue}, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                    Section {
                        TextField("Type here", value: $fromValue, format: .number)
                            .keyboardType(.numberPad)
                            .focused($ammountIsFocused)
                    } header: {
                        Text("Input value")
                    }
                    Section {
                        Text("\(toValue)")
                    } header: {
                        Text("Result")
                    }
                }
            }
            .navigationTitle("Unit Convertor App")
            .toolbar {
                ToolbarItemGroup (placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        ammountIsFocused = false
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
