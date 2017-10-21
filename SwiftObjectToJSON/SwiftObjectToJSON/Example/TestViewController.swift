//
//  TestViewController.swift
//  SwiftObjectToJSON
//
//  Created by hmspl on 21/10/17.
//  Copyright © 2017 hmspl. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var lblPrint: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
      

  
        
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func convertAction(_ sender: Any) {
        
          let location = Location(lat: nil, lng: 21.0023)
        let loginrequest = LoginReq(username: "test1@swiftytutorial.com", password: "123456", mode: ["IOS","SWIFT"], location: [location], deviceToken: nil)
        
        lblPrint.text = loginrequest.JSONString()
        print(lblPrint.text ?? "")
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
