//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 11/16/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import Foundation

class Product: NSObject, NSCoding {
    var name: String?
    var productImage: String?
    var cellImage: String?
    var price: Double?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.productImage = aDecoder.decodeObject(forKey: "productImage") as? String
        self.cellImage = aDecoder.decodeObject(forKey: "cellImage") as? String
        self.price = aDecoder.decodeObject(forKey: "price") as? Double
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(productImage, forKey: "productImage")
        aCoder.encode(cellImage, forKey: "cellImage")
        aCoder.encode(price, forKey: "price")
    }

}