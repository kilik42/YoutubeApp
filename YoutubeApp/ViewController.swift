//
//  ViewController.swift
//  YoutubeApp
//
//  Created by marvin evins on 6/15/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,VideoModelDelegate {

    @IBOutlet var tableView: UITableView!
    
    var videos:[Video] = [Video]()
    
    var selectedVideo: Video?
    
    let model: VideoModel = VideoModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.model.delegate = self
        //self.videos = VideoModel().getVideos()
        
        //fire off reques to get videos
        
        model.getFeedVideos()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
        
    }

    
    //mark - videomodel Delegate methods
    
    func dataReady(){
        //access the video objects that have been downloaded
        self.videos = self.model.videoArray
        
        
        
        // tell table view to reload
        
        self.tableView.reloadData()
        
        
        
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        // get the width of the screen to calculate the height
        return ((self.view.frame.size.width / 320) * 180)
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BasicCell")!
        
        let videoTitle = videos[indexPath.row].videoTitle
        
        
        
        //get the label for the cell
        
        let label = cell.viewWithTag(2) as!UILabel
        label.text = videoTitle
        
        //customize cell to display the video title!
        
        //cell.textLabel?.text = videoTitle
        
        
        //construct video thumbnail url
        let videoThumbnailUrlString = videos[indexPath.row].videoThumbnailUrl
        
        //create a nsurl object
        
        let videoThumbnailUrl = NSURL(string: videoThumbnailUrlString)
       
        
        
        //check for errors
        if videoThumbnailUrl != nil {
            
            
            //create an nsurlrequest object
            let request = NSURLRequest(URL: videoThumbnailUrl!)
            
            //create a nsurl session
            
            let session = NSURLSession.sharedSession()
            
            // create a datatask and pass in the request
            
            let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    //get a reference to the imageview element of the cell
                    
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    
                    
                    //create an image object from the data and assign it into the imageview
                    
                    imageView.image = UIImage(data: data!)
                })
               

            })
            
            dataTask.resume()
            
        }
        
        
        return cell
        
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //take note of which video the user selected
        
        self.selectedVideo = self.videos[indexPath.row]
        
        //call segue
        
        self.performSegueWithIdentifier("goToDetail", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //get a reference to the destination view controller
        let detailViewController = segue.destinationViewController as! VideoDetailViewController
        
        //set the selected video property of the destination view controller
        
        detailViewController.selectedVideo = self.selectedVideo
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

