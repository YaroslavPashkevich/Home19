//
//  OnePresenter.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit

// MARK: Presenter -
protocol OnePresenterProtocol {
	var view: OneViewProtocol? { get set }
    func viewDidLoad()
    func nextScreen()
    func alert()
    
}

class OnePresenter: OnePresenterProtocol {
    func alert() {
        view?.alertMessage()
    }
    
    func viewDidLoad() {
        
    }
    
  
weak var view: OneViewProtocol?


    func nextScreen() {
        let text = view?.textFieldString()
        if text == Constans.password {
        view?.nextScreen()
        } else {
            alert()
    }

}


}
