//
//  TwoPresenter.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation


// MARK: Presenter -
protocol TwoPresenterProtocol {
	var view: TwoViewProtocol? { get set }
    
    func addImage(imageString: Data)
    func numberOfImageArray() -> Int
    func elementInImageArray(for indexPath: IndexPath) -> Data
    func viewDidLoad()
}

class TwoPresenter: TwoPresenterProtocol {
    private var imageArray:[Data] = []
    
    weak var view: TwoViewProtocol?
    
    func viewDidLoad() {

    }
    
    func numberOfImageArray() -> Int {
        return imageArray.count
    }
    
    func addImage(imageString:  Data) {
        imageArray.append(imageString)
        view?.updateTableView()
    }
    
    func elementInImageArray(for indexPath: IndexPath) -> Data {
        return imageArray[indexPath.row]
    }
    
}
