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
        print("Button tapped")
    }
}
    