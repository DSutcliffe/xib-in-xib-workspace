//
//  VC2Coordinator.swift
//  VC2
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import UIKit

import Core

public class VC2Coordinator: Coordinator {
    var presenter: UIViewController
    let viewController: VC2ViewController
    let viewModel = VC2ViewModel()
    
    public init(presenter: UIViewController) {
        self.presenter = presenter
        viewController = VC2ViewController(viewModel: viewModel)
    }
    
    public func start() {
        viewModel.delegate = self
        
        viewController.modalPresentationStyle = .fullScreen
        presenter.present(viewController, animated: true, completion: nil)
    }
}

extension VC2Coordinator: VC2ViewModelDelegate {
    func dismiss() {
        presenter.dismiss(animated: true, completion: nil)
    }
}
