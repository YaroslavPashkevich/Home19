//
//  ImageGalery+CoreDataClass.swift
//  HOME19
//
//  Created by  Yaroslav on 3.10.21.
//
//

import Foundation
import CoreData

@objc(ImageGalery)
public class ImageGalery: NSManagedObject, Identifiable {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageGalery> {
        return NSFetchRequest<ImageGalery>(entityName: "ImageGalery")
    }

    @NSManaged public var imageFromGalery: Data
}
