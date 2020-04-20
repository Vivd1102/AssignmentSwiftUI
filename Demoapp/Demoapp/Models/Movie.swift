//
//  Movie.swift
//  Demoapp
//
//  Created by vivek bajirao deshmukh on 17/04/20.
//  Copyright © 2020 vivek bajirao deshmukh. All rights reserved.
//

import Foundation

struct Movie: Decodable, Identifiable {
    public var id: String
    public var name: String
    public var released: String
    let main: Weather

//        init(name: String, lastLogin: String) {
//            self.name = name
//            self.released = lastLogin
//        }
    
}

struct Weather: Decodable {
     public var name: String
     public var released: String
}
