//
//  ContactViewController.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 11/16/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scrollView.contentSize = CGSizeMake(375, 800)
    }
}
