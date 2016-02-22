//
//  RequestViewController.swift
//  makeShare
//
//  Created by lab on 2015/12/18.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController {
    
    var postId: Int!
    var senderId: Int!
    var receiveId: Int!
    
    @IBOutlet weak var text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func requestButton(sender: AnyObject) {
        let str = text.text!
        let params = ["func": "request", "post_id": postId, "send_user": senderId, "receive_user": receiveId, "comment": str]
        let net = Net(baseUrlString: "http://175.184.17.224/makeShare/")
        net.POST("request_request.php", params: params,
            successHandler: { responseData in
                do {
                    let result = try responseData.json()
                    NSLog("result: \(result)")
                } catch {
                    NSLog("Exception!")
                }
            },
            failureHandler: { error in
                NSLog("Error")
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
