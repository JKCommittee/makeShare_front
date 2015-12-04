//
//  TimeLineCell.swift
//  makeShare
//
//  Created by Masahiko Hyodo on 2015/12/04.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class TimeLineCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var msg: UITextView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCell(timeline :TimeLine) {
        self.name.text = timeline.name as String
        //var err: NSError?
        //var imageData :NSData = NSData(contentsOfURL: timeline.image,options: NSDataReadingOptions.DataReadingMappedIfSafe, error: &err)!
        self.ImageView.image = UIImage(named:timeline.image as String)
        self.msg.text = timeline.msg as String
    }

}
