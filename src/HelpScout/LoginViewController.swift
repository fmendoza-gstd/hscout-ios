//
//  LoginViewController.swift
//  HelpScout
//
//  Created by Software on 21/12/16.
//  Copyright © 2016 GlobalSTD. All rights reserved.
//

class LoginViewController: BaseViewController, LoginView, UITextFieldDelegate {
    
    @IBOutlet weak var sign: UIButton!
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    var segueIdentifier :String = "helpScout"

    var loginPresenter : LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        loginPresenter = LoginPresenter(loginView: self)
        
        sign.layer.borderColor = UIColor.blackColor().CGColor
        btnLogin.layer.cornerRadius = 1.0
        
        loginPresenter.startInitialization()
        btnLogin.layer.cornerRadius = 5.0
        btnLogin.layer.masksToBounds = true
        
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
     Login View Delegate methods start
     */
    
    func intializeViewAndDelegate(){
        
        self.navigationController?.navigationBarHidden = true
        
        txtUserName.delegate = self
        txtUserPassword.delegate = self
    }
    
    func showErrorMessage(errorMessage: String){
        showMessage(errorMessage)
    }
    
    func showSuccessMessage(success: String){
        //        showMessage(success)
        ToastView.makeToast(self.view!,
                            text: "Login Successful", duration: 2.0)
    }
    
    
    /*
     Login View Delegate methods Ends
     */
    
    private func showMessage(msg :String){
        
        
        let alertController = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (result : UIAlertAction) -> Void in
            print("OK")
        }
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func onLoginTapped(sender: UIButton) {
        
        loginPresenter.doValidation(txtUserName.text!, pasword: txtUserPassword.text!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //delegate method
        textField.resignFirstResponder()
        
        if(textField == txtUserName){
            txtUserPassword.becomeFirstResponder()
        }
        
        return true
    }
    
}
