//
//  ViewController.swift
//  xib-in-xib-workspace
//
//  Created by Daniel Sutcliffe on 29/09/2022.
//

import UIKit

import VC1
import VC2

class ViewController: UIViewController {

    @IBOutlet weak var vc1Button: UIButton!
    @IBOutlet weak var vc2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        vc1Button.setTitle("Goto VC1", for: .normal)
        vc2Button.setTitle("Goto VC2", for: .normal)
    }

    @IBAction func vc1ButtonPressed(_ sender: UIButton) {
        VC1Coordinator(presenter: self).start()
    }
    
    @IBAction func vc2ButtonPressed(_ sender: UIButton) {
        VC2Coordinator(presenter: self).start()
    }
}

