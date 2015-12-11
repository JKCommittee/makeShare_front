//
//  PostViewController.swift
//  makeShare
//
//  Created by lab on 2015/11/27.
//  Copyright © 2015年 JKCommittee. All rights reserved.
//

import UIKit

class PostViewController: UIViewController,  ELCImagePickerControllerDelegate {
    
    let pickedImages = NSMutableArray()
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pickerButton(sender: AnyObject) {
        self.pickImages()
    }
    
    @IBAction func postButton(sender: AnyObject) {
        let path = "/makeShare/post_request.php"
        let str = textField.text!
        let image = pickedImages[0] as! UIImage
        print(image.size)
        let params = ["content": str, "user_id": 1, "func": "post", "file": NetData(jpegImage: image, compressionQuanlity: 1, filename: "file")]
        
        let net = Net(baseUrlString: "http://175.184.17.224")
        net.POST(path, params: params,
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
    
    func pickImages() {
        let picker = ELCImagePickerController(imagePicker: ())
        picker.maximumImagesCount = 5
        //picker.mediaTypes = @[kUTTypeImage, kUTTypeMovie]
        picker.imagePickerDelegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    func elcImagePickerController(picker: ELCImagePickerController, didFinishPickingMediaWithInfo info: [AnyObject]!) {
        self.dismissViewControllerAnimated(true, completion: nil)
        if (info.count == 0) {
            return
        }
        
        for any in info {
            let dict = any as! NSMutableDictionary
            let image = dict.objectForKey(UIImagePickerControllerOriginalImage) as! UIImage
            pickedImages.addObject(image)
        }
        
    }
    
    func elcImagePickerControllerDidCancel(picker: ELCImagePickerController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}