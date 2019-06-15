//
//  ViewController.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/14/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var login: UITextField!
    
    weak var worldsView:WorldsView?
    
    @IBAction func loginB(_ sender: Any) {
        
        
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "worlds") as? WorldsController else { return }
        
        detailVC.password = self.pass.text!
        detailVC.login = self.login.text!
        
        self.showDetailViewController(detailVC, sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        pass.resignFirstResponder()
        login.resignFirstResponder()
    }
    
    
}

