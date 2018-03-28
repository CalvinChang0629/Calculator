//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by calvin.chang on 2018/3/27.
//  Copyright © 2018年 calvin.chang. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonMultiply: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonEquals: UIButton!
    @IBOutlet weak var buttonPoint: UIButton!
    @IBOutlet weak var buttonSymbol: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    var answer:Double=0
    var temp:Double=0
    var inputString = ""
    var operatorSymbol=""
    var isOperator  = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func Calculation(){
        if((operatorSymbol != "") && !isOperator){
            switch operatorSymbol{
            case "+":
                answer = answer + (inputString as NSString).doubleValue
            case "-":
                 answer = answer - (inputString as NSString).doubleValue
            case "*":
                 answer = answer * (inputString as NSString).doubleValue
            case "/":
                 answer = answer / (inputString as NSString).doubleValue
            case "=":
                print("=")
            default:
                print("error")
            }
            
            print("answer=\(answer)")
            if(answer.truncatingRemainder(dividingBy:1.0)>0){
                inputString = "\(answer)"
            }else{
                let s = "\(answer)"
                inputString=(s as NSString).substring(to:s.count-2)
            }
        }else{
            answer = (inputString as NSString).doubleValue
        }
        if(inputString.count>10){
        inputString = (inputString as NSString).substring(to:10)
        }
    }
    
    func pressNumberButton(number:String){
        if((inputString=="0") || isOperator){
            inputString=number
            if(operatorSymbol == "="){
                symbolLabel.text=""
                operatorSymbol=""
            }
            isOperator = false
        }else if(inputString.count<10){
            inputString+=number
        }
    }
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buttonPress(_ sender: UIButton) {
        switch sender{
        case buttonAC:
            answer = 0
            temp = 0
            inputString = "0"
            operatorSymbol = ""
            symbolLabel.text = ""
            isOperator=false
            print("AC")
        case buttonBack:
            if(inputString.contains("-") && inputString.count==2){
                inputString = "0"
            }else if(inputString.count>1){
              inputString=(inputString as NSString).substring(to:inputString.count-1)
            }else{
                inputString = "0"
            }
            print("back")
        case buttonSymbol:
            if(!isOperator){
                if(inputString.contains("-")){
                    inputString = (inputString as NSString).replacingOccurrences(of: "-", with: "")
                }else{
                    inputString = "-" + inputString
                }
            }
        case buttonDivision:
            print("/")
            Calculation()
            operatorSymbol="/"
            isOperator = true
            symbolLabel.text = " ÷ "
        case buttonMultiply:
            print("*")
            Calculation()
            operatorSymbol="*"
            isOperator = true
            symbolLabel.text = " X "
        case buttonPlus:
            print("+")
            Calculation()
            operatorSymbol="+"
            isOperator = true
            symbolLabel.text = " + "
        case buttonMinus:
            print("-")
            Calculation()
            operatorSymbol="-"
            isOperator = true
            symbolLabel.text = " - "
        case buttonEquals:
            print("=")
            Calculation()
            operatorSymbol = "="
            isOperator = true
            symbolLabel.text = "Ans = "
        case buttonPoint:
            print(".")
            if(!inputString.contains(".") && inputString.count<10 && !isOperator){
                inputString+="."
            }
        case button0:
            print("0")
            pressNumberButton(number:"0")
        case button1:
            print("1")
            pressNumberButton(number:"1")
        case button2:
            print("2")
            pressNumberButton(number:"2")
        case button3:
            print("3")
            pressNumberButton(number:"3")
        case button4:
            print("4")
            pressNumberButton(number:"4")
        case button5:
            print("5")
            pressNumberButton(number:"5")
        case button6:
            print("6")
            pressNumberButton(number:"6")
        case button7:
            print("7")
            pressNumberButton(number:"7")
        case button8:
            print("8")
            pressNumberButton(number:"8")
        case button9:
            print("9")
            pressNumberButton(number:"9")
        default:
            print("error")
        }
        
//        let number = (inputString as NSString).floatValue
//        if(number == 0){
//            inputString = "0"
//        }else{
//            inputString = "\(number)"
//        }
        answerLabel.text = inputString
    }
    
}
