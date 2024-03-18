//
//  ThreeDivOneProb.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/29.
//





import SwiftUI





struct ThreeDivOneProb: View {
    
    
    
    
    @State var isShowAnswer = false
    @State var divisor  = -1
    @State var dividend = -1
    
    
    
    
    // 割る数と割られる数の変更
    func changeDivisorAndDivinded() {
        divisor  = Int.random(in: 2...9)
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
                    Text("問題を変える")
                }
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
                
                // 答えボタン
                Button {
                    isShowAnswer = true
                } label: {
                    Text("答えは\nないよ")
                }
                /*
                .sheet(isPresented: $isShowAnswer) {
                    // 後で答えと連結
                    ThreeDivOneAns(
                        dividend: $dividend, divisor: $divisor
                    )
                }
                 */
                
                
            }
            .font(.system(size:100))
            
            
        }
        .onAppear {
            changeDivisorAndDivinded()
        }
        
        
        
    }
    
    
    
    
}





#Preview {
    ThreeDivOneProb()
}
