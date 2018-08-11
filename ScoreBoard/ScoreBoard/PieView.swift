//
//  File.swift
//  ScoreBoard
//
//  Created by Li Ju on 2018-08-08.
//  Copyright © 2018 Li Ju. All rights reserved.
//

import UIKit

class PieView: UIView {
    override func draw(_ rect: CGRect) {

        let circlePath = UIBezierPath(arcCenter: rect.center, radius: CGFloat(rect.maxX - rect.midX), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        circlePath.addClip()
        UIColor(hex: ColorPool.LightGrey.rawValue).setFill()
        circlePath.fill()
    }
}
