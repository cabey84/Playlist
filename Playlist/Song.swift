//
//  Song.swift
//  Playlist
//
//  Created by Chandi Abey  on 8/17/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import Foundation

//first define class
class Song: Equatable {
    
    //then define properties of that class
    let name: String
    let artist: String

    //a way to make an instance of something 
    //when we call this initializer, we give these values
    init(name: String, artist: String) {
        self.name = name
        self.artist = artist
    }
    

}

//define equatable protocol 
func ==(lhs: Song, rhs: Song) -> Bool {
    return lhs.name == rhs.name &&
        lhs.artist == rhs.artist

}