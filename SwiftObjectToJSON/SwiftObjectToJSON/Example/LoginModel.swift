//
//  LoginModel.swift
//  SwiftObjectToJSON
//
//  Created by hmspl on 21/10/17.
//  Copyright © 2017 hmspl. All rights reserved.
//

import UIKit
//Sample Data model

class LoginReq : AMSwiftBase  {
    
    var username : String = ""
    var password : String = ""
    var mode : [String]?
    var location : [Location]?
    var deviceToken : String?
    
    init(username: String , password: String, mode: [String]?,location: [Location]?, deviceToken: String?) {
        super.init()
        self.username = username
        self.password = password
        self.location = location
        self.mode = mode
        self.deviceToken = deviceToken
    }
    
}



class Location : AMSwiftBase {
    var lat : Double?
    var lng : Double?
    
    
    init(lat : Double?, lng : Double?) {
        super.init()
        self.lat = lat
        self.lng = lng
    }
}

