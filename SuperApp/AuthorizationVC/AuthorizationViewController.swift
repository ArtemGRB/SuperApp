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
    var commonView: UIView = {
        
        let commonView = UIView()
        commonView.backgroundColor = UIColor(red: 61/255, green: 139/255, blue: 188/255, alpha: 1)
        return commonView
    }()
    
    private lazy var label: UILabel = {
        
        let label = UILabel()
        label.text = "Калькулятор разбуха"
        label.font = UIFont(name: "Avenir Next Demi Bold", size: 20)
        label.numberOfLines = 2
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    
    private lazy var loginText: UITextField = {
        
        let loginText = UITextField()
        loginText.placeholder = "введите логин"
        loginText.backgroundColor = .white
        loginText.layer.cornerRadius = 5
        loginText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginText.frame.height))
        loginText.leftViewMode = .always
        return loginText
        
    }()
    
    private lazy var pwText: UITextField = {
        
        let pwText = UITextField()
        pwText.placeholder = "введите пароль"
        pwText.backgroundColor = .white
        pwText.layer.cornerRadius = 5
        pwText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: pwText.frame.height))
        pwText.leftViewMode = .always
        return pwText
    }()
    
    private lazy var buttonLoginIn: UIButton = {
        
        let buttonLoginIn = UIButton()
        buttonLoginIn.setTitle("Войти", for: .normal)
        buttonLoginIn.backgroundColor = UIColor(red: 0/255, green: 94/255, blue: 171/255, alpha: 1)
        buttonLoginIn.layer.cornerRadius = 10
        return buttonLoginIn
        
    }()
    
    private lazy var buttonRegistration: UIButton = {
        let buttonRegistration = UIButton()
        return buttonRegistration
    }()
    
    private lazy var buttonForgotPW: UIButton = {
        let buttonForgotPW = UIButton()
        return buttonForgotPW
        
    }()

    
    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()


        
        
        configureUI()
        presenter.viewDidLoad()
    }
    
    
    // MARK: - private func
    private func commonInit() {

    }
    
    private func configureUI() {
        view.addSubview(commonView)
        
        commonView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        
        
        // MARK: - верстка лого
        
        commonView.addSubview(label)

        label.snp.makeConstraints { make in
            make.top.equalTo(additionalSafeAreaInsets).inset(200)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }

        //MARK: - верстка поля для ввода логина
        
        commonView.addSubview(loginText)
        
        
        loginText.snp.makeConstraints { make in
            make.top.equalTo(label).inset(80)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        //MARK: - верстка поля для ввода пароля
        
        commonView.addSubview(pwText)
        
       
        pwText.snp.makeConstraints { make in
            make.top.equalTo(loginText).inset(50)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        //MARK: - верстка кнопки входа
        
        commonView.addSubview(buttonLoginIn)
        
        buttonLoginIn.snp.makeConstraints { make in
            make.top.equalTo(pwText).inset(50)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(80)
            make.height.equalTo(30)
        }
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
