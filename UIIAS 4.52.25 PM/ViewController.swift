//
//  ViewController.swift
//  UIIAS
//
//  Created by Devon Law on 2019-07-05.
//  Copyright © 2019 Slackers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var category = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Button1(_ sender: Any) {
        category = "Button1"
    }
    
    @IBAction func Button2(_ sender: Any) {
        category = "Button2"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: ViewWord = segue.destination as! ViewWord
        destViewController.textToChange = category
    }
    
}

