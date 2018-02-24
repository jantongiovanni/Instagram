//
//  ComposeViewController.swift
//  Instagram
//
//  Created by Joe Antongiovanni on 2/23/18.
//  Copyright © 2018 Joseph Antongiovanni. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "cancelSegue", sender: nil)
    }
    @IBAction func onShare(_ sender: AnyObject) {
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
