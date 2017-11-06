//
//  SwiftToJsonMapper.swift
//  SwiftObjectToJSON
//
//  Created by hmspl on 21/10/17.
//  Copyright © 2017 hmspl. All rights reserved.
//

import UIKit

protocol SwiftJsonMappable {
    func getDictionary() -> [String: Any]
    func JSONString() -> String
}


extension SwiftJsonMappable {
    
    //Convert the Swift dictionary to JSON String
    func JSONString()  -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self.getDictionary(), options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            // here "decoded" is of type `Any`, decoded from JSON data
            return jsonString
            // you can now cast it with the right type
            
        } catch {
            print(error.localizedDescription)
        }
        return ""
        
    }
    
    //Convert Swift object to Swift Dictionary
    func getDictionary() -> [String: Any] {
        var request : [String : Any] = [:]
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            if let lable = child.label {
                
                //For Nil value found for any swift propery, that property should be skipped. if you wanna print nil on json, disable the below condition
                if !checkAnyContainsNil(object: child.value) {
                    
                    
                    //Check whether is custom swift class
                    if isCustomType(object: child.value) {
                        //Checking whether its an array of custom objects
                        if isArrayType(object: child.value) {
                            if let objects = child.value as? [AMSwiftBase] {
                                var decodeObjects : [[String:Any]] = []
                                for object in objects {
                                    //If its a custom object, nested conversion of swift object to Swift Dictionary
                                    decodeObjects.append(object.getDictionary())
                                }
                                request[lable] = decodeObjects
                                
                            }
                        }else {
                            
                            //Not an arry, and custom swift object, convert it to swift Dictionary
                            request[lable] = (child.value as! AMSwiftBase).getDictionary()
                        }
                    }else {
                        request[lable] = child.value
                    }
                }
            }
        }
        return request
    }
    
    //Checking the swift object is swift base type or custom Swift object
    private func isCustomType(object : Any) -> Bool {
        
        let typeString = String(describing: type(of: object))
        if typeString.contains("String") || typeString.contains("Double") || typeString.contains("Bool") {
            return false
        }
        return true
    }
    
    //checking array
    private func isArrayType(object : Any) -> Bool {
        
        let typeString = String(describing: type(of: object))
        if typeString.contains("Array"){
            return true
        }
        return false
    }
    
    //Checking nil object
    private func checkAnyContainsNil(object : Any) -> Bool {
        let value = "\(object)"
        if value == "nil" {
            return true
        }
        return false
    }
    
}
