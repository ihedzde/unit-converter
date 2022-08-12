//
//  UnitPair.swift
//  unit-convertor
//
//  Created by Ivan Hedz on 12.08.2022.
//

import Foundation

struct UnitPair: Hashable {
    let inbound: String
    let outbound: String
    
    init(from inbound: String, to outbound: String) {
        self.inbound = inbound
        self.outbound = outbound
    }
    static func == (lup: UnitPair, rup: UnitPair) -> Bool {
        return lup.outbound == rup.outbound && lup.inbound == rup.inbound
    }
}
