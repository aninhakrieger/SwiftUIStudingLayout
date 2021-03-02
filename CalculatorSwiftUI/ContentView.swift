//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Ana Krieger WORK on 02/03/21.
//

import SwiftUI

enum CalculatorButton: String {
    
    case zero = "0", one = "1", two = "2",
         three = "3", four = "4", five = "5",
         six = "6", seven = "7", eight = "8",
         nine = "9"
    case equals = "=", plus = "+", minus = "-",
         mutliply = "X", divide = "÷"
    case ac = "AC", plusMinus = "+/-", percent = "%",
         decimal = ","
    
    
    var backgroundColor: Color {
        switch self {
        case .zero,.one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus,.percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}


class GlobalEnviroment: ObservableObject{
    
    @Published var display = ""
    
    func receiveInput(calculatorButton: CalculatorButton)  {
        self.display = calculatorButton.rawValue
    }
}


struct ContentView: View {
    
    
    let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing:12){
            
                HStack{
                    Spacer()
                    Text("21").foregroundColor(.white).font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id:\.self){ row in
                    HStack(spacing: 12){
                        
                        ForEach(row, id:\.self){ button in
                            Button(action: {}, label: {
                                Text(button.rawValue)
                                    .font(.system(size: 32))
                                    .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 5 * 12) / 4)
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(self.buttonWidth(button: button))
                            })
                        }
                        
                    }
                }
                
                
            }.padding(.bottom)
        }
    }
    
    func buttonWidth(button: CalculatorButton) -> CGFloat{
        if button == .zero{
            return (UIScreen.main.bounds.width -  4 * 12) / 4 * 2
        }
        return (UIScreen.main.bounds.width - 5 * 12) / 4
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
