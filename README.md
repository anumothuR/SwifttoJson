# SwifttoJson

#### Description

Swift to Json will help you to print the swift model object to Json string. This Class contain two main funtions. 
1. convert swift object to swift Dictionary. 
2. Convert swift object to JSONString


#### How to use 

1. Download SourceCode folder and add it to your project. 

2. Create you model class. It shoud be subclass of "AMSwiftBase"

  example 
  
  ```
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

  
  ```

3. Create your model object wherever you want. 

```
 let location = Location(lat: nil, lng: 21.0023)
        let loginrequest = LoginReq(username: "test1@swiftytutorial.com", password: "123456", mode: ["IOS","SWIFT"], location: [location], deviceToken: nil)

```

4. Use "JSONString()" function to print json string. 

```
loginrequest.JSONString()
```

5. Use "getDictionary()" function to get Swift Object

```
loginrequest.getDictionary()
```

Thats all. Enjoy.
