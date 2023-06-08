//
//  URLBuilder.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 07/06/2023.
//

import Foundation

protocol URLBuilding {
    var scheme: String {get}
    var host: String {get}
    var path: String {get}
    var query: String {get}
    var method: RequestMethod {get}
    var headers: [String: String]? {get}
    var body: [String: String]? {get}
}
enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}
