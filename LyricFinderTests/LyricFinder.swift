//
//  LyricFinder.swift
//  LyricFinderTests
//
//  Created by George Nyakundi on 10/02/2021.
//

import XCTest
@testable import LyricFinder

class LyricFinder: XCTestCase {

    override func setUpWithError() throws {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testOvhNetworkService() {
        let exp = expectation(description: "Get Lyrics Passing artist name and song title")
        let service = OvhNetworkService()
        
        let artistName = "Celine Dion"
        let songName = "My heart will go on"
        
        service.fetchLyrics(artistName: artistName, songTitle: songName) { (result) in
            switch result {
            case .success(let lyrics):
                print("Song \(lyrics)")
                exp.fulfill()
            case .failure:
                XCTFail("Failed to return lyrics")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    

    

}
