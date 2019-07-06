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

    @IBOutlet weak var searchBar: UITextField!
    
    @IBAction func go(_ sender: Any) {
        switch searchBar.text {
        case "Button1":
            category = "Button1"
        case "Button2":
            category = "Button2"
        case "Button3":
            category = "Button3"
        case "Button4":
            category = "Button4"
        case "Button5":
            category = "Button5"
        case "Button6":
            category = "Button6"
        default:
            category = searchBar.text!
        }
        searchBar.text?.removeAll()
        //test to make sure this is being saved properly
        print(category)
    }
    
    @IBAction func Button1(_ sender: Any) {
        category = "Button1"
    }
    
    @IBAction func Button2(_ sender: Any) {
        category = "Button2"
    }
    @IBAction func Button3(_ sender: Any) {
        category = "Button3"
    }
    @IBAction func Button4(_ sender: Any) {
        category = "Button4"
    }
    @IBAction func Button5(_ sender: Any) {
        category = "Button5"
    }
    @IBAction func Button6(_ sender: Any) {
        category = "Button6"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController: ViewWord = segue.destination as! ViewWord
        destViewController.textToChange = category
    }
    
}

