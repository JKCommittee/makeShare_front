//
//  RequestViewController.swift
//  makeShare
//
//  Created by Masahiko Hyodo on 2015/12/11.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit
class RequestViewController: UIViewController {
    
    
    @IBOutlet weak var requestText: UILabel!
    var selectedId: Int!
    var selectedUserId: Int!
    
    let mainColor = UIColor(red: 52.0/255.0, green: 152.0/255.0, blue: 219.0/255.0, alpha: 1)
    let secondaryColor = UIColor(red: 219.0/255.0, green: 52.0/255.0, blue: 151.0/255.0, alpha: 1)
    let darkColor = UIColor(red: 31.0/255.0, green: 31.0/255.0, blue: 33.0/255.0, alpha: 1)
    let lightColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1)
    
    var test: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestText.text = "リクエストを送ります。メッセージを入力してください。"
        //print(selectedId)
        //print(selectedUserId)
    }
    
    @IBAction func pushCansel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    
    
    
}