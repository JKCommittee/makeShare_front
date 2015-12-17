//
//  UserData.swift
//  makeShare
//
//  Created by lab on 2015/12/12.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import Foundation

class UserData {
    
    let informat = NSDateFormatter()
    let id: Int
    let userName: String
    let screenName: String
    var profileImage: NSData
    let birthDay: NSDate
    let adress: String
    let introduction: String
    let twitterId: Int
    let follow: Int
    let follower: Int
    var follows: [UserData] = [UserData]()
    var followers: [UserData] = [UserData]()
    
    init(data: NSDictionary, url: String) {
        informat.dateFormat = "yyy-MM-dd"
        id = Int(data["id"] as! String)!
        userName = data["user_name"] as! String
        screenName = data["screen_name"] as! String
        do {
            let img = try NSData(contentsOfURL: NSURL(string: url + (data["profile_image"] as! String))!,options: NSDataReadingOptions.DataReadingMappedIfSafe)
            profileImage = img
        } catch {
            profileImage = NSData()
        }
        birthDay = informat.dateFromString(data["birth_day"] as! String)!
        adress = data["adress"] as! String
        introduction = data["introduction"] as! String
        twitterId = Int(data["twitter_id"] as! String)!
        follow = Int(data["follow"] as! String)!
        follower = Int(data["follower"] as! String)!
    }
    
    func getRelation(data: NSDictionary, url: String) {
        for  user in data["follows"] as! NSArray {
            follows.append(UserData(data: user as! NSDictionary, url: url))
        }
        for  user in data["followers"] as! NSArray {
            followers.append(UserData(data: user as! NSDictionary, url: url))
        }
    }
}