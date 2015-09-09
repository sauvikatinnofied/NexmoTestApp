//
//  ViewController.swift
//  Test
//
//  Created by Sauvik Dolui on 09/09/15.
//  Copyright (c) 2015 Innofied Solution Pvt. Ltd. All rights reserved.
//

import UIKit
import VerifyIosSdk

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldVC: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }
    @IBAction func buttonClickedSendCode(sender: AnyObject) {
        VerifyClient.getVerifiedUser(countryCode: "IN", phoneNumber: textFieldPhoneNumber.text,
            onVerifyInProgress: {
                // called when the verification process begins
            },
            onUserVerified: {
                // called when the user has been successfully verified
            },
            onError: { (error: VerifyError) in
                // called when some error occurrs during verification, e.g. wrong pin entered.
                // see the VerifyError class for details on what to expect
            }
        )
    }

    @IBAction func buttonClickedVerify(sender: AnyObject) {
        VerifyClient.checkPinCode(textFieldVC.text)
    }

}

