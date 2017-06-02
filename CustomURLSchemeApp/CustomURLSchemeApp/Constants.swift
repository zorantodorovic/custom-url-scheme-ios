//
//  Constants.swift
//  CustomURLSchemeApp
//
//  Created by Zoran Todorovic on 01/06/2017.
//  Copyright © 2017 Zoran Todorovic. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    static let base64ImageString = UIImagePNGRepresentation(#imageLiteral(resourceName: "swift-og"))?.base64EncodedString() ?? ""
    static let urlString = "myappscheme://test_page/one?token=12345&url=http://www.foo.com&mail=zoran336@gmail.com&tel=+385958048810&image=\(base64ImageString)"
}
