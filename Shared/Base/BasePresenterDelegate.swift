//
//  BasePresenterDelegate.swift
//  ParrotLite
//
//  Created by Esteban Sánchez on 04/06/2021.
//

import Foundation

protocol BasePresenterDelegate: AnyObject {
    func showError(title: String, description: String)
    func showSuccess(title: String, description: String)
}
