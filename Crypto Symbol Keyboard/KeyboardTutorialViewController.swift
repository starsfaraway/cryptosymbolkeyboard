//
//  KeyboardTutorialViewController.swift
//  Crypto Symbol Keyboard
//
//  Created by Matthew Riley on 6/11/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//

import UIKit

class KeyboardTutorialViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
        self.textView.text = NSLocalizedString("InstructionsTextView", comment: "")
    }
    
    
    @IBAction func backToFirstScreen(_ sender: Any) {
        self.dismiss(animated: true) { 
            
        }
    }
}
