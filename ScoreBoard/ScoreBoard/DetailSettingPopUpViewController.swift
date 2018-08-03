//
//  DetailSettingPopUpViewController.swift
//  ScoreBoard
//
//  Created by Li Ju on 2018-07-30.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit

class DetailSettingPopUpViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var boardStylePreview: UIImageView!
    @IBOutlet weak var playerNumLabel: UILabel!
    @IBOutlet weak var playerNumStepper: UIStepper!
    @IBOutlet weak var scoreValue: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var boardStyle: BoardStyle? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showPopUp()
        
        // TODO dynamically draw the preview
        self.showBoardStylePreview()
        
        playerNumStepper.minimumValue = 1
        playerNumStepper.maximumValue = 8
        
        playerNumLabel.text = Int(playerNumStepper.value).description
        
        scoreValue.keyboardType = UIKeyboardType.numberPad
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetailSettingPopUp(_ sender: UIButton) {
        // Clear player list
        Player.currId = 0
        
        self.removePopUp()
    }
    
    @IBAction func editPlayerNum(_ sender: UIStepper) {
        playerNumLabel.text = Int(playerNumStepper.value).description
    }
    
    @IBAction func clickNextButton(_ sender: UIButton) {
        let board = Board(playerNum: Int(playerNumStepper.value), boardStyle: boardStyle!)

//        print(board.boardStyle)
//        print(board.players.count)
//
//        for player in board.players {
//            print(player.name)
//        }

        switch board.boardStyle {
        case BoardStyle.List:
            performSegue(withIdentifier: "openListVC", sender: sender)
        case BoardStyle.Pie:
            performSegue(withIdentifier: "openPieVC", sender: sender)
        case BoardStyle.Block:
            performSegue(withIdentifier: "openBlockVC", sender: sender)
        case BoardStyle.Donut:
            performSegue(withIdentifier: "openDonutVC", sender: sender)
        }
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
    
    func showBoardStylePreview() {
        if let boardStyle = self.boardStyle {
            switch boardStyle {
            case .List:
                boardStylePreview.image = UIImage(named: "list.png")
            case .Pie:
                boardStylePreview.image = UIImage(named: "pie.png")
            case .Block:
                boardStylePreview.image = UIImage(named: "block.png")
            case .Donut:
                boardStylePreview.image = UIImage(named: "donut.png")
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openListVC" {
            let listVC = segue.destination as? ListViewController
        }
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

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
