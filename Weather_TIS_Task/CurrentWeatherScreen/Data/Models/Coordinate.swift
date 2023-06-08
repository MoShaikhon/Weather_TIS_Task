//
//  Coordinate.swift
//  Weather
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

struct Coordinate: Codable {
    let lon, lat: Double
    
    static func emptyInit() -> Coordinate {
        return Coordinate(lon: 0, lat: 0)
    }
}
