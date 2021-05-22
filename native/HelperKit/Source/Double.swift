//
//  Double.swift
//  IOSHelperKit
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

public extension Double {
    
    func convertFileSizeFormat() -> String {
        
        return ByteCountFormatter.string(fromByteCount: Int64(self), countStyle: .file)
    }
    
    /*
     Duration Format:-
     
     params:- (style: DateComponentsFormatter.UnitsStyle)
     .positional  // 1:46:40
     .abbreviated // 1h 46m 40s
     .short       // 1 hr, 46 min, 40 sec
     .full        // 1 hours, 46 minutes, 40 seconds
     .spellOut    // one hour, forty-six minutes, forty seconds
     .brief       // 1hr 46min 40sec
     */
    
    func durationFormat(style: DateComponentsFormatter.UnitsStyle, allowedUnits: NSCalendar.Unit = [.hour, .minute, .second]) -> String {
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.unitsStyle = style
        guard let formattedString = formatter.string(from: self) else { return "" }
       
        return formattedString
    }
}
