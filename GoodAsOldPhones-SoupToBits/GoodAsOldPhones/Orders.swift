//
//  Orders.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 12/16/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import UIKit

class Orders: NSObject, NSCoding {
    var orders: [Order]?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.orders = aDecoder.decodeObject(forKey: "orders") as? [Order]
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(orders, forKey: "orders")
    }
    
    class func archiveFilePath() -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("cart.archive").path
    }
    
    class func readOrdersFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveFilePath()) as? [Order]
    }
    
    class func saveOrdersToArchive(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }
}
