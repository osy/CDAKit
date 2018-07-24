//
//  hl7_helper.swift
//  CDAKit
//
//  Created by Eric Whitley on 12/17/15.
//  Copyright © 2015 Eric Whitley. All rights reserved.
//

import Foundation

/**
Assistive functions to help conform to HL7 formats
*/
open class CDAKHL7Helper {
  
  /**
  Converts an HL7 timestamp into an Integer
   - parameter timestamp: [String] the HL7 timestamp. Expects YYYYMMDD format
   - returns: [Integer] Date in seconds since the epoch
  */
  open class func timestamp_to_integer(_ timestamp: String?) -> Double? {
    
    if let _timestamp = timestamp {
      if _timestamp.count >= 4 {

        let index = _timestamp.index(_timestamp.startIndex, offsetBy: 4)
        let year = String(_timestamp[..<index])

        var month = "01"
        if _timestamp.count >= 6 {
            let start = _timestamp.index(_timestamp.startIndex, offsetBy: 4)
            let end =   _timestamp.index(_timestamp.startIndex, offsetBy: 6)
            month =  String(_timestamp[start..<end])
        }

        var day = "01"
        if _timestamp.count >= 8 {
            let start = _timestamp.index(_timestamp.startIndex, offsetBy: 6)
            let end =   _timestamp.index(_timestamp.startIndex, offsetBy: 8)
            day = String(_timestamp[start..<end])
        }

        var hour = "00"
        if _timestamp.count >= 10 {
            let start = _timestamp.index(_timestamp.startIndex, offsetBy: 8)
            let end =   _timestamp.index(_timestamp.startIndex, offsetBy: 10)
            hour =  String(_timestamp[start..<end])
        }

        var min = "00"
        if _timestamp.count >= 12 {
            let start = _timestamp.index(_timestamp.startIndex, offsetBy: 10)
            let end =   _timestamp.index(_timestamp.startIndex, offsetBy: 12)
            min =  String(_timestamp[start..<end])
        }

        var sec = "00"
        if _timestamp.count >= 14 {
            let start = _timestamp.index(_timestamp.startIndex, offsetBy: 12)
            let end =   _timestamp.index(_timestamp.startIndex, offsetBy: 14)
            sec =  String(_timestamp[start..<end])
        }
        
        let dateString = ("\(year)\(month)\(day)\(hour)\(min)\(sec)")
        
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyyMMddHHmmss"
        
        dateStringFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateStringFormatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
        
        dateStringFormatter.locale = Locale(identifier: "en_US_POSIX")
        let d = dateStringFormatter.date(from: dateString)
        
        if let d = d {
          return d.timeIntervalSince1970
        }
      }
    }
    
    return nil
  }
  
}
