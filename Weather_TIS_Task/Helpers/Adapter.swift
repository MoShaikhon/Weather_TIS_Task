//
//  Adapter.swift
//  Weather_TIS_Task
//
//  Created by Mohamad Shaikhon on 08/06/2023.
//

import Foundation

protocol Adapting{
    associatedtype FromType
    associatedtype ToType
    func adapt(from data: FromType) -> ToType
}
