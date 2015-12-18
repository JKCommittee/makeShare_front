//
//  RelationCell.swift
//  makeShare
//
//  Created by lab on 2015/12/17.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class RelationCell: UITableViewCell {
    
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var intro: UITextView!
    @IBOutlet weak var img: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(user: UserData) {
        screenName.text = user.screenName
        userName.text = user.userName
        intro.text = user.introduction
        intro.editable = false
        img.image = UIImage(data: user.profileImage)
    }
    
}
