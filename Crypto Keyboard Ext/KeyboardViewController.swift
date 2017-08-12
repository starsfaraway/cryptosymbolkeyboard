//
//  KeyboardViewController.swift
//  Crypto Keyboard Ext
//
//  Created by Matthew Riley on 6/11/17.
//  Copyright © 2017 Farawaystars. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet weak var nextKeyboardButton: UIButton!
    @IBOutlet var backingView: UIView!
    var enableInputClicksWhenVisible: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "KeyboardView", bundle: nil)
        let objects = nib.instantiate(withOwner: self, options: nil)
        if let object0 = objects[0] as? UIView {
            view = object0
        }
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.addDropShadowsToButtons()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            self.setupDarkKeyboard()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app does not need to know about this
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app does not need to know about this except to adjust the view
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    //MARK: UI
    
    func addDropShadowsToButtons() {
        for view in self.backingView.subviews {
            view.addDropShadow(color: UIColor.black)
        }
    }
    
    func setupDarkKeyboard() {
        for view in self.backingView.subviews {
            for sView in view.subviews {
                if let sButton : UIButton = sView as? UIButton {
                    sButton.backgroundColor = UIColor.black
                    sButton.setTitleColor(UIColor.white, for: UIControlState.normal)
                    self.backingView.backgroundColor = UIColor.darkGray
                }
            }
        }
    }
    
    
    //MARK: KEYBOARD BUTTON ACTIONS
    
    @IBAction func keyPressed(button: UIButton) {
        let string = button.titleLabel!.text
        (textDocumentProxy as UIKeyInput).insertText("\(string!)")
        
        self.backingView.bringSubview(toFront: button)
        UIDevice.current.playInputClick()
        UIView.animate(withDuration: 0.2, animations: { 
            button.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
        }) { (completion) in
            button.transform =
                CGAffineTransform(scaleX: 1.0, y: 1.0)
        }

    }

    @IBAction func spaceBarPressed(_ sender: Any) {
        (textDocumentProxy as UIKeyInput).insertText(" ")
    }
    
    @IBAction func backspacePressed(_ sender: Any) {
        (textDocumentProxy as UIKeyInput).deleteBackward()
    }
    
    @IBAction func returnPressed(_ sender: Any) {
        (textDocumentProxy as UIKeyInput).insertText("\n")
    }

}
