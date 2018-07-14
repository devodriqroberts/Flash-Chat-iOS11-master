//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import  Firebase
import SVProgressHUD


class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        SVProgressHUD.show()

        
        //TODO: Log in the user
        guard let emailText = emailTextfield.text else {return print("Please enter an email.")}
        guard let passwordText = passwordTextfield.text else {return print("Please enter your password.")}
        Auth.auth().signIn(withEmail: emailText, password: passwordText) { (user, error) in
            
            if error != nil {
                SVProgressHUD.dismiss()
                print("Sign-in error")
            } else {
                print("Sign in successful")
                SVProgressHUD.dismiss()
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
    }
    


    
}  
