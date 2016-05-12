//
//  ViewController.swift
//  RentApp
//
//  Created by Shruti Joshi on 5/11/16.
//  Copyright © 2016 cmpe277. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Google


class ViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInUIDelegate {

    @IBOutlet weak var fbLoginBtn: FBSDKLoginButton!
    
    @IBOutlet weak var gidLoginBtn: GIDSignInButton!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        fbLoginBtn.delegate = self
        fbLoginBtn.readPermissions = ["email","public_profile"]
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if error != nil {
            print("FB login failed")
            print(error.localizedDescription)
            return
            
        }
        else {
            
            let userToken = result.token
            print("Login Completed " + userToken.tokenString)
            
            //Go to Home Page
            
            let homePage = self.storyboard?.instantiateViewControllerWithIdentifier("homeScreen") as! HomeViewController
            
            //self.performSegueWithIdentifier("goto_home", sender: self)
            
            self.presentViewController(homePage, animated: true, completion: nil)
            
           
            
            
            
        }
        
        
    }
    
    
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
    }
    
  

    
    
    override func viewDidAppear(animated: Bool) {
        let isFBLoggedIn = FBSDKAccessToken.currentAccessToken()
        
        if isFBLoggedIn != nil {
           
            self.performSegueWithIdentifier("goto_home", sender: self)
            print("User is logged in using Facebook")
        }
        
        
        
        if GIDSignIn.sharedInstance().hasAuthInKeychain() {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            if let homeViewController = storyBoard.instantiateViewControllerWithIdentifier("homeScreen") as? HomeViewController {
                
                self.presentViewController(homeViewController, animated: true, completion: nil)
                
                print("User is logged in using Google")
            }
        }

    }
  

}

