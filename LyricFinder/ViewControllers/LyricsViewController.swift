//
//  LyricsViewController.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class LyricsViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?

    @IBOutlet weak var songTitleLbl: UILabel!
    
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var lyricsTextView: UITextView!
    
    @IBOutlet weak var goBackButton: RoundedButton!
    
    var song: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let song = song {
            populateTextView(with: song)
        }
    }
    
    private final func populateTextView(with song: Song) {
        lyricsTextView.text = song.lyrics
        artistLabel.text = "Artist: \(song.artist)".capitalized
        songTitleLbl.text = "Song: \(song.name)".capitalized
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
