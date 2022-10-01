//
//  VC2ViewController.swift
//  VC2
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import UIKit

import Components

class VC2ViewController: UIViewController {
    let viewModel: VC2ViewModel
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sampleTableView: UITableView!
    
    init(viewModel: VC2ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        setupTableView()
    }
    
    func configureUI() {
        view.backgroundColor = .blue
        backButton.setTitle(viewModel.backButtonTitle, for: .normal)
    }
    
    func setupTableView() {
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        
        // In Current Framework
        sampleTableView.register(UINib(nibName: TestATableViewCell.reuseIdentifier,
                                       bundle: Bundle.init(for: Self.self)), forCellReuseIdentifier: TestATableViewCell.reuseIdentifier)
        
        // In Seperate Framework
        sampleTableView.register(UINib(nibName: ComponentTestTableViewCell.reuseIdentifier, bundle: Bundle(identifier: "com.jaydan.Components")), forCellReuseIdentifier: ComponentTestTableViewCell.reuseIdentifier)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        viewModel.dismiss()
    }
    
}

extension VC2ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = sampleTableView.dequeueReusableCell(withIdentifier: TestATableViewCell.reuseIdentifier, for: indexPath) as? TestATableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell = sampleTableView.dequeueReusableCell(withIdentifier: ComponentTestTableViewCell.reuseIdentifier, for: indexPath) as? ComponentTestTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
