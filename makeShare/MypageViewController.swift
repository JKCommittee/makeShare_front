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
    @IBOutlet weak var follow: UIButton!
    @IBOutlet weak var follower: UIButton!

    @IBOutlet weak var profileText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            let json = try! NSData(contentsOfURL: NSURL(string: url + "user_request.php?func=user&id=1")!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let data = try! NSJSONSerialization.JSONObjectWithData(json, options: []) as! NSDictionary
            profile = UserData(data: data, url: self.url)
            profile!.setRelation(data, url: self.url)
            //print("\((profile?.follows)![0].id)");
        }
        userName.text = (profile?.screenName)! as String
        userImage.image = UIImage(data: (profile?.profileImage)!)
        userImage.contentMode = UIViewContentMode.ScaleAspectFit
        follow.setTitle(String((profile?.follow)!), forState: .Normal)
        follower.setTitle(String((profile?.follower)!), forState: .Normal)
        profileText.text = (profile?.introduction)! as String
        profileText.editable = false
        
    }
    
    @IBAction func FollowerButton(sender: AnyObject) {
        performSegueWithIdentifier("follower", sender: nil)
    }
    
    @IBAction func FollowButton(sender: AnyObject) {
        performSegueWithIdentifier("follow", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let relation: RelationViewController = (segue.destinationViewController as? RelationViewController)!
        var users: [UserData] = [UserData]()
        if (segue.identifier == "follow"){
            users = (profile?.follows)!
        } else if (segue.identifier == "follower") {
            users = (profile?.followers)!
        }
        relation.userList = users
    }
    
}
