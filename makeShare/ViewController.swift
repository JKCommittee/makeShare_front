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
    
    var selectedPost: PostData?
    
    let url = "http://175.184.17.224/makeShare/"
    var timeline:[TimeLine] = [TimeLine]()
    var postList:[PostData] = [PostData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadPost()
        self.setupCells()
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    func loadPost() {
        postList = [PostData]() // リストのリセット
        do {
            // 全投稿リストの取得
            let json = try! NSData(contentsOfURL: NSURL(string: url + "get_all_post.php")!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let data = try! NSJSONSerialization.JSONObjectWithData(json, options: []) as! NSArray
            //print("\(data)")
            
            for i in 0..<data.count {
                postList.append(PostData(data: data[i] as! NSDictionary, url: url))
            }
        }
    }
    
    func setupCells() {
        for(var i = 0; i < postList.count; i++) {
            let post = postList[i]
            //img = post.image[0]
            timeline.append(TimeLine(name: post.screenName, image: post.image[0], msg: post.content))
        }
    }

    
    // セルの行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell: TimeLineCell = tableView.dequeueReusableCellWithIdentifier("tablecell", forIndexPath: indexPath) as! TimeLineCell
        cell.setCell(timeline[indexPath.row])
        
        return cell
    }
    
//    // Cell が選択された場合
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        // [indexPath.row] から画像名を探し、UImage を設定

        selectedPost = postList[indexPath.row]
        // SubViewController へ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toDetailViewController",sender: nil)
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toDetailViewController") {
            let detailVC: DetailViewController = (segue.destinationViewController as? DetailViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            detailVC.postData = selectedPost
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

