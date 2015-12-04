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
    
    @IBOutlet weak var Text: UITextView!
    
    @IBOutlet weak var goodButton: UIToolbar!
   
    @IBOutlet weak var requestButton: UIBarButtonItem!
    
    @IBOutlet weak var pushResponce: UITextField!
    
    let test = "hogehoge"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let detailImage = UIImage(named:"00.jpg");
        ImageView.image = detailImage;
        Text.text = "ねじってまとめる、ただそれだけ";
    }
    
    @IBAction func pushGood(sender: UIBarButtonItem) {
        pushResponce.text = "いいねを押しました";
    }
    
    @IBAction func pushRequest(sender: UIBarButtonItem) {
        pushResponce.text = "リクエストを押しました";
        
        //performSegueWithIdentifier("request", sender: self)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "toRequestViewController"){
            //let requestVC: RequestViewController = (segue.destinationViewController as! RequestViewController)
            //requestViewController.Text.text = "遷移できました"
            //requestVC.test = test
            
        }
    }
}
