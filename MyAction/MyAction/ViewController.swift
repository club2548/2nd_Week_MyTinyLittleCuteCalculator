//
//  ViewController.swift
//  MyAction
//
//  Created by t2023-m0026 on 11/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MyLabel: UILabel!
    @IBOutlet weak var MyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func didTapMyButton(_ sender: Any) {
        print("배경 색상을 노란색으로 바꿀게요!")
        MyLabel.text = "Hello, Lee"
    }
    
}
    




