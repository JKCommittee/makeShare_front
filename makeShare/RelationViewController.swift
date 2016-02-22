//
//  RelationController.swift
//  makeShare
//
//  Created by lab on 2015/12/17.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class RelationViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
 
    @IBOutlet weak var tableview: UITableView!
    var userList:[UserData] = [UserData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("\(userList[0])")
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(userList.count)
        return userList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: RelationCell = tableView.dequeueReusableCellWithIdentifier("tablecell", forIndexPath: indexPath) as! RelationCell
        cell.setCell(userList[indexPath.row])
        
        return cell
    }
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
    }
    
}
