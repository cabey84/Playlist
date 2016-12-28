//
//  Playlist.swift
//  Playlist
//
//  Created by Chandi Abey  on 8/17/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation

class Playlist: Equatable {
    
    
    
    
    //variables for keys to be used in the computed properties and failable initializers below. It does not matter what you put in the string. 
    fileprivate let kName = "nameKey"
    fileprivate let kSongs = "songsKey"
    
    
    
    let name: String
    //declare an array of songs
    var songs: [Song]
    
    
    init(name: String, songs: [Song] = [ ]) {
        self.name = name
        self.songs = songs
        
    }
    

    
}

func ==(lhs: Playlist, rhs: Playlist) -> Bool  {
    return lhs.name == rhs.name && lhs.songs == rhs.songs
}
