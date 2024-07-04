//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import FirebaseAuth
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
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!){ (user, error ) in
            
            if error != nil {
                print(error!)
                print("crashing here")
          } else{
                print("Login sucessful!")
                self.performSegue(withIdentifier:"goToChat", sender: self)
                
                SVProgressHUD.dismiss()
            }
        }
        
        //TODO: Log in the user
        
        
    }
    

    
}  
