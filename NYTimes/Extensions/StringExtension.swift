//
//  StringExtension.swift
//  NYTimes
//
//  Created by Yasheed Muhammed on 17/07/2021.
//

import Foundation

extension String {
    func formatedDate(fromFormat: String = "yyyy/MM/dd", toFormat: String = "dd MMM yyyy") -> String {
        let fromDateFormatter = DateFormatter()
        fromDateFormatter.dateFormat = fromFormat
        
        let toDateFormatter = DateFormatter()
        toDateFormatter.dateFormat = toFormat        
        let date = fromDateFormatter.date(from: self)
        if let date = date {
            return toDateFormatter.string(from: date)
        } else {
            return self
        }
    }
}
