
//
//  PostData.swift
//  makeShare
//
//  Created by lab on 2015/12/07.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import Foundation
import UIKit
class PostData {
    
    let informat = NSDateFormatter()
    let id: Int
    let content: String
    var image: [NSData]
    let postTime: NSDate
    let userId: Int
    var like: Int
    let userName: String
    let screenName: String
    var profileImage: NSData
    
    init(data: NSDictionary, url: String) {
        informat.dateFormat = "yyy/MM/dd HH:mm:ss"
        id = Int(data["id"] as! String)!
        content = data["content"] as! String
        //image = data.valueForKey("url_image")
        image = [NSData]()
        do {
            let json = try! NSJSONSerialization.JSONObjectWithData((data["image_url"] as! String).dataUsingEncoding(NSUTF8StringEncoding)!, options: []) as! [String]
            for i in 0..<json.count {
                let img = try! NSData(contentsOfURL: NSURL(string: url + json[i])!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
                image.append(img)
            }
        }
        postTime = informat.dateFromString(data["post_time"] as! String)!
        userId = Int(data["user_id"] as! String)!
        like = Int(data["liked"] as! String)!
        userName = data["user_name"] as! String
        screenName = data["screen_name"] as! String
        do {
            let img = try NSData(contentsOfURL: NSURL(string: url + (data["profile_image"] as! String))!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            profileImage = img
        } catch {
            profileImage = NSData()
        }
        
    }
}
