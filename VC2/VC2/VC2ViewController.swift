//
//  VC2ViewController.swift
//  VC2
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import UIKit

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
        
        sampleTableView.register(UINib(nibName: TestATableViewCell.reuseIdentifier, bundle: Bundle.init(for: Self.self)), forCellReuseIdentifier: TestATableViewCell.reuseIdentifier)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        viewModel.dismiss()
    }
    
}

extension VC2ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = sampleTableView.dequeueReusableCell(withIdentifier: TestATableViewCell.reuseIdentifier, for: indexPath) as? TestATableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}
