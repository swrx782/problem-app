//
//  ThreeDivOneProb2.swift
//  筆算
//
//  Created by 和田翔太 on 2024/02/05.
//

import SwiftUI



struct ThreeDivOneProb2: View {
    
    
    
    
    @State var isShowAnswer = false
    @State var divisor  = -1
    @State var dividend = -1
    
    
    
    
    // 割る数と割られる数の変更
    func changeDivisorAndDivinded() {
        divisor  = Int.random(in: 1...9)
        dividend = Int.random(in: 100...999)
    }
    
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            Text("\(dividend) ÷ \(divisor)")
                .font(.system(size:200))
                .padding()
            
            
            HStack {
                
                // 問題変更ボタン
                Button {
                    changeDivisorAndDivinded()
                } label: {
                    Text("問題変更")
                }
                .padding()
                
                // 答えボタン
                Button {
                    isShowAnswer = true
                } label: {
                    Text("答え")
                }.sheet(isPresented: $isShowAnswer) {
                    /*
                    ThreeDivOneAns2(
                        divisor: $divisor, dividend: $dividend
                    )
                     */
                    
                }
                .padding()
                
            }
            .font(.system(size:100))
            
            
        }
        .onAppear {
            changeDivisorAndDivinded()
        }
        
        
        
    }
    
    
    
    
}

#Preview {
    ThreeDivOneProb2()
}

