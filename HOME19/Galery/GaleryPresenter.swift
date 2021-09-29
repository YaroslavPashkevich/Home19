//
//  GaleryPresenter.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

// MARK: Presenter -
protocol GaleryPresenterProtocol {
	var view: GaleryViewProtocol? { get set }
    func viewDidLoad()
}

class GaleryPresenter: GaleryPresenterProtocol {

    weak var view: GaleryViewProtocol?

    func viewDidLoad() {

    }
}
