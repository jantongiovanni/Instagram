//
//  FeedViewController.swift
//  Instagram
//
//  Created by Joseph Antongiovanni on 2/21/18.
//  Copyright © 2018 Joseph Antongiovanni. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogout(_ sender: AnyObject) {
        PFUser.logOutInBackground { (error: Error?) in
            if let error = error {
                print("User logout failed: \(error.localizedDescription)")
            } else {
                print("User logout successful")
            //need to segue back to login screen
                self.performSegue(withIdentifier: "logoutSegue", sender: nil)
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
