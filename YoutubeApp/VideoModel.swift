//
//  VideoModel.swift
//  YoutubeApp
//
//  Created by marvin evins on 6/15/16.
//  Copyright © 2016 marvin evins. All rights reserved.
//

import UIKit

class VideoModel: NSObject {
    
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
