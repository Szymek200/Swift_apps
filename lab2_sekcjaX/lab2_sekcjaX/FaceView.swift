//
//  FaceView.swift
//  lab2_sekcjaX
//
//  Created by MM on 21/11/2022.
//

import UIKit

class FaceView: UIView {

    var colRed: Float = 0.0
    var colGreen: Float = 0.0
    var colBlue: Float = 0.0
    var smile: Float = 0.0
    
    var LRed: Float = 0.0
    var LGreen: Float = 0.0
    var LBlue: Float = 0.0
    
    var RRed: Float = 0.0
    var RGreen: Float = 0.0
    var RBlue: Float = 0.0
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let bounds:CGRect = self.bounds
        
        var midPoint=CGPoint() // center of our bounds in our coordinate system
        midPoint.x = bounds.origin.x + bounds.size.width/2
        midPoint.y = bounds.origin.y + bounds.size.height/2
        
     
        var point1=CGPoint()
        point1.x = midPoint.x
        point1.y = midPoint.y
        
        // Eye offsets
        let eyeOffsetX: CGFloat = 110 * 0.4   // horizontal distance from center
        let eyeOffsetY: CGFloat = 110 * 0.2   // vertical distance upward

        // Left and right eye positions
        let leftEye  = CGPoint(x: midPoint.x - eyeOffsetX, y: midPoint.y - eyeOffsetY)
        let rightEye = CGPoint(x: midPoint.x + eyeOffsetX, y: midPoint.y - eyeOffsetY)
        
        
        //duzy okrag
        let path:UIBezierPath=UIBezierPath()
        path.addArc(withCenter: point1, radius: 110, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        path.lineWidth=10
        let color = UIColor(red:CGFloat(colRed), green:CGFloat(colGreen), blue: CGFloat(colBlue), alpha: alpha)
        color.setFill()
        path.stroke()
        path.fill()

        
        
        ///lewe oko
        let path2:UIBezierPath=UIBezierPath()
        path2.addArc(withCenter: leftEye, radius: 15, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        path2.lineWidth=10
        let colorL = UIColor(red:CGFloat(LRed), green:CGFloat(LGreen), blue: CGFloat(LBlue), alpha: alpha)
        colorL.setFill()
        path2.stroke()
        path2.fill()
        
        let path3:UIBezierPath=UIBezierPath()
        path3.addArc(withCenter: rightEye, radius: 15, startAngle: 0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        path3.lineWidth=10
        let colorR = UIColor(red:CGFloat(RRed), green:CGFloat(RGreen), blue: CGFloat(RBlue), alpha: alpha)
        colorR.setFill()
        path3.stroke()
        path3.fill()
        
        let smileWidth: CGFloat = 80
        //let smileHeight: CGFloat = 30
        
        let startPoint = CGPoint(
            x: midPoint.x - smileWidth / 2,
            y: midPoint.y + 40              // lower than center
        )

        let endPoint = CGPoint(
            x: midPoint.x + smileWidth / 2,
            y: midPoint.y + 40
        )
        
        let controlPoint = CGPoint(
            x: midPoint.x,
            y: midPoint.y + 40  + CGFloat(smile) // deeper smile
        )
        
        let smilePath = UIBezierPath()
        smilePath.move(to: startPoint)
        smilePath.addQuadCurve(to: endPoint, controlPoint: controlPoint)
        
        	
        UIColor.black.setStroke()
        smilePath.lineWidth = 8
        smilePath.stroke()
  
    }
    

}
