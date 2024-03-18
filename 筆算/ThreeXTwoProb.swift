//
//  ThreeXTwoProb.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/03.
//





import SwiftUI





struct ThreeXTwoProb: View {
    
    
    
    
    @State var isShowAnswer = false
    @State var firstNum  = Int.random(in: 100...999)
    @State var secondNum = Int.random(in: 10...99)
    
    
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            Text("\(firstNum) × \(secondNum)")
                .font(.system(size:160))
                .padding()
            
            
            HStack {
                
                // 問題変更ボタン
                Button {
                    // かけられる数の設定
                    firstNum  = Int.random(in: 100...999)
                    // かける数の設定
                    secondNum = Int.random(in:10...99)
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
                    ThreeXTwoAns(firstNum: $firstNum, secondNum: $secondNum)
                }
                .padding()
                
            }
            .font(.system(size:100))
            
            
        }
        
        
        
    }
    
    
    
    
}





#Preview {
    ThreeXTwoProb()
}
