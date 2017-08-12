//
//  WelcomeViewController.swift
//  Crypto Symbol Keyboard
//
//  Created by Matthew Riley on 6/11/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backingView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.layer.borderWidth = 1.0
        self.backingView.layer.borderColor = UIColor.white.cgColor
        self.backingView.addBigDropShadow(color: UIColor.green)
        self.textView.text = NSLocalizedString("WelcomeTextView", comment: "")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.textView.scrollRangeToVisible(NSRange(location: 0,length: 0))
    }

    // MARK: - Navigation
    @IBAction func nextButton(_ sender: Any) {
        let vc = KeyboardTutorialViewController()
        self.present(vc, animated: true) { 
            }
    }



}
