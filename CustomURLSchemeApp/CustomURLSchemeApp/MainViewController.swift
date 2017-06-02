//
//  MainViewController.swift
//  CustomURLSchemeApp
//
//  Created by Zoran Todorovic on 01/06/2017.
//  Copyright © 2017 Zoran Todorovic. All rights reserved.
//

import UIKit
import PureLayout

enum QueryDataType {
    case url
    case tel
    case mail
    case image
    case unknown
}

class MainViewController: UIViewController {
    
    var queriesArray: [String]
    var tableViewData = [(String, String, QueryDataType)]()
    
    let tableView = UITableView(frame: CGRect.zero, style: .grouped)
    let cellId = "cellId"
    
    init(queries: [String]) {
        self.queriesArray = queries
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.parseQueryData()
    }
    
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
        self.tableView.autoPinEdgesToSuperviewEdges()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 50
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    private func parseQueryData() {
        for query in self.queriesArray {
            let splitted = query.characters.split{ $0 == "=" }.map(String.init)
            let title = splitted[0]
            let value = splitted[1]
            let type = self.checkDataType(data: title)
            print(type)
            self.tableViewData.append( (title , value, type) )
        }
        self.tableView.reloadData()
    }
    
    private func checkDataType(data: String) -> QueryDataType {
        switch data {
        case "tel":
            return QueryDataType.tel
        case "url":
            return QueryDataType.url
        case "image":
            return QueryDataType.image
        case "mail":
            return QueryDataType.mail
        default:
            return QueryDataType.unknown
        }
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return queriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let data = tableViewData[indexPath.row]
        cell.textLabel?.text = "\(data.0): \(data.1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = tableViewData[indexPath.row]
        let cellType = cellData.2
        let dataValue = cellData.1
        switch cellType {
        case .url:
            self.openURLString(data: dataValue)
        case .tel:
            self.callPhoneNumber(data: dataValue)
        case .mail:
            self.openMail(data: dataValue)
        case .image:
            self.openImageView(imageString: dataValue)
        default:
            break
        }
    }
    
}

extension MainViewController {
    
    func openURLString(data: String) {
        guard let url = URL(string: data) else {
            return
        }
        self.openURL(url: url)
    }
    
    func callPhoneNumber(data: String) {
        guard let phoneURL = URL(string: "telprompt://\(data)") else {
            return
        }
        self.openURL(url: phoneURL)
    }
    
    func openMail(data: String) {
        guard let mailURL = URL(string: "mailto://\(data)") else {
            return
        }
        self.openURL(url: mailURL)
    }
    
    func openImageView(imageString: String) {
        let imagePreviewVC = ImagePreviewViewController(image: #imageLiteral(resourceName: "swift-og"))
        self.navigationController?.pushViewController(imagePreviewVC, animated: true)
    }
    
    func openURL(url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    
}



