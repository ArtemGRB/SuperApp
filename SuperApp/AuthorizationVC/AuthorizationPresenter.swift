//
//  AuthorizationPresenter.swift
//  SuperApp
//
//  Created by Артем Гребнев on 21.06.2024.
//  
//

import Foundation

// MARK: Protocol - AuthorizationViewToPresenterProtocol (View -> Presenter)
protocol AuthorizationViewToPresenterProtocol: AnyObject {
	func viewDidLoad()
}

// MARK: Protocol - AuthorizationInteractorToPresenterProtocol (Interactor -> Presenter)
protocol AuthorizationInteractorToPresenterProtocol: AnyObject {

}

class AuthorizationPresenter {

    // MARK: Properties
    var router: AuthorizationPresenterToRouterProtocol!
    var interactor: AuthorizationPresenterToInteractorProtocol!
    weak var view: AuthorizationPresenterToViewProtocol!
}

// MARK: Extension - AuthorizationViewToPresenterProtocol
extension AuthorizationPresenter: AuthorizationViewToPresenterProtocol {
    func viewDidLoad() {
    
    }
}

// MARK: Extension - AuthorizationInteractorToPresenterProtocol
extension AuthorizationPresenter: AuthorizationInteractorToPresenterProtocol {
    
}