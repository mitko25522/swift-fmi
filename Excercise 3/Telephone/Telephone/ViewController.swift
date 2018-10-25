//
//  ViewController.swift
//  Telephone
//
//  Created by Dimitar Stoyanov on 25.10.18.
//  Copyright © 2018 Dimitar Stoyanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var parentView: UIView!
    @IBOutlet var numButtons: [UIButton]!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var eraseButton: UIButton!
    @IBOutlet weak var labelView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.parentView.alpha = 0
        labelView.text = ""
        eraseButton.isHidden = true
        
        let myGreen = UIColor(red: 0.1, green: 1, blue: 0, alpha: 1)
        callButton.backgroundColor = myGreen
        
        callButton.layer.cornerRadius = callButton.frame.width/2
        eraseButton.backgroundColor = nil
        for button in numButtons {
            button.layer.cornerRadius = button.frame.width/2
        }
        
        UIView.animate(withDuration: 0.5) {
            self.parentView.alpha = 1
        }
    }

    @IBAction func buttonTap(_ sender: UIButton) {
        if let buttonTitle = sender.currentTitle {
            labelView.text = (labelView.text ?? "") + buttonTitle
        }
        animateButton(sender)
        updateEraseButton()
    }
    
    func animateButton(_ button: UIButton){
        zoomInButton(button)
        zoomOutButton(button)
    }
    
    func zoomInButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.1) {
            button.center.x -= 5
            button.center.y -= 5
            button.frame.size.width += 10
            button.frame.size.height += 10
        }
    }
    func zoomOutButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.2) {
            button.center.x += 5
            button.center.y += 5
            button.frame.size.width -= 10
            button.frame.size.height -= 10
        }
    }
    
    @IBAction func erase(_ sender: UIButton) {
        if let labelText = labelView.text?.dropLast() {
            labelView.text = String(labelText)
        }
        updateEraseButton()
    }
    
    func updateEraseButton() {
        eraseButton.isHidden = labelView.text?.isEmpty ?? true
    }
    
    @IBAction func zeroLongPress(_ sender: Any) {
        if (sender as? UILongPressGestureRecognizer)?.state == .began {
         labelView.text = (labelView.text ?? "") + "+"
        }
    }
    
}
