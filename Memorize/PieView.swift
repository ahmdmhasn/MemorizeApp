//
//  PieView.swift
//  Memorize
//
//  Created by Ahmed M. Hassan on 23/01/2021.
//

import SwiftUI

// MARK: - PieView
//
struct PieView: Shape {
  
  let startAngle: Angle
  let endAngle: Angle
  let clockwise: Bool
  
  init(start startDegrees: Double, end endDegrees: Double, clockwise: Bool = false) {
    self.startAngle = Angle.degrees(startDegrees - 90)
    self.endAngle = Angle.degrees(endDegrees - 90)
    self.clockwise = clockwise
  }
  
  func path(in rect: CGRect) -> Path {
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) / 2
    
    let startPoint = CGPoint(
      x: center.x + radius * CGFloat(cos(startAngle.radians)),
      y: center.y + radius * CGFloat(sin(startAngle.radians))
    )
    
    var path = Path()
    path.move(to: center)
    path.addLine(to: startPoint)
    path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
    path.addLine(to: center)
    return path
  }
}
