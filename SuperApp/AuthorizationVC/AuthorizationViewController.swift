//
//  AuthorizationViewController.swift
//  SuperApp
//
//  Created by Артем Гребнев on 21.06.2024.
//  
//
import SnapKit
import UIKit

// MARK: Protocol - AuthorizationPresenterToViewProtocol (Presenter -> View)
protocol AuthorizationPresenterToViewProtocol: AnyObject {

}

// MARK: Protocol - AuthorizationRouterToViewProtocol (Router -> View)
protocol AuthorizationRouterToViewProtocol: AnyObject {
    func presentView(view: UIViewController)
    func pushView(view: UIViewController)
}

class AuthorizationViewController: UIViewController {

    // MARK: - Property
    var presenter: AuthorizationViewToPresenterProtocol!
//    var commonView = UIView()
//    var label = UILabel()
//    var pwText = UITextField()
//    var button = UIButton()

    
//    // MARK: - init
//    init() {
//        super.init(nibName: nil, bundle: nil)
//
//        commonInit()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        commonInit()
//    }
//    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        view.addSubview(commonView)
//        commonView.backgroundColor = .cyan
//        commonView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        commonView.addSubview(label)
//        label.backgroundColor = .green
//        label.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(50)
//            make.centerX.equalToSuperview()
//            make.width.height.equalTo(100)
//
//        }
//
        configureUI()
        presenter.viewDidLoad()
    }
    
    // MARK: - private func
    private func commonInit() {

    }

    private func configureUI() {

    }
}

// MARK: Extension - AuthorizationPresenterToViewProtocol 
extension AuthorizationViewController: AuthorizationPresenterToViewProtocol{
    
}

// MARK: Extension - AuthorizationRouterToViewProtocol
extension AuthorizationViewController: AuthorizationRouterToViewProtocol{
    func presentView(view: UIViewController) {
        present(view, animated: true, completion: nil)
    }

    func pushView(view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}
