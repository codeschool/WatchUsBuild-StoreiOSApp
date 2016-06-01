//
//  Order.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 12/16/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    var product: Product?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.product = aDecoder.decodeObject(forKey: "product") as? Product
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(product, forKey: "product")
    }

}
