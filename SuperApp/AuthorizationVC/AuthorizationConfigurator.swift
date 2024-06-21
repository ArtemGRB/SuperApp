//
//  AuthorizationConfigurator.swift
//  SuperApp
//
//  Created by Артем Гребнев on 21.06.2024.
//  
//

import UIKit

class AuthorizationConfigurator {
    func configure() -> UIViewController {
        let view = AuthorizationViewController()
        let presenter = AuthorizationPresenter()
        let router = AuthorizationRouter()
        let interactor = AuthorizationInteractor()
        
        view.presenter = presenter

        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view

        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}