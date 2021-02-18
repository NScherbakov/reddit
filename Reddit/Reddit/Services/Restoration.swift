//
//  Restoration.swift
//  Reddit
//
//  Created by Nikolay on 18.02.2021.
//

import Foundation

class Restoration {
    static let shared = Restoration()
    
    var url: URL?
    var restorationKey = "restorationKey"
    
    private init() { }
}
