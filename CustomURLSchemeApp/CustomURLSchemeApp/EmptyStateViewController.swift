//
//  EmptyStateViewController.swift
//  CustomURLSchemeApp
//
//  Created by Zoran Todorovic on 01/06/2017.
//  Copyright © 2017 Zoran Todorovic. All rights reserved.
//

import UIKit
import PureLayout

class EmptyStateViewController: UIViewController {
    
    let testLink = URL(string: "myappscheme://test_page/one?token=12345&domain=foo.com&tel=0958048810")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTestButton()
    }

    func setTestButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        view.addSubview(button)
        button.autoAlignAxis(toSuperviewAxis: .vertical)
        button.autoAlignAxis(toSuperviewAxis: .horizontal)
        button.setTitle("Test", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(openTestLink), for: .touchUpInside)
    }
    
    func openTestLink() {
        UIApplication.shared.open(testLink!, options: [:], completionHandler: nil)
    }
    
}
