//
//  ViewController.swift
//  makeShare
//
//  Created by Masahiko Hyodo on 2015/11/02.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var timeline:[TimeLine] = [TimeLine]()

    @IBOutlet weak var tableview: UITableView!
    
    //let fruitsList:[String] = ["Apple","Orange","Mango"]
    
    let names = ["あやこ", "ななこ", "さちこ", "ともこ"]
    let texts = ["私の今日のコーデ♪", "しまむらで安く買いました！", "これからデート！", "きれいめコーデで決めてみました"]
    let imgs = ["01.jpg", "41aFOL5fe8L.jpg", "00.jpg", "07.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCells()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func setupCells() {
        for(var i = 0; i < names.count; i++) {
            var c = TimeLine(name: names[i], image: imgs[i], msg: texts[i])
            timeline.append(c)
        }
    }

    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return texts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell: TimeLineCell = tableView.dequeueReusableCellWithIdentifier("tablecell", forIndexPath: indexPath) as! TimeLineCell
        cell.setCell(timeline[indexPath.row])
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

