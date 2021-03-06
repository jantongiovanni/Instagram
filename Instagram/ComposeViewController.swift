//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Joe Antongiovanni on 2/23/18.
//  Copyright © 2018 Joseph Antongiovanni. All rights reserved.
//

import UIKit
import Parse
import Toucan

class ComposeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    //var posts : [PFObject] = []
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var captionText: UITextField!
    let vc = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        //let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        let resizedImage = Toucan.Resize.resizeImage(originalImage, size: CGSize(width: 414, height: 414))
        imageView.image = resizedImage
        imageView.contentMode = .scaleAspectFit
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("tap")
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onCancel(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "cancelSegue", sender: nil)
    }
    @IBAction func onShare(_ sender: AnyObject) {
        Post.postUserImage(image: imageView.image, withCaption: captionText.text){(success, error) in
            if success{
                print("post successful")
                self.performSegue(withIdentifier: "shareSegue", sender: nil)

            }
            else if let e = error as NSError?{
                print (e.localizedDescription)
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
