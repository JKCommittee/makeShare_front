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
    
    var postData: PostData!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageView.image = UIImage(data: postData.image[0])
        // 画像のアスペクト比を維持しUIImageViewサイズに収まるように表示
        ImageView.contentMode = UIViewContentMode.ScaleAspectFit
        //ImageView.image = detailImage;
        Text.text = postData.screenName
        msg.text = postData.content
    }
    
    @IBAction func request(sender: AnyObject) {
        performSegueWithIdentifier("request", sender: nil)
    }
    
    @IBAction func like(sender: AnyObject) {
        let params = ["func": "like", "id": postData.id]
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
            let requestVC: RequestViewController = (segue.destinationViewController as! RequestViewController)
            requestVC.senderId = 1
            requestVC.receiveId = postData.userId
            requestVC.postId = postData.id
        }
    }
}
