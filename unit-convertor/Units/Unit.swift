//
//  Units.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import SwiftUI

enum Unit: String, Equatable, CaseIterable {
    case Volume
    case Temperature
    case Time
    case Length
    
    var localizedName: LocalizedStringKey {LocalizedStringKey(rawValue)}
}

