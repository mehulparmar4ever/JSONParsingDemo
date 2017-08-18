//
//  Array.swift
//  Mehul Parmar
//
//  Created by Mehul Parmar on 15/06/16.
//  Copyright © 2017 Sooryen Innovation labs. All rights reserved.
//

import UIKit

extension Array {
    
    mutating func appendAtBeginning(_ newItem : Element) {
        let copy = self
        self = []
        self.append(newItem)
        self.append(contentsOf: copy)
    }
    
}

extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
