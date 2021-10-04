//
//  TwoPresenter.swift
//  HOME19
//
//  Created  Yaroslav on 26.09.21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit


// MARK: Presenter -
protocol TwoPresenterProtocol {
    var view: TwoViewProtocol? { get set }
    
    func addImage(imageData: Data)
    func numberOfImageArray() -> Int
    func elementInImageArray(for indexPath: IndexPath) -> Data
    func removeCell(for indexPath: IndexPath)
    
    func viewDidLoad()
}

class TwoPresenter: TwoPresenterProtocol {
    private var imageArray:[ImageGalery] = []
    
    weak var view: TwoViewProtocol?
    
    func viewDidLoad() {
        
        //        читаем данные с базы данныхи перемещаем их в массив
        DatabaseService.shared.entitiesFor(type: ImageGalery.self,
                                           context: DatabaseService.shared.persistentContainer.mainContext,
                                           closure: { images in
            self.imageArray = images
            self.view?.updateTableView()
        })
        //////////////////////////////////////
    }
    
    func numberOfImageArray() -> Int {
        return imageArray.count
    }
    
    func addImage(imageData:  Data) {
        //        сохраняем в дата соре
        DatabaseService.shared.insertEntityFor(
            type: ImageGalery.self,
            context: DatabaseService.shared.persistentContainer.mainContext,
            closure: { newImage in
                newImage.imageFromGalery = imageData
                DatabaseService.shared.saveMain({
                    self.imageArray.append(newImage)
                    self.view?.updateTableView()
                })
            })
        // ///////////////////////////
        
    }
    
    func elementInImageArray(for indexPath: IndexPath) -> Data {
        return imageArray[indexPath.row].imageFromGalery
    }
    
    func removeCell(for indexPath:IndexPath) {
        //       удаляем и сохраняем в дата соре
        DatabaseService.shared.delete(imageArray[indexPath.row], context: DatabaseService.shared.persistentContainer.mainContext) { _ in
            DatabaseService.shared.saveMain({
                self.imageArray.remove(at: indexPath.row)
                self.view?.removeCell(to: indexPath)
            }
            )
        }
    }
    
    
}
