//
//  ViewController.swift
//  makeShare
//
//  Created by Masahiko Hyodo on 2015/11/02.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    //var timeline:[TimeLine] = [TimeLine]()

    @IBOutlet weak var tableview: UITableView!
    
    //let fruitsList:[String] = ["Apple","Orange","Mango"]
    
    let names = ["あやこ", "ななこ", "さちこ", "ともこ"]
    let texts = ["私の今日のコーデ♪", "しまむらで安く買いました！", "これからデート！", "きれいめコーデで決めてみました"]
    let imgs = ["01.jpg", "41aFOL5fe8L.jpg", "00.jpg", "07.jpg"]
    
    var selectedImage: UIImage?
    var selectedUserName: String?
    var selectedMsg: String?
    var selectedId: Int?
    var selectedUserId: Int?
    
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
        print(indexPath.row)
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedImage = UIImage(data:postList[indexPath.row].image[0])
        selectedUserName = postList[indexPath.row].screenName
        selectedMsg = postList[indexPath.row].content
        selectedId = postList[indexPath.row].id
        selectedUserId = postList[indexPath.row].userId
        if selectedImage != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("toDetailViewController",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toDetailViewController") {
            let detailVC: DetailViewController = (segue.destinationViewController as? DetailViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            detailVC.selectedImg = selectedImage
            detailVC.selectedUserName = selectedUserName
            detailVC.selectedMsg = selectedMsg
            detailVC.id = selectedId
            detailVC.userId = selectedUserId
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

