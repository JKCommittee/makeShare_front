//
//  DetailViewController.swift
//  makeShare
//
//  Created by 稿作 on 2015/11/27.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Text: UILabel!
    @IBOutlet weak var msg: UITextView!
    
    var selectedImg: UIImage!
    var selectedUserName: String!
    var selectedMsg: String!
    var selectedId: Int!
    var selectedUserId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        ImageView.contentMode = UIViewContentMode.ScaleAspectFit
        Text.text = selectedUserName
        msg.text = selectedMsg
    }
    
//    @IBAction func pushGood(sender: UIBarButtonItem) {
//        pushResponce.text = "いいねを押しました";
//    }
    
//    @IBAction func pushRequest(sender: UIBarButtonItem) {
//        pushResponce.text = "リクエストを押しました";
//        
//        //performSegueWithIdentifier("request", sender: self)
//
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toRequestViewController"){
            let requestVC: RequestViewController = (segue.destinationViewController as! RequestViewController)
            requestVC.selectedId = selectedId
            requestVC.selectedUserId = selectedUserId
        }
    }
}
