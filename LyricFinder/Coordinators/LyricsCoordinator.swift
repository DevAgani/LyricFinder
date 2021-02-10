//
//  LyricsCoordinator.swift
//  LyricFinder
//
//  Created by George Nyakundi on 10/02/2021.
//

import UIKit

class LyricsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var controller: LyricsViewController
    
    func start() {
        navigationController.pushViewController(controller, animated: true)
    }
    
    func stop() {
        navigationController.popViewController(animated: true)
    }
    
    
    init(navigationController: UINavigationController, song: Song) {
        self.navigationController = navigationController
        
        let storyBoard =  UIStoryboard(name: "Main", bundle: Bundle.main)

        controller = storyBoard.instantiateViewController(identifier: "LyricsViewController") as! LyricsViewController
        controller.song = song
    }
    
    
    
}
