//
//  ViewController.swift
//  SimpleSideMenu
//
//  Created by Oğuz Karatoruk on 12.01.2019.
//  Copyright © 2019 Oğuz Karatoruk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let MENU = ["Home","Profile","Settings","Info"]
    let MENUICONS = ["home","profile","settings","info"]

    @IBOutlet weak var tableView: UITableView!

    var menuishidden = true
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame.origin.x = -280
    }
    
    @IBAction func hamBtn(_ sender: Any) {
        hideorshowmenu()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MENU.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let menu : UILabel = cell.contentView.viewWithTag(11) as! UILabel
        let icon : UIImageView = cell.contentView.viewWithTag(10) as! UIImageView
        menu.text = MENU[indexPath.row]
        icon.image = UIImage(named: MENUICONS[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row #\(indexPath.row)!")
        hideorshowmenu()
        switch indexPath.row {
        case 0:
            print("Home")
        case 1:
            print("Profile")
        case 2:
            print("Settings")
        case 3:
            print("Info")
        default:
            break
    }
    }
    //
    
    func hideorshowmenu(){
        if menuishidden==false {
            UIView.animate(withDuration: 0.3) {
                let x = self.tableView.frame.origin.x
                self.tableView.frame.origin.x = x - 280
            }
            menuishidden = true
        } else {
            UIView.animate(withDuration: 0.3) {
                let x = self.tableView.frame.origin.x
                self.tableView.frame.origin.x = x + 280
            }
            menuishidden = false
        }
    }
    
}


