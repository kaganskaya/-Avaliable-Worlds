//
//  Router.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/15/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import UIKit

let router = Router()

class Router{
    
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
   
   
    func show(){
    
        let loginStatus = UserDefaults.standard.isLoggedIn()
        
       
            appDelegate!.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
        if loginStatus  {
    
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "worlds") as! WorldsController
    
                appDelegate!.window?.rootViewController = initialViewController
            
                appDelegate!.window?.makeKeyAndVisible()
    
        } else {
    
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "login") as! ViewController
    
                appDelegate!.window?.rootViewController = initialViewController
                appDelegate!.window?.makeKeyAndVisible()
    
    }
    }
}
