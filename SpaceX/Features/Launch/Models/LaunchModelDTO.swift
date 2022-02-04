//
//  LaunchModelDTO.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct LaunchModelDTO : Codable {
    let links : Links?
    let rocket : String?
    let details : String?
    let flightNumber : Int?
    let dateUTC : String?
    let dateUnix : Int?
    let autoUpdate : Bool?
    let id : String?
    let upcoming : Bool?
    let success : Bool?
    
    var isInLast3Years: Bool {
        if let dateUnix = dateUnix {
            let interval = TimeInterval(dateUnix)
            let calendar = Calendar.current
            let date = Date(timeIntervalSince1970: interval)
            let startOfNow = calendar.startOfDay(for: Date())
            let startOfTimeStamp = calendar.startOfDay(for: date)
            let components = calendar.dateComponents([.second], from: startOfTimeStamp, to: startOfNow)
            let differenceInSec = components.second!
            let totalInSec = (365 * 24 + 6) * 60 * 60 * 3
            if differenceInSec > 0 && differenceInSec < totalInSec {
                return true
            }
            return false
        }
        return false
    }
    
    var shouldBePresented: Bool {
        if isInLast3Years && (upcoming == true || success == true) {
            return true
        }
        return false
    }
}
