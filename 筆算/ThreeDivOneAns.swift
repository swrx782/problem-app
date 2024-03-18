//
//  ThreeDivOneAns.swift
//  筆算
//
//  Created by 和田翔太 on 2024/01/29.
//

import SwiftUI

/*
struct myInt: Identifiable {
    var id = UUID()
    var v : Int
}

struct intArray: Identifiable {
    var id = UUID()
    var index : Int
    var array : [myInt]
}
 */

struct ThreeDivOneAns: View {
    
    
    
    // 割る数と割られる数
    /*
    @Binding var dividend : Int
    @Binding var divisor  : Int
     */
    
    // テスト用
    
    @State var dividend = 730
    @State var divisor  = 3
    
    
    func f() -> Int {
        print("f()開始")
        return 0
    }
    
    
    
    // 計算履歴配列を作成する
    // 各要素は[割られる数, 掛け算の結果]
    // 例)divisor=3, dividend=976 => 計算履歴配列 = [[N/A, 9], [7, 6], [16, 15]]
    // func makeCalcHistory(dividend: Int, divisor: Int) ->  [intArray] {
    func makeCalcHistory(dividend: Int, divisor: Int) ->  [[Int]] {
        // print("x")
        
        // 割られる数の桁数
        var calcHistory   : [[Int]] = [[-1]]
        let dividendArray : [Int] = Array(String(dividend)).map{Int(String($0))!}
        var nowDividend = 0
        var dividendArrayNextIndex = 0
        
        // 最初の計算と残りの計算の違いは商が0の時に掛け算の結果をすっ飛ばさないかどうかなので、
        // 残りの計算においてすっ飛ばすことを許容するのであれば統合できる
        
        // 最初の計算(今の割られる数=割られる数の最初の数桁)
        // どこの桁までを今の割られる数と見るか探す
        while dividendArrayNextIndex < dividendArray.count {
            nowDividend = nowDividend * 10 + dividendArray[dividendArrayNextIndex]
            dividendArrayNextIndex += 1
            if divisor <= nowDividend {break}
        }
        // 掛け算の結果を計算履歴に追加
        // calcHistory[0].array.append(myInt(v: (nowDividend / divisor) * divisor))
        calcHistory[0].append((nowDividend / divisor) * divisor)
        // 余りの計算
        nowDividend = nowDividend % divisor
        
        // 残りの計算
        while dividendArrayNextIndex < dividendArray.count {
            nowDividend = nowDividend * 10 + dividendArray[dividendArrayNextIndex]
            /*
            calcHistory.append(intArray(index: dividendArrayNextIndex,
                                        array: [myInt(v: nowDividend),
                                                myInt(v: (nowDividend / divisor) * divisor)]))
             */
            calcHistory.append([nowDividend,
                                (nowDividend / divisor) * divisor])
            nowDividend = nowDividend % divisor
            dividendArrayNextIndex += 1
        }
    
        return calcHistory
        
    }
    
    
    
    // 商と余りを求めて答えの文字列を返す
    func ansStr(divisor: Int, dividend: Int) -> String {
        let quotient = dividend / divisor
        let reminder = dividend % divisor
        return String(quotient) + ((reminder == 0) ?  "" : "•••"+String(reminder))
    }
    
    
    // 数字、後ろにつける空白の数、全体の長さを受け取って前の空白を補完しつつ文字列配列を作成する
    // 例)29, 5, 1 -> [" ", " ", "2", "9", " "]
    func formatted(n: Int, overallLen : Int, backLen : Int) -> [String] {
        let strN = String(n)
        let frontLen = overallLen - backLen - strN.count
        let frontArray = Array(repeating: " ", count: frontLen)
        let backArray  = Array(repeating: " ", count: backLen)
        return frontArray + Array(strN).map{String($0)} + backArray
    }
    
    
    
