//
//  DetailSettingPopUpViewController.swift
//  ScoreBoard
//
//  Created by Li Ju on 2018-07-30.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit

class DetailSettingPopUpViewController: UIViewController {
    
    @IBOutlet private weak var popUpView: UIView!
    @IBOutlet private weak var boardStylePreview: UIImageView!
    @IBOutlet private weak var playerNumDownButton: UIButton!
    @IBOutlet private weak var playerNumLabel: UILabel!
    @IBOutlet private weak var playerNumUpButton: UIButton!
    @IBOutlet private weak var scoreValue: UITextField!
    @IBOutlet private weak var nextButton: UIButton!
    
    var boardStyle: BoardStyle? = nil
    private(set) var playerNum: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: dynamically draw the preview
        showBoardStylePreview()
        playerNumLabel.text = playerNum.description
        scoreValue.keyboardType = UIKeyboardType.numberPad
        showPopUp()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeDetailSettingPopUp(_ sender: UIButton) {
        // Clear player list
        Player.restartPlayerCount()
        removePopUp()
    }
    
    @IBAction func editPlayerNum(_ sender: UIButton) {
        
        if sender == playerNumDownButton, playerNum > 1 {
            playerNum -= 1
        } else if sender == playerNumUpButton {
            if boardStyle == .List {
                if playerNum < 25 {
                    playerNum += 1
                }
            } else {
                if playerNum < 8 {
                    playerNum += 1
                }
            }
        }
        playerNumLabel.text = playerNum.description
    }
    
    @IBAction func clickNextButton(_ sender: UIButton) {

        assert(boardStyle != nil, "Error: Board can not be initialized with boardStyle nil.")

        let board = Board(playerNum: playerNum, boardStyle: boardStyle!)
        
        switch board.boardStyle {
        case .List:
            performSegue(withIdentifier: "openListVC", sender: sender)
        case .Pie:
            performSegue(withIdentifier: "openPieVC", sender: sender)
        case .Block:
            performSegue(withIdentifier: "openBlockVC", sender: sender)
        case .Donut:
            performSegue(withIdentifier: "openDonutVC", sender: sender)
        }
    }
    
    private func showPopUp() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    private func removePopUp() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
        });
    }
    
    private func showBoardStylePreview() {
        
        assert(boardStyle != nil, "Error: Board preview can not be shown with boardStyle nil.")

        switch boardStyle! {
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
