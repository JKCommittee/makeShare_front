//
//  RelationController.swift
//  makeShare
//
//  Created by lab on 2015/12/17.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class RelationController: UIViewController , UITableViewDataSource, UITableViewDelegate {
 
    var userData :[UserData] = [UserData]()
    
    override func viewDidLoad() {
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: RelationCell = tableView.dequeueReusableCellWithIdentifier("Relation Cell", forIndexPath: indexPath) as! RelationCell
        cell.setCell(userData[indexPath.row])
        
        return cell
    }
    
}
