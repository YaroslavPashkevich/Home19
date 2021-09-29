//
//  GaleryViewController.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit
// MARK: View -
protocol GaleryViewProtocol: AnyObject {

}

class GaleryViewController: UIViewController {

	var presenter: GaleryPresenterProtocol = GaleryPresenter()

	override func viewDidLoad() {
        super.viewDidLoad()

        presenter.view = self
        presenter.viewDidLoad()
    }
}

extension GaleryViewController: GaleryViewProtocol {
    
}
