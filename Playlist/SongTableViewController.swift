//
//  SongTableViewController.swift
//  Playlist
//
//  Created by Chandi Abey  on 12/27/16.
//  Copyright © 2016 Chandi Abey . All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

   
    //MARK:- Properties
    
    //we do this so we can pass that specific playlist to this variable
    var playlist: Playlist?
    
    @IBOutlet weak var songNameTextField: UITextField!
    @IBOutlet weak var songArtistTextField: UITextField!
    @IBOutlet weak var addButtonTapped: UIBarButtonItem!
    
    

    @IBAction func addButtonTapped(_ sender: AnyObject) {
        guard let playlist = playlist,
            let songTitle = songNameTextField.text,
            let artist = songArtistTextField.text,
            songTitle.characters.count > 0 && artist.characters.count > 0
            else { return }
        SongController.sharedController.createSong(name: songTitle, artist: artist, playlist: playlist)
        songNameTextField.text = ""
        songArtistTextField.text = ""
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source


 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //where are the songs? in the playlist, so create a variable for that.
        if let count = playlist?.songs.count {
            return count
        }
        else  {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath as IndexPath)
        // Configure the cell...
        let song = playlist?.songs[indexPath.row]
        cell.textLabel?.text = song?.name
        cell.detailTextLabel?.text = song?.artist
        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if let playlist = playlist {
                let song = playlist.songs[indexPath.row]
                SongController.sharedController.deleteSongFromPlayList(song: song, playlist: self.playlist!)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }

    }
    

}
