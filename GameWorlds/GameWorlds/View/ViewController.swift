//
//  ViewController.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/14/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var login: UITextField!
    
    weak var mainView:WorldsView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func loginB(_ sender: Any) {
        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "detail") as? WorldsController else { return }
        

        
    }
    
}

