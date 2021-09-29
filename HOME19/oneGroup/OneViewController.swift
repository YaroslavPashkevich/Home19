//
//  OneViewController.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
// MARK: View -
protocol OneViewProtocol: AnyObject {
    func nextScreen()
    func textFieldString() -> String
    
    func alertMessage()
}

class OneViewController: UIViewController {

    @IBOutlet private weak var textField: UITextField!
    
	var presenter: OnePresenterProtocol = OnePresenter()

    
    
	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }
    

    @IBAction func nextButtonPressed() {
        
   
            presenter.nextScreen()
       
    
}

}


extension OneViewController: OneViewProtocol {
    
    func alertMessage() {
    let alertVC = UIAlertController(title: "ERROR", message: "Не верный логин", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { _ in
                            print("Cancell")
                        }))
        present(alertVC, animated: true, completion: nil)
    }
    
    
    func textFieldString() -> String {
        return "\(textField.text ?? "")"
    }
    
    func nextScreen() {
    let twoVC = UIStoryboard(name: "Two", bundle: Bundle.main)
    guard let guardVC = twoVC.instantiateViewController(identifier: "TwoViewController") as? TwoViewController else { return}
    navigationController?.pushViewController(guardVC, animated: true)
        
        
}
}
