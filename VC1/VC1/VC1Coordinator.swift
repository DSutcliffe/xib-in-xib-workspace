//
//  VC1Coordinator.swift
//  VC1
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import UIKit

import Core

public class VC1Coordinator: Coordinator {
    public var presenter: UIViewController
    let viewController: VC1ViewController
    let viewModel = VC1ViewModel()
    
    public init(presenter: UIViewController) {
        self.presenter = presenter
        viewController = VC1ViewController(viewModel: viewModel)
    }
    
    public func start() {
        viewModel.delegate = self
        
        viewController.modalPresentationStyle = .fullScreen
        presenter.present(viewController, animated: true, completion: nil)
    }
}

extension VC1Coordinator: VC1ViewModelDelegate {
    func dismiss() {
        presenter.dismiss(animated: true, completion: nil)
    }
}
