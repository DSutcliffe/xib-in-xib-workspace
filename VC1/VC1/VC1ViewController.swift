//
//  VC1ViewController.swift
//  VC1
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import UIKit

class VC1ViewController: UIViewController {
    let viewModel: VC1ViewModel

    @IBOutlet weak var backButton: UIButton!
    
    init(viewModel: VC1ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .green
        backButton.setTitle(viewModel.backButtonTitle, for: .normal)
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        viewModel.dismiss()
    }
}
