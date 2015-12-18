//
//  CartTableViewController.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 12/16/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var ordersInCart: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableHeaderView = headerView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        let product = Product()
//        product.name = "1907 Wall Set"
//        product.productImage = "phone-fullscreen1"
//        product.cellImage = "image-cell1"
//        product.price = 59.99
//
//        let order = Order()
//        order.product = product
        
        // read orders from disk
        
        ordersInCart = Orders.readOrdersFromArchive()
        if(ordersInCart == nil) {
            ordersInCart = []
        }
        
        tableView.reloadData()
        
        updateTotal()
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ordersInCart?.count ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CartCell", forIndexPath: indexPath)
        
        let order = ordersInCart?[indexPath.row]

        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            // save array to disk
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            if let orders = ordersInCart {
                Orders.saveOrdersToArchive(orders)
            }
            updateTotal()
        }
    }
    
    func updateTotal() -> Void {
        if let orders = ordersInCart {
            var total: Double = 0.0
            for order in orders {
                if let price = order.product?.price {
                    total = total + price
                }
            }
            totalLabel.text = String(total)
        }
    }

}
