//
//  AuthorizationInteractor.swift
//  SuperApp
//
//  Created by Артем Гребнев on 21.06.2024.
//  
//

import Foundation

// MARK: Protocol - AuthorizationPresenterToInteractorProtocol (Presenter -> Interactor)
protocol AuthorizationPresenterToInteractorProtocol: AnyObject {

}

class AuthorizationInteractor {

    // MARK: Properties
    weak var presenter: AuthorizationInteractorToPresenterProtocol!

}

// MARK: Extension - AuthorizationPresenterToInteractorProtocol
extension AuthorizationInteractor: AuthorizationPresenterToInteractorProtocol {
    
}