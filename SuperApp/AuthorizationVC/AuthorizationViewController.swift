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
    private let backgroundColor = UIColor(red: 61/255, green: 139/255, blue: 188/255, alpha: 1)
    private let elementOffset = 10
    
    private lazy var scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.alwaysBounceVertical = true
        return scroll
    }()
    
    var commonView: UIView = {
        return UIView()
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

        registerForKeyboardNotifications()
        configureUI()
        presenter.viewDidLoad()
    }
    
    
    // MARK: - private func
    private func commonInit() {
        
        [commonView, scrollView].forEach { $0.backgroundColor = backgroundColor}
    }
    
    private func configureUI() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        
        scrollView.addSubview(commonView)
        commonView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
            make.width.equalToSuperview()
        }
     
        // MARK: - верстка лого
        
        commonView.addSubview(label)

        label.snp.makeConstraints { make in
            make.top.equalTo(400)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }

        //MARK: - верстка поля для ввода логина
        
        commonView.addSubview(loginText)
        
        loginText.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(elementOffset)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        //MARK: - верстка поля для ввода пароля
        
        commonView.addSubview(pwText)
        
        pwText.snp.makeConstraints { make in
            make.top.equalTo(loginText.snp.bottom).offset(elementOffset)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        //MARK: - верстка кнопки входа
        
        commonView.addSubview(buttonLoginIn)
        
        buttonLoginIn.snp.makeConstraints { make in
            make.top.equalTo(pwText.snp.bottom).offset(elementOffset)
            make.left.equalToSuperview().inset(40)
            make.right.equalToSuperview().inset(40)
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.bottom.equalToSuperview()
        }
    }
    
    private func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(presentKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(hideKeyboard),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc
    private  func presentKeyboard(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height + (UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0)
            
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
            scrollView.scrollToBottom()
        }
    }
    
    @objc
    private func hideKeyboard() {
        scrollView.contentInset = .zero
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
