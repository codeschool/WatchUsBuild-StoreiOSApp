//
//  ProductViewController.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 11/15/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    var product: Product?

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let p = product {
            productNameLabel.text = p.name
            if let i = p.productImage {
                productImageView.image = UIImage(named: i)
            }
        }
        
        
    }

    @IBAction func addToCartPressed(sender: AnyObject) {
        guard let product = product, let name = product.name, let price = product.price else {
            return
        }
        
        let alertController = UIAlertController(title: "Added to Cart", message: "You added \(name) to the cart and it costs $\(price)", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        
        presentViewController(alertController, animated: true, completion: nil)

        let order = Order()
        order.product = product
        
        var ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        ordersInCart?.append(order)
        
        if let orders = ordersInCart {
            Orders.saveOrdersToArchive(orders)
        }
        
    }
}
    