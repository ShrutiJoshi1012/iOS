//
//  HomeViewController.swift
//  RentApp
//
//  Created by Shruti Joshi on 5/11/16.
//  Copyright © 2016 cmpe277. All rights reserved.
//

import UIKit
import Google

class HomeViewController: UIViewController {

    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var logOutBtn: UIButton!
    
    @IBOutlet weak var userNameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Inside Home screen")
        
        

        
        if FBSDKAccessToken.currentAccessToken() != nil {
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
            
            
            let first_name: String = (result.objectForKey("first_name") as? String)!
            let last_name: String = (result.objectForKey("last_name") as? String)!
            let profile_pic: String = (result.objectForKey("picture")?.objectForKey("data")?.objectForKey("url") as? String)!
            
            var label="Hello, "
            label+=first_name
            label+=" "
            label+=last_name
           
//            self.userNameLbl.text = label
            self.usernameL.text = "fgfgfgf"
            
            print("Full Name= " + label)
            
           // self.ivUserProfileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string:profile_pic)!)!)
            
            }
        
        }
        
       
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didLogOut(sender: AnyObject) {
        
    }

}
