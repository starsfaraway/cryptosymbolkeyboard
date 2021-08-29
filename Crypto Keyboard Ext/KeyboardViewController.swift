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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: UI
    
    func addDropShadowsToButtons() {
        for view in self.backingView.subviews {
            view.addDropShadow(color: UIColor.black)
        }
    }
    
    //MARK: KEYBOARD BUTTON ACTIONS
    
    @IBAction func keyPressed(button: UIButton) {
        let string = button.titleLabel!.text
        (textDocumentProxy as UIKeyInput).insertText("\(string!)")
        
        self.backingView.bringSubviewToFront(button)
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
