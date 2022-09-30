//
//  VC2ViewModel.swift
//  VC2
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import Foundation

protocol VC2ViewModelDelegate: AnyObject {
    func dismiss()
}

class VC2ViewModel {
    public var delegate: VC2ViewModelDelegate?
    
    let backButtonTitle = "Back"
    
    func dismiss() {
        delegate?.dismiss()
    }
}
