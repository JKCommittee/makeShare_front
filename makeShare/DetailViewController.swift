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
    
    let test = "hogehoge"
    var selectedImg: UIImage!
    var selectedUserName: String!
    var selectedMsg: String!
    var id: Int!
    var userId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image = selectedImg
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        ImageView.contentMode = UIViewContentMode.ScaleAspectFit
        //ImageView.image = detailImage;
        Text.text = selectedUserName
        msg.text = selectedMsg
    }
    
    @IBAction func request(sender: AnyObject) {
        //performSegueWithIdentifier("request", sender: nil)
    }
    
    @IBAction func like(sender: AnyObject) {
        let params = ["func": "like", "id": id]
        let net = Net(baseUrlString: "http://175.184.17.224/makeShare/")
        net.POST("user_request.php", params: params,
            successHandler: { responseData in
            },
            failureHandler: { error in
                NSLog("Error")
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "request"){
            //let requestVC: RequestViewController = (segue.destinationViewController as! RequestViewController)
            //requestViewController.Text.text = "遷移できました"
            //requestVC.test = test
            
        }
    }
}
