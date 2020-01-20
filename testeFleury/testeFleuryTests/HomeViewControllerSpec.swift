//
//  HomeViewControllerSpec.swift
//  testeFleuryTests
//
//  Created by Tatiana Rico on 19/01/20.
//  Copyright © 2020 Tatiana Rico. All rights reserved.
//

import UIKit
import Quick
import Nimble
import Nimble_Snapshots

@testable import testeFleury

class HomeViewControllerSpec: QuickSpec {
    
    override func spec() {
        
        describe("View Controller Layout"){
            
            var sut: HomeViewController!
            
            context("When instanciate the View Controller the Layout"){
                
                beforeEach {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    sut = storyboard.instantiateViewController(identifier: "HomeViewController")
                }
                
                it("espero que o layout seja"){
                    expect(sut).toEventually(haveValidSnapshot())
                }

                beforeEach {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    sut = storyboard.instantiateViewController(identifier: "HomeViewController")
                    WindowHelper.showInTestWindow(viewController: sut)
                }
                
                it("espero que o layout da tableView seja"){
                    expect(sut.examesTableVIew).toEventually(haveValidSnapshot())
                }
            }
        }
    }
}
