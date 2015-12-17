//
//  MypageViewController.swift
//  makeShare
//
//  Created by 稿作 on 2015/12/11.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {

    let url = "http://175.184.17.224/makeShare/"
    var profile: UserData?
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var follows: UILabel!

    @IBOutlet weak var profileText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let json = try! NSData(contentsOfURL: NSURL(string: url + "get_all_post.php?func=user&id=1")!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let data = try! NSJSONSerialization.JSONObjectWithData(json, options: []) as! NSDictionary
            profile = UserData(data: data, url: self.url)
            self.profile!.getRelation(data, url: self.url)
        }
    }
    
    @IBAction func FollowerButton(sender: AnyObject) {
        performSegueWithIdentifier("follow", sender: nil)
    }
    
    func setData() {
        print((profile?.userName)! as String)
        userName.text = (profile?.userName)! as String
        userImage.image = UIImage(data: (profile?.profileImage)!)
        userImage.contentMode = UIViewContentMode.ScaleAspectFit
        //follows.text = String(profile?.follow)
        //followers.text = String(profile?.follower)
        //profileText.text = profile?.introduction
        //loadView()
        //viewDidLoad()
    }
    
}
