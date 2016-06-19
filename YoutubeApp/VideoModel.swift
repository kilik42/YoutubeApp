//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by marvin evins on 6/15/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit
import Alamofire

protocol VideoModelDelegate {
    func dataReady()
    
}

class VideoModel: NSObject {
    
    let API_KEY = "PLtV_YWkcJzbw33PqF_brmEYWAIxtT71Rm"
    let UPLOADS_PLAYLIST_ID = "AIzaSyCH74-OpWIK4e2jn_xENYVnnwpaWvPhwWk"
    var videoArray = [Video]()
    
    var delegate:VideoModelDelegate?
    
    func getFeedVideos(){
        //fetch the videos dynamically through the youtube
        
        
        
        Alamofire.request(.GET, "https://www.googleapis.com/youtube/v3/playlists", parameters: [ "part": "snippet","playlistId": UPLOADS_PLAYLIST_ID,"key": API_KEY], encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
                
                var arrayOfVideos = [Video]()
               
                if let items = JSON["items"] as? NSArray {
                    for video in items {
                        print(video)
                        
                        let videoObj = Video()
                        videoObj.videoId = video.valueForKeyPath("snippet.resourceId.videoId") as! String
                        videoObj.videoTitle = video.valueForKeyPath("snippet.title") as! String
                        videoObj.videoDescription = video.valueForKeyPath("snippet.description") as! String
                        videoObj.videoThumbnailUrl = video.valueForKeyPath("snippet.thumbnails.maxres.url") as! String
                        
                        arrayOfVideos.append(videoObj)
                        
                    }
                    
                    //when all the video objects have been constructed, assign the array to the VideoModel property
                    
                    self.videoArray = arrayOfVideos
                    
                    //notify the delegate that the data is ready
                    
                    if self.delegate != nil {
                        
                        self.delegate!.dataReady()
                    }
                 }
               
            }
            
        }
    }
    
    
    //hardcoded data not really needed now since I am doing it dynamically up above.
    
    func getVideos() ->[Video] {
        
        
        
        // create an empty array of video objects
        var videos = [Video]()
        
         // create a video object
        let  video1 = Video()
  
        //assign properties
        
        video1.videoId = "V1ea1TSUOlc"
        video1.videoTitle = "WARCRAFT - Double Toasted Review "
        video1.videoDescription = "Check out the Double Toasted Movie Review for Warcraft! Azeroth stands on the brink of war as its civilization faces a fearsome race of invaders: orc warriors fleeing their dying home to colonize another."

        //append it into the videos array
        
         videos.append(video1)
        
    
        //second video object
        
        
        // create a video object
        let  video2 = Video()
        
        //assign properties
        
        video2.videoId = "-9EcBTxAW38"
        video2.videoTitle = "X-MEN APOCALYPSE - Double Toasted Review"
        video2.videoDescription = "X-Men Apocalypse has finally seen the light of day, or maybe it hasn't! Because although it stars Michael Fassbender, James McAvoy, and Jennifer Lawrence, and has the return of Hugh Jackman as Wolverine, the DT crew once again keep it 100% unbiased and review this movie for it's quality. Will that become a detriment to this film? Find out!."
        
        //append it into the videos array
        
        videos.append(video2)
        
        
        
        
        
        //third video object
        // create a video object
        let  video3 = Video()
        
        //assign properties
        
        video3.videoId = "gy7tipWusyY"
        video3.videoTitle = "CAPTAIN AMERICA CIVIL WAR - Double Toasted Review"
        video3.videoDescription = "Starring Chris Evans, Robert Downey Jr, Scarlett Johansson, and many, many more - Captain America Civil War is a movie that people have been anticipating for quite some time. With characters such as Iron Man, Captain America, Spiderman, Black Panther, The Falcon, and so much more, it's impossible not to get excited for this movie. The Double Toasted crew attempt to contain themselves for this review of Marvel's newest box office monster."
        
        //append it into the videos array
        
        videos.append(video3)
        
        
        
        
        
        //fourth video object
        
        // create a video object
        let  video4 = Video()
        
        //assign properties
        
        video4.videoId = "SYRaR2qR00s"
        video4.videoTitle = "BATMAN V SUPERMAN SPOILER TALK - Double Toasted Highlight"
        video4.videoDescription = "The Batman V Superman Dawn of Justice Talk has still not come to an end, and the people that have yet to see the movie are wondering just why exactly does it suck so badly in some people's opinion? Well now, you can find that out as the DT crew digs deep into the movie with their Batman v Superman Spoiler Discussion!"
        
        //append it into the videos array
        
        videos.append(video4)
        
        
        
        //fifth video
        
        // create a video object
        let  video5 = Video()
        
        //assign properties
        
        video5.videoId = "xlmdlnMl-TU"
        video5.videoTitle = "DEADPOOL - Double Toasted Review"
        video5.videoDescription = "Deadpool is finally here! Ryan Reynolds stars in this new comic book movie and Korey and the Gang review it fairly and decisively. Was this overhyped? Or does it kick as much ass as we all thought it would?"
        
        //append it into the videos array
        
        videos.append(video5)
        
        
        //return the array to the caller
        return  videos
    }

}
