//
//  Image + ext.swift
//  HOME19
//
//  Created by  Yaroslav on 27.09.21.
//

import Foundation
import UIKit

extension UIImage {
    func toString() -> String? {

        let pngData = self.pngData()
        return pngData?.base64EncodedString(options: .lineLength64Characters)
    }
}
