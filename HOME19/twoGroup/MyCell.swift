//
//  MyCell.swift
//  HOME19
//
//  Created by  Yaroslav on 27.09.21.
//

import Foundation
import UIKit


class MyCell: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
    
    func update(with image: Data) {
        
//    преобразовываем дату в картинку и записываем в картинку в ячейке
        
        imageCell.image = UIImage(data: image)
    }
}
