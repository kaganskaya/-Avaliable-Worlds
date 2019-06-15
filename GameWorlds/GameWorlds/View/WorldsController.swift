//
//  WorldsController.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/15/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import UIKit

class WorldsController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    let presenter = Presenter()
    var login:String = ""
    var password:String = ""
    var data:[Worlds] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.setupHeader(view: self.view, name: "Game Worlds")

        self.presenter.view = self
        self.presenter.login = self.login
        self.presenter.password = self.password
        self.presenter.getWorlds()
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    

   

}
extension WorldsController: UITableViewDelegate, UITableViewDataSource, WorldsView {
   
    func showAwaliableWorlds(worlds: [Worlds]) {
        self.data = worlds
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.white
        } else {
            cell.backgroundColor =  UIColor(red: 196/255.0, green: 230/255.0, blue: 1, alpha: 1.0) 
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldCell",for: indexPath) as? WorldsTableViewCell

        cell?.worldLabel.text = data[indexPath.row].language
        
        return cell!
        
    }
    
    
    
    
    
}