    var body: some View {
        
        // 答えと筆算のサイズは個別に指定
        // let fontSize    = CGFloat(170)
        // 計算履歴配列部分
        let calcHistory = makeCalcHistory(dividend: dividend, divisor: divisor)
        
        /*
        let x = [intArray(array: [-1, 6]),
                 intArray(array: [13, 12]),
                 intArray(array: [10, 9])]
         */
        
        
        
        
        
        
        
        VStack {
            
            
            
            // 答え部分
            Text(ansStr(divisor: divisor, dividend: dividend))
                .font(.system(size:100)).padding().padding()
            
            
            
            // 筆算部分
            
            VStack {
                
                
                // 定数定義
                
                // 界線の設定(空白が8.5....ぐらい？)
                // let boundaryLineW = CGFloat(330)        // 一旦 numStrWidth*個数 + (10+dotStrWidth+10)*個数 で計算
                let boundaryLineH = CGFloat(4)
                
                let numStrWidth = CGFloat(50)
                let dotStrWidth = CGFloat(15)
                let strHeight   = CGFloat(50)
                let strFontSize = CGFloat(50)
                
                let fgColoer = Color.clear // 数字、ドットの背景部分の色
                
                // 数字、ドットの背景部分
                let numBG = Rectangle()
                    .foregroundColor(fgColoer)
                    .frame(width: numStrWidth, height: strHeight)
                let dotBG = Rectangle()
                    .foregroundColor(fgColoer)
                    .frame(width: dotStrWidth, height: strHeight)
                
                
                // 商
                HStack {
                    let n = dividend / divisor
                    let backLen = 0
                    let formattedN = formatted(n: n, overallLen: 4, backLen: backLen)
                    // ForEach(formattedN, id: \.self) { s in
                    //     ZStack {
                    //         numBG
                    //         Text(s).font(.system(size:strFontSize))
                    //     }
                    //     ZStack {
                    //         dotBG
                    //         Text(" ").font(.system(size:strFontSize))
                    //    }
                    // }
                    ZStack {
                        numBG
                        Text(formattedN[0]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[1]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[2]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[3]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                }
                
                // 界線
                HStack(spacing: 0) {
                    Rectangle().frame(width:60, height:boundaryLineH)
                        .foregroundColor(.clear)
                    Rectangle().frame(width:240, height:boundaryLineH)
                    
                }
                
                // 割る数/割られる数
                HStack {
                    // let n: Int = Int(String(divisor) + String(dividend))!
                    let n: Int = dividend
                    let backLen = 0
                    let formattedN = formatted(n: n, overallLen: 3, backLen: backLen)
                    ZStack {
                        numBG
                        Text(String(divisor)).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Rectangle().frame(width:4, height:50)
                    }
                    // ForEach(formattedN, id: \.self) { s in
                    //     ZStack {
                    //         numBG
                    //         Text(s).font(.system(size:strFontSize))
                    //     }
                    //     ZStack {
                    //         dotBG
                    //         Text(" ")
                    //     }
                    // }
                    ZStack {
                        numBG
                        Text(formattedN[0]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[1]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[2]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    
                }
                
                // 計算履歴
                ForEach(calcHistory.indices, id: \.self) { index in
                    // 今の割られる数
                    if calcHistory[index][0] != -1 {
                        HStack {
                            let n = calcHistory[index][0]
                            let backLen = calcHistory.count-index-1
                            let formattedN = formatted(n: n, overallLen: 4, backLen: backLen)
                            // ForEach(formattedN, id: \.self) { s in
                            //     ZStack {
                            //         numBG
                            //         Text(s).font(.system(size:strFontSize))
                            //     }
                            //     ZStack {
                            //         dotBG
                            //         Text(" ")
                            //     }
                            // }
                            
                            ZStack {
                                numBG
                                Text(formattedN[0]).font(.system(size:strFontSize))
                            }
                            ZStack {
                                dotBG
                                Text(" ").font(.system(size:strFontSize))
                            }
                            ZStack {
                                numBG
                                Text(formattedN[1]).font(.system(size:strFontSize))
                            }
                            ZStack {
                                dotBG
                                Text(" ").font(.system(size:strFontSize))
                            }
                            ZStack {
                                numBG
                                Text(formattedN[2]).font(.system(size:strFontSize))
                            }
                            ZStack {
                                dotBG
                                Text(" ").font(.system(size:strFontSize))
                            }
                            ZStack {
                                numBG
                                Text(formattedN[3]).font(.system(size:strFontSize))
                            }
                            ZStack {
                                dotBG
                                Text(" ").font(.system(size:strFontSize))
                            }
                        }
                    }
                    // 今の掛け算の結果
                    HStack {
                        let n = calcHistory[index][1]
                        let backLen = calcHistory.count-index-1
                        let formattedN = formatted(n: n, overallLen: 4, backLen: backLen)
                        // ForEach(formattedN, id: \.self) { s in
                        //     ZStack {
                        //         numBG
                        //         Text(s).font(.system(size:strFontSize))
                        //     }
                        //     ZStack {
                        //         dotBG
                        //         Text(" ")
                        //     }
                        // }
                        ZStack {
                            numBG
                            Text(formattedN[0]).font(.system(size:strFontSize))
                        }
                        ZStack {
                            dotBG
                            Text(" ").font(.system(size:strFontSize))
                        }
                        ZStack {
                            numBG
                            Text(formattedN[1]).font(.system(size:strFontSize))
                        }
                        ZStack {
                            dotBG
                            Text(" ").font(.system(size:strFontSize))
                        }
                        ZStack {
                            numBG
                            Text(formattedN[2]).font(.system(size:strFontSize))
                        }
                        ZStack {
                            dotBG
                            Text(" ").font(.system(size:strFontSize))
                        }
                        ZStack {
                            numBG
                            Text(formattedN[3]).font(.system(size:strFontSize))
                        }
                        ZStack {
                            dotBG
                            Text(" ").font(.system(size:strFontSize))
                        }
                    }
                    // 界線
                    HStack(spacing: 0) {
                        Rectangle().frame(width:60, height:boundaryLineH)
                            .foregroundColor(.clear)
                        Rectangle().frame(width:240, height:boundaryLineH)
                        
                    }
                }
                
                // 余り
                HStack {
                    let n = dividend % divisor
                    let backLen = 0
                    let formattedN = formatted(n: n, overallLen: 4, backLen: backLen)
                    // ForEach(formattedN, id: \.self) { s in
                    //     ZStack {
                    //         numBG
                    //         Text(s).font(.system(size:strFontSize))
                    //     }
                    //     ZStack {
                    //         dotBG
                    //         Text(" ")
                    //     }
                    // }
                    ZStack {
                        numBG
                        Text(formattedN[0]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[1]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[2]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                    ZStack {
                        numBG
                        Text(formattedN[3]).font(.system(size:strFontSize))
                    }
                    ZStack {
                        dotBG
                        Text(" ").font(.system(size:strFontSize))
                    }
                }
                
            }
            
            
        }.onAppear {
            
            // 計算履歴配列が正しいかの確認
            print(calcHistory)
            
        }
        
        
    }
    
    
    
}




 #Preview {
 ThreeDivOneAns()
 }
 
