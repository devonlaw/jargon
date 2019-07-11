//
//  WordView.swift
//  jargon-rewrite
//
//  Created by Devon Law on 2019-07-08.
//  Copyright © 2019 Slackers. All rights reserved.
//

import Foundation
import UIKit

class WordView: UIViewController {
    var jargon = String()
    var fileName = String()
    var lineNumber = 1
    var canTap = true
    var canTapBack = true
    var isCustom = false
    var array: [String] = []
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var wordDesc: UITextView!
    @IBOutlet weak var edit: UIButton!
    @IBAction func previous(_ sender: Any) {
        if (canTapBack) {
            lineNumber -= 1
            setContent(array: array)
        }
    }
    @IBOutlet weak var wordLabel: UILabel!
    @IBAction func next(_ sender: Any) {
        if (canTap){
            lineNumber += 1
            setContent(array: array)
        }
    }
    
    @IBAction func editTapped(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if jargon != "" {
            word.text = jargon
        } else {
            jargon = "noinput"
            word.text = "no input"
        }
        if fileExists(name: jargon) == true {
            fileName = jargon
        } else {
            fileName = "error"
        }
        array = findLines()
        setContent(array: array)
        if isCustom == false {
            edit.isHidden = true
        } else {
            edit.isHidden = false
        }
    }
    
    func findLines() -> Array<String> {
        var arrayOfStrings: [String] = []
        do {
            let path = Bundle.main.path(forResource: fileName, ofType: "txt")
            if path != nil {
                let data = try String(contentsOfFile: path!, encoding: String.Encoding.utf8)
                arrayOfStrings = data.components(separatedBy: "\n")
            } else {
                let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("txt")
                let data = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
                arrayOfStrings = data.components(separatedBy: "\n")
            }
        } catch let error as NSError {
            print(error)
        }
        return arrayOfStrings
    }
    
    func setContent(array: Array<String>) {
        var word = String()
        var definition = String()
        if(array[lineNumber] != "" && array[lineNumber] != " "){
            word = String(array[lineNumber].prefix(upTo: array[lineNumber].firstIndex(of: ":")!))
            definition = String(array[lineNumber].suffix(from: array[lineNumber].firstIndex(of: " ")!))
            wordDesc.text = definition
            wordLabel.text = word
            canTapBack = true
            canTap = true
            if isCustom == true {
                edit.isHidden = false
            }
        } else {
            wordLabel.text = ""
            if lineNumber == 0 {
                wordDesc.text = "Can't go back any further."
                canTapBack = false
                edit.isHidden = true
            } else {
                wordDesc.text = "No more words in this category, please select another."
                canTap = false
                edit.isHidden = true
            }
        }
    }
    
    func fileExists(name: String) -> Bool {
        fileName = "allTextFiles"
        for line in findLines() {
            if line == name {
                return true
            }
        }
        
        fileName = "customLists"
        for line in findLines() {
            if line == name {
                return true
            }
        }
        return false
    }
}
