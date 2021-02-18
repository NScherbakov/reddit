//
//  Double+Extenstion.swift
//  Reddit
//
//  Created by Nikolay on 15.02.2021.
//

import Foundation

extension Double {
    func toHoursAgo() -> Int {
        let date = NSDate(timeIntervalSince1970: self)
        let hours = Calendar.current.component(.hour, from: date as Date)
        return hours
    }
}
