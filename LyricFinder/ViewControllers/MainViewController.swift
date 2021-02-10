//
//  ViewController.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    // MARK: Outlets

    @IBOutlet weak var artistNameTxtField: UITextViewRoundedBorder!
    
    @IBOutlet weak var songTitleTxtField: UITextViewRoundedBorder!
    
    @IBOutlet weak var findSongBtn: ButtonWithRadius!
    
    // MARK: Local Variables
    var artistName = ""
    var songTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLeftPadding()
//        setupToolbar()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
    }
    
    func setupLeftPadding() {
        artistNameTxtField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: artistNameTxtField.frame.height))
        artistNameTxtField.leftViewMode = .always
        
        songTitleTxtField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: songTitleTxtField.frame.height))
        songTitleTxtField.leftViewMode = .always
    }
    
    @IBAction func findLyricBtnClicked(_ sender: Any) {
        findSong()
    }
    func findSong() {
        findSongBtn.isLoading(true)
        coordinator?.findLyrics(artistName: "Celine Dion", songTitle: "My heart will go on")
        findSongBtn.isLoading(false,title: "Find Lyrics")
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -(view.frame.height / 2) + 100 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
    
    
    
}

extension MainViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
//        <#code#>
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
}

