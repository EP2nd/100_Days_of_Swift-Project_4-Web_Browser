//
//  TableViewController.swift
//  Project4
//
//  Created by Edwin Przeźwiecki Jr. on 22/03/2022.
//

/// Challenge 3:

import UIKit

class TableViewController: UITableViewController {
    
    var websites = ["apple.com", "hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Web Browser"
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "websiteName", for: indexPath)
        
        cell.textLabel?.text = websites[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webViewController = storyboard?.instantiateViewController(withIdentifier: "WebView") as? ViewController {
            webViewController.websiteToLoad = websites[indexPath.row]
            navigationController?.pushViewController(webViewController, animated: true)
        }
    }
}
