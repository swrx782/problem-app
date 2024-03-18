//
//  OneOrTwoDivOneNoRemaindAns.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/13.
//



import SwiftUI



struct OneOrTwoDivOneNoRemaindAns: View {
    
    
    @Binding var divisor: Int
    @Binding var dividend: Int
    
    
    var body: some View {
        
        let fontSize    = CGFloat(200)
        
        VStack {
            Text("\(dividend / divisor)")
        }.font(.system(size:fontSize))
        
    }
    
    
}
