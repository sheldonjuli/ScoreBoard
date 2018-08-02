//
//  ViewController.swift
//  ScoreBoard
//
//  Created by Li Ju on 2018-07-30.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonList: UIButton!
    @IBOutlet weak var buttonPie: UIButton!
    @IBOutlet weak var buttonDonut: UIButton!
    @IBOutlet weak var buttonBlock: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDetailSettingPopUp(_ sender: UIButton) {
        
        var boardStyle : BoardStyle? = nil
        
        switch sender {
        case buttonList:
            boardStyle = BoardStyle.List
        case buttonPie:
            boardStyle = BoardStyle.Pie
        case buttonBlock:
            boardStyle = BoardStyle.Block
        case buttonDonut:
            boardStyle = BoardStyle.Donut
        default:
            return
        }
        
        let detailSettingPopUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailSettingPopUpID") as! DetailSettingPopUpViewController
        detailSettingPopUpVC.boardStyle = boardStyle
        self.addChildViewController(detailSettingPopUpVC)
        detailSettingPopUpVC.view.frame = self.view.frame
        self.view.addSubview(detailSettingPopUpVC.view)
        detailSettingPopUpVC.didMove(toParentViewController: self)
    }
}

