//
//  Presenter.swift
//  GameWorlds
//
//  Created by liza_kaganskaya on 6/15/19.
//  Copyright © 2019 liza_kaganskaya. All rights reserved.
//

import Foundation
import RxSwift

class Presenter {
    
    weak var view:WorldsView?
    
    let np = NetworkProvider()
    
    private var disposeBag = DisposeBag()
    
    let login:String = " "
    let password:String = " "
    
    func getWorlds(){
        
        np.getWorlds(login:login, password: password).subscribe(
            onNext: { n in
                self.view?.showAwaliableWorlds(worlds: n)
                
        }, onError: { err in
            print(err.localizedDescription)
            
        }, onCompleted: {
            //print(" onCompleted")
        }, onDisposed: {
            //print("onDisposed")
        }).disposed(by: disposeBag)
        
    }
    
}
