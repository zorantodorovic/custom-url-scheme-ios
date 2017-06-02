//
//  ImagePreviewViewController.swift
//  CustomURLSchemeApp
//
//  Created by Zoran Todorovic on 02/06/2017.
//  Copyright © 2017 Zoran Todorovic. All rights reserved.
//

import UIKit

class ImagePreviewViewController: UIViewController {
    
    let imageView = UIImageView()
    var image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupImageView()
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        imageView.autoPinEdgesToSuperviewEdges()
        imageView.contentMode = .scaleToFill
        imageView.image = self.image
        
        let label = UILabel()
        view.addSubview(label)
        label.autoAlignAxis(toSuperviewAxis: .vertical)
        label.autoAlignAxis(toSuperviewAxis: .horizontal)
        label.textColor = UIColor.gray
        label.text = "Asseco confidential"
        label.font = UIFont.systemFont(ofSize: 20)
    }
    
}
