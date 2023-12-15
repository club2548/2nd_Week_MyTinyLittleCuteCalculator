//
//  ViewController.swift
//  SimpleCounterApp
//
//  Created by t2023-m0026 on 12/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var number: Int = 0
    
    @IBAction func downButton(_ sender: UIButton) {
        number -= 1
        refreshDisplay()
    }
    
    @IBAction func upButton(_ sender: UIButton) {
        number += 1
        refreshDisplay()
    }
    
    func refreshDisplay() {
        display.text = String(number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
