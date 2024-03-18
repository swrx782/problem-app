//
//  OneOrTwoDivOneWithRemaindAns.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/14.
//

import SwiftUI

struct OneOrTwoDivOneWithRemaindAns: View {
    
    
    @Binding var divisor: Int
    @Binding var dividend: Int
    
    
    var body: some View {
        
        let fontSize    = CGFloat(170)
        
        VStack {
            Text("\(dividend / divisor)•••\(dividend % divisor)")
        }.font(.system(size:fontSize))
        
    }
    
    
}
