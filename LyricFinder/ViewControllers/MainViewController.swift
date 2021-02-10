//
//  ViewController.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var artistNameTxtField: UITextViewRoundedBorder!
    
    @IBOutlet weak var songTitleTxtField: UITextViewRoundedBorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupLeftPadding()
    }
    
    func setupLeftPadding() {
        artistNameTxtField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: artistNameTxtField.frame.height))
        artistNameTxtField.leftViewMode = .always
        
        songTitleTxtField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: songTitleTxtField.frame.height))
        songTitleTxtField.leftViewMode = .always
    }
    
    


}

