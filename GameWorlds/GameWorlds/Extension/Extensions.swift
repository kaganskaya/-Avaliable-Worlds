//
//  Extensions.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/15/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    
    func setupHeader(view:UIView, name:String){
        
        let view1: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.09));
        
            view1.backgroundColor = UIColor(red: 1, green: 186/255.0, blue: 154/255.0, alpha: 1.0)

        let label: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width*0.8, height: view.bounds.height*0.08))
        
            label.textAlignment = .center
            label.text = name
        
        let logOut: UIButton = UIButton.init(frame: CGRect.init(x: view.bounds.minX+label.bounds.width, y: 0, width: view.bounds.width*0.2, height: view.bounds.height*0.08))
        
            logOut.addTarget(self, action: #selector(self.signOut), for: .touchUpInside)
            logOut.setTitle("log out", for: .normal)
            logOut.setTitleColor(.blue, for: .normal)
        
        
        view1.addSubview(label);
        view1.addSubview(logOut);
        
        self.tableHeaderView = view1
        
    }
    
    @objc func signOut() {

        UserDefaults.standard.setLoggedIn(value: false)
        router.show()
    }
    
}

extension UserDefaults{
    
    enum UserDefaultsParams : String {
        case isLoggedIn
        case login
        case password
    }
    
    func setParams(login:String,password:String){
        
        set(login, forKey: UserDefaultsParams.login.rawValue)
        set(password, forKey: UserDefaultsParams.password.rawValue)

    }
    func setLoggedIn(value: Bool) {
        set(value, forKey: UserDefaultsParams.isLoggedIn.rawValue)
    }
    
    func isLoggedIn()-> Bool {
        return bool(forKey: UserDefaultsParams.isLoggedIn.rawValue)
    }
    
    
    func getlogin() -> String{
        return string(forKey: UserDefaultsParams.login.rawValue)!
    }
    func getPass() -> String{
        return string(forKey: UserDefaultsParams.password.rawValue)!
    }
}
