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
        
        let label: UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height*0.08))
        
            view1.backgroundColor = UIColor(red: 1, green: 186/255.0, blue: 154/255.0, alpha: 1.0)
        
            label.textAlignment = .center
       
            label.text = name
       
        view1.addSubview(label);
        
        self.tableHeaderView = view1
        
    }
}
