//
//  FeedViewController.swift
//  Instagram
//
//  Created by Joseph Antongiovanni on 2/21/18.
//  Copyright © 2018 Joseph Antongiovanni. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDataSource {
    
    var posts : [Post] = []

    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        fetchPosts()
        self.tableView.reloadData()
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
    
    @IBAction func onCompose(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "composeSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        //let post = posts[indexPath.row]
        
        //let caption = post.caption
        //cell.postCaption.text = caption
        
        
        
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // construct PFQuery
    func fetchPosts(){
    let query = Post.query()
    query?.order(byDescending: "createdAt")
    query?.includeKey("author")
    query?.limit = 20
    
    // fetch data asynchronously
        query?.findObjectsInBackground { (Post, error: Error?) -> Void in
    if let posts = Post {
        self.posts = posts as! [Post]
        self.tableView.reloadData()
    } else {
        print("fetch failed")
    }
    }
    }
}
