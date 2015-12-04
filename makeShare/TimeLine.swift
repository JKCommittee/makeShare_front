//
//  TimeLine.swift
//  makeShare
//
//  Created by Masahiko Hyodo on 2015/12/04.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import Foundation

class TimeLine : NSObject {
    var name:NSString
    var image:NSString
    var msg:NSString
    
    init(name: String, image: NSString, msg: NSString){
        self.name = name
        self.image = image
        self.msg = msg
    }
}