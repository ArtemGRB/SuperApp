//
//  AuthorizationRouter.swift
//  SuperApp
//
//  Created by Артем Гребнев on 21.06.2024.
//  
//

import Foundation

// MARK: Protocol - AuthorizationPresenterToRouterProtocol (Presenter -> Router)
protocol AuthorizationPresenterToRouterProtocol: AnyObject {

}

class AuthorizationRouter {

    // MARK: Properties
    weak var view: AuthorizationRouterToViewProtocol!
}

// MARK: Extension - AuthorizationPresenterToRouterProtocol
extension AuthorizationRouter: AuthorizationPresenterToRouterProtocol {
    
}