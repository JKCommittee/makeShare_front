//
//  ViewController.swift
//  makeShare
//
//  Created by Masahiko Hyodo on 2015/11/02.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableview: UITableView!
    
    //let fruitsList:[String] = ["Apple","Orange","Mango"]
    let imgs = ["01.jpg", "41aFOL5fe8L.jpg", "00.jpg", "07.jpg"]
    let names = ["あやこ", "ななこ", "さちこ", "ともこ"]
    let texts = ["私の今日のコーデ♪", "しまむらで安く買いました！", "これからデート！", "きれいめコーデで決めてみました"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = tableView.dequeueReusableCellWithIdentifier("tablecell") as UITableViewCell
        
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = "\(names[indexPath.row])"
        
        let img = UIImage(named:"\(imgs[indexPath.row])")
        let imageView = cell.viewWithTag(2) as! UIImageView
        imageView.image = img
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let msg = cell.viewWithTag(3) as! UITextField
        msg.text = "\(texts[indexPath.row])"
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

