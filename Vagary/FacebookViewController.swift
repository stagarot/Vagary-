//
//  FacebookViewController.swift
//  Computer Science IA
//
//  Created by  Sara Tagarot on 19/03/18.
//  Copyright © 2018 Unknown. All rights reserved.
//

import UIKit
//imported things from the pod files
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class FacebookViewController: UIViewController {
    
    var dict : [String : AnyObject]!
    
    //label to display name of logged in user
    @IBOutlet weak var labelUserEmail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //error object
        var error : NSError?
        
        //creating button
        let loginButton = LoginButton(readPermissions: [ .publicProfile ])
        loginButton.center = view.center
        
        view.addSubview(loginButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //manages the login action of the user
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        
        loginManager.logIn(readPermissions: [.publicProfile], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error) //lets the user know that there has been an  error
            case .cancelled:
                print("User cancelled login") //lets the user know that they have cancelled the login
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in") //lets the user know that they have logged in 
            }
        }
    }
    
    //function is fetching the user data
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }



}
