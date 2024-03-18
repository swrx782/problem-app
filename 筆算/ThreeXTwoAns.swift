//
//  ThreeXTwoAns.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/04.
//

import SwiftUI

struct ThreeXTwoAns: View {
    
    
    
    
    @Binding var firstNum: Int
    @Binding var secondNum: Int
    
    
    
    
    var body: some View {
        
        
        
        let  firstNumStr = String( firstNum)
        let secondNumStr = String(secondNum)
        
        let numStrWidth = CGFloat(60)
        let dotStrWidth = CGFloat(20)
        let strHeight   = CGFloat(100)
        let fontSize    = CGFloat(100)
        
        // 界線の設定
        let boundaryLineW = CGFloat(560)        // 一旦 numStrWidth*個数 + (10+dotStrWidth+10)*個数 で計算
        let boundaryLineH = CGFloat(8)
        
        let fgColoer = Color.clear      // 数字、ドットの背景部分の色
        
        // 数字、ドットの背景部分
        let numBG = Rectangle()
            .foregroundColor(fgColoer)
            .frame(width: numStrWidth, height: strHeight)
        let dotBG = Rectangle()
            .foregroundColor(fgColoer)
            .frame(width: dotStrWidth, height: strHeight)
        
        // 空のテキスト" "と背景を組み合わせたブロック
        // 型はZStack<TupleView<(ModifiedContent<ModifiedContent<Rectangle, _EnvironmentKeyWritingModifier<Optional<Color>>>, _FrameLayout>, Text)>>らしい
        let noNumBlock =
            ZStack {
                numBG
                Text(" ")
            }
        let noDotBlock =
            ZStack {
                dotBG
                Text(" ")
            }
        
        
        
        
        VStack{
            
            
            // 1行目(かけられる数)
            HStack {
                
                let zero = firstNumStr.startIndex
                
                noNumBlock
                
                noDotBlock
                
                noNumBlock
                
                noDotBlock
                
                noNumBlock
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = firstNumStr.index(zero, offsetBy: 0)
                    Text(firstNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = firstNumStr.index(zero, offsetBy: 1)
                    Text(firstNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = firstNumStr.index(zero, offsetBy: 2)
                    Text(firstNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
            // 2行目(かける数)
            HStack {
                
                let zero = secondNumStr.startIndex
                
                noNumBlock
                
                noDotBlock
                
                noNumBlock
                
                noDotBlock
                
                ZStack {
                    numBG
                    Text("×")
                }
                
                noDotBlock
                
                noNumBlock
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = secondNumStr.index(zero, offsetBy: 0)
                    Text(secondNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = secondNumStr.index(zero, offsetBy: 1)
                    Text(secondNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
            Rectangle().frame(width:boundaryLineW, height:boundaryLineH)
            
            
            // 3行目((かけられる数)*(かける数の1の位)の計算)
            HStack {
                
                let numStr = String(firstNum * (secondNum % 10))
                let organizedNumStr = String(repeating:" ", count: 4 - numStr.count) + numStr
                let zero = organizedNumStr.startIndex
                
                noNumBlock
                
                noDotBlock
                
                noNumBlock
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 0)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 1)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 2)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 3)
                    Text(organizedNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
            // 4行目((かけられる数)*(かける数の10の位)の計算)
            HStack {
                
                let numStr = String(firstNum * ((secondNum / 10) % 10))
                let organizedNumStr = String(repeating:" ", count: 4 - numStr.count) + numStr
                let zero = organizedNumStr.startIndex
                
                ZStack {
                    numBG
                    Text("+")
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 0)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 1)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 2)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 3)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                noNumBlock
                
            }.font(.system(size:fontSize))
            
            
            Rectangle().frame(width:boundaryLineW, height:boundaryLineH)
            
            
            // 5行目(答えの部分)
            HStack {
                
                let numStr = String(firstNum * secondNum)
                let organizedNumStr = String(repeating:" ", count: 5 - numStr.count) + numStr
                let zero = organizedNumStr.startIndex
                
                noNumBlock
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 0)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 1)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 2)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 3)
                    Text(organizedNumStr[index...index])
                }
                
                noDotBlock
                
                ZStack {
                    numBG
                    let index = organizedNumStr.index(zero, offsetBy: 4)
                    Text(organizedNumStr[index...index])
                }
                
            }.font(.system(size:fontSize))
            
            
        }
    }
}

//#Preview {
//    ThreeXTwoAns()
//}
