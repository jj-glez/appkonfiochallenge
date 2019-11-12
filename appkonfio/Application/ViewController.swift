//
//  ViewController.swift
//  Wallet
//
//  Created by Omar Barrera on 09/10/19.
//  Copyright © 2019 Omar Barrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isActiveSession = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        let wireframe = DogListWireframe()
        navigationController?.pushWireframe(wireframe)
    }
}
