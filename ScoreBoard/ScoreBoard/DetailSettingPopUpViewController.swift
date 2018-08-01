//
//  DetailSettingPopUpViewController.swift
//  ScoreBoard
//
//  Created by Li Ju on 2018-07-30.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit

class DetailSettingPopUpViewController: UIViewController {

    @IBOutlet weak var boardStyleLabel: UILabel!
    @IBOutlet weak var playerNumLabel: UILabel!
    @IBOutlet weak var playerNumStepper: UIStepper!
    
    var boardStyle: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showPopUp()

        boardStyleLabel.text = boardStyle

        playerNumStepper.minimumValue = 1
        playerNumStepper.maximumValue = 8

        playerNumLabel.text = Int(playerNumStepper.value).description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetailSettingPopUp(_ sender: UIButton) {
        self.removePopUp()
    }
    
    @IBAction func editPlayerNum(_ sender: UIStepper) {
        playerNumLabel.text = Int(playerNumStepper.value).description
    }

    func showPopUp() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removePopUp() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        });
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
