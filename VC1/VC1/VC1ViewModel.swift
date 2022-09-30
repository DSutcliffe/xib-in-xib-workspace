//
//  VC1ViewModel.swift
//  VC1
//
//  Created by Daniel Sutcliffe on 30/09/2022.
//

import Foundation

protocol VC1ViewModelDelegate: AnyObject {
    func dismiss()
}

class VC1ViewModel {
    public var delegate: VC1ViewModelDelegate?
    
    let backButtonTitle = "Back"
    
    func dismiss() {
        delegate?.dismiss()
    }
}
