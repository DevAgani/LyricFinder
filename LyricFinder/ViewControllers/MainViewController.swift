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

    @IBOutlet weak var artistNameTxtField: UITextViewRoundedBorder!{
        didSet {
            self.artistName = artistNameTxtField.text ?? ""
        }
    }
    
    @IBOutlet weak var songTitleTxtField: UITextViewRoundedBorder!{
        didSet {
            self.songTitle = songTitleTxtField.text ?? ""
        }
    }
    
    @IBOutlet weak var findSongBtn: ButtonWithRadius!
    
    // MARK: Local Variables
    var artistName = ""
    var songTitle = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLeftPadding()
        
        songTitleTxtField.delegate = self
        
        artistNameTxtField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        findSongBtn.isEnabled = false
        
        setupToolBar()
        
    }
    
    func setupToolBar(){
        let toolBarDone = UIToolbar.init()
        
        toolBarDone.sizeToFit()
        
        toolBarDone.barTintColor = UIColor.black
        
        toolBarDone.isTranslucent = false
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        
        let barButtonDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        
        
        barButtonDone.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        
        toolBarDone.items = [flexSpace,barButtonDone,flexSpace]
        
        songTitleTxtField.inputAccessoryView = toolBarDone
        
        artistNameTxtField.inputAccessoryView = toolBarDone
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
        coordinator?.findLyrics(artistName: self.artistName, songTitle:self.songTitle)
        findSongBtn.isLoading(false,title: "Find Lyrics")
    }
    
    @objc func doneButtonTapped() {
        view.endEditing(true)
    }
    
    func toggleButton() {
        findSongBtn.isEnabled = !songTitle.isEmpty && !artistName.isEmpty
    }
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -(view.frame.height / 2) + 200 // Move view 150 points upward
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0 // Move view to original position
    }
}

extension MainViewController: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == artistNameTxtField {
            if let value = textField.text  {
                self.artistName = value
                self.toggleButton()
            }
        } else if textField == songTitleTxtField {
            if let value = textField.text  {
                self.songTitle = value
                self.toggleButton()
            }
        }
    }
}

