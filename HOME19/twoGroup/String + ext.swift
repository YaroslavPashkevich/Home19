//
//  String + ext.swift
//  HOME19
//
//  Created by  Yaroslav on 27.09.21.
//

import Foundation
import UIKit

extension String {

        func stringToImage(_ handler: @escaping ((UIImage?)->())) {
            if let url = URL(string: self) {
                URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if let data = data {
                        let image = UIImage(data: data)
                        handler(image)
                    }
                }.resume()
            }
        }
    }
