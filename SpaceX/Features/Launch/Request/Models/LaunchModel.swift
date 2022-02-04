//
//  LaunchModel.swift
//  SpaceX
//
//  Created by Salim Maalouf on 2/2/22.
//

import Foundation

struct LaunchModel : Codable {
    let fairings : Fairings?
    let links : Links?
    let staticFireDateUTC : String?
    let staticFireDateUnix : Int?
    let net : Bool?
    let window : Int?
    let rocket : String?
    let success : Bool?
    let failures : [Failures]?
    let details : String?
    let crew : [String]?
    let ships : [String]?
    let capsules : [String]?
    let payloads : [String]?
    let launchpad : String?
    let flightNumber : Int?
    let name : String?
    let dateUTC : String?
    let dateUnix : Int?
    let dateLocal : String?
    let datePrecision : String?
    let upcoming : Bool?
    let cores : [Cores]?
    let autoUpdate : Bool?
    let tbd : Bool?
    let launchLibraryId : String?
    let id : String?
    
    enum CodingKeys: String, CodingKey {
        case fairings = "fairings"
        case links = "links"
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case net = "net"
        case window = "window"
        case rocket = "rocket"
        case success = "success"
        case failures = "failures"
        case details = "details"
        case crew = "crew"
        case ships = "ships"
        case capsules = "capsules"
        case payloads = "payloads"
        case launchpad = "launchpad"
        case flightNumber = "flight_number"
        case name = "name"
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming = "upcoming"
        case cores = "cores"
        case autoUpdate = "auto_update"
        case tbd = "tbd"
        case launchLibraryId = "launch_library_id"
        case id = "id"
    }
}
