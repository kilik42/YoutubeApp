//
//  VideoDetailViewController.swift
//  YoutubeApp
//
//  Created by marvin evins on 6/16/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var webViewHeightConstraint: NSLayoutConstraint!
    var selectedVideo: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
    
        if let  vid = self.selectedVideo {
            self.titleLabel.text = vid.videoTitle
            self.descriptionLabel.text = vid.videoDescription
            
            let width = self.view.frame.size.width
            let height = width/320 * 180
            
            //adjust the height of the webview constraint
          //self.webViewHeightConstraint.constant = height
            
            
            let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(height) + "\" width=\"" + String(width) + "\" src=\"http://www.youtube.com/embed/" + vid.videoId + "?showinfo=0&modestbranding=1&frameborder=0&rel=0\"></iframe></body></html>"
            
            self.webView.loadHTMLString(videoEmbedString, baseURL: nil)
        }
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
