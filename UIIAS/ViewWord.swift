//
//  ViewWord.swift
//  UIIAS
//
//  Created by Devon Law on 2019-07-05.
//  Copyright © 2019 Slackers. All rights reserved.
//

import Foundation
import UIKit

class ViewWord: UIViewController {
    
    var textToChange = String()
    var lineNumber = 0
    var array: [String] = []
    var fileName = String()
    var canTap = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeText()
        array = findLines()
        setContent(array: array)
    }
    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func nextWord(_ sender: Any) {
        if(canTap){
            lineNumber += 1
            setContent(array: array)
        }
    }
    func changeText() {
        labelText.text = textToChange
        switch textToChange {
        case "Button1":
            fileName = "category1"
        case "Button2":
            fileName = "category2"
        default:
            fileName = "error"
        }
    }
    
    func findLines() -> Array<String> {
        var arrayOfStrings: [String] = []
        do {
            let path = Bundle.main.path(forResource: fileName, ofType: "txt")
              let data = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                arrayOfStrings = data.components(separatedBy: "\n")
        } catch let error as NSError {
            print(error)
        }
        return arrayOfStrings
    }
    
    func setContent(array: Array<String>) {
        if(array[lineNumber] != ""){
            textView.text = array[lineNumber]
        } else {
            textView.text = "No more words in this category, please select another."
            canTap = false
        }
    }
}
