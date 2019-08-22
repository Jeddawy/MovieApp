//
//  BaseViewModel.swift
//  Movies App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import Foundation

class BaseViewModel {
    
    var showLoader: (()-> Void)!
    var hideLoader: (()-> Void)!
    var showAlertClosure: (()->())?
    var refreshClosure: (()->())?
    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }
}
