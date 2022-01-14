//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var turn = 0

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var playAgn: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMidButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var midLeftButton: UIButton!
    @IBOutlet weak var midMidButton: UIButton!
    @IBOutlet weak var midRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    @IBOutlet weak var bottomMidButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playAgn.isHidden = true
    }
    
    @IBAction func buttonClicked(_ sender:UIButton){
        if(playAgn.isHidden == true){
            if(sender.isSelected == false){
                if(turn%2==0){
                    sender.setImage(UIImage(named: "cross"), for: .normal)
                    turn = turn + 1
                }else{
                    sender.setImage(UIImage(named: "nought"), for: .normal)
                    turn = turn + 1
                }
            }
        }
        
        sender.isSelected = true
        if(checkWinCross(but1: topLeftButton, but2: topMidButton, but3: topRightButton) || checkWinCross(but1: midLeftButton, but2: midMidButton, but3: midRightButton) || checkWinCross(but1: bottomLeftButton, but2: bottomMidButton, but3: bottomRightButton) || checkWinCross(but1: topLeftButton, but2: midLeftButton, but3: bottomLeftButton) || checkWinCross(but1: topMidButton, but2: midMidButton, but3: bottomMidButton) || checkWinCross(but1: topRightButton, but2: midRightButton, but3: bottomRightButton) || checkWinCross(but1: topLeftButton, but2: midMidButton, but3: bottomRightButton) || checkWinCross(but1: topRightButton, but2: midMidButton, but3: bottomLeftButton)){
            playAgn.isHidden = false
            result.text = "Cross is the winner!"
        }else if(checkWinNought(but1: topLeftButton, but2: topMidButton, but3: topRightButton) || checkWinNought(but1: midLeftButton, but2: midMidButton, but3: midRightButton) || checkWinNought(but1: bottomLeftButton, but2: bottomMidButton, but3: bottomRightButton) || checkWinNought(but1: topLeftButton, but2: midLeftButton, but3: bottomLeftButton) || checkWinNought(but1: topMidButton, but2: midMidButton, but3: bottomMidButton) || checkWinNought(but1: topRightButton, but2: midRightButton, but3: bottomRightButton) || checkWinNought(but1: topLeftButton, but2: midMidButton, but3: bottomRightButton) || checkWinNought(but1: topRightButton, but2: midMidButton, but3: bottomLeftButton)){
            playAgn.isHidden = false
            result.text = "Nought is the winner!"
        }
    }
    
    func checkWinCross(but1:UIButton, but2:UIButton, but3:UIButton) -> Bool{
        if(but1.image(for: .normal) == UIImage(named: "cross") && but2.image(for: .normal) == UIImage(named: "cross") && but3.image(for: .normal) == UIImage(named: "cross")){
            return true
        }
        return false
    }
    
    func checkWinNought(but1:UIButton, but2:UIButton, but3:UIButton) -> Bool{
        if(but1.image(for: .normal) == UIImage(named: "nought") && but2.image(for: .normal) == UIImage(named: "nought") && but3.image(for: .normal) == UIImage(named: "nought")){
            return true
        }
        return false
    }
    
    
    @IBAction func PlayAgain(_ sender: UIButton) {
        turn = 0
        var buttons: [UIButton] = []
        buttons.append(topLeftButton)
        buttons.append(topMidButton)
        buttons.append(topRightButton)
        buttons.append(midLeftButton)
        buttons.append(midMidButton)
        buttons.append(midRightButton)
        buttons.append(bottomLeftButton)
        buttons.append(bottomMidButton)
        buttons.append(bottomRightButton)
        
        for but in buttons{
            but.setImage(nil, for: .normal)
            but.isSelected = false
        }
        playAgn.isHidden = true
        result.text = ""
    }
    
}

