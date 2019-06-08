//
//  ViewController.swift
//  Nextg
//
//  Created by 塩田　祐也 on 2019/06/05.
//  Copyright © 2019 塩田　祐也. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var formlabel: UILabel!
    @IBOutlet weak var answerlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//  ロード時の処理
        formlabel.text = ""
        answerlabel.text = ""
    }
    
    @IBAction func inputformla(_ sender: UIButton) {

        // 前回分を表示させる
        guard let formlatext = formlabel.text else {
            return
        }
//   入力欄にタイトルの文字を文字列で飛ばす
        guard let senderedText = sender.titleLabel?.text else {
            return
        }
//     もともとの数字に送った数字を足す
        formlabel.text = formlatext + senderedText
    }
    @IBAction func clearcalculation(_ sender: UIButton) {
//        クリア時の処理
        formlabel.text = ""
        answerlabel.text = ""
    }
    @IBAction func calculateanswer(_ sender: UIButton) {
//        回答の処理
        guard let formlatext = formlabel.text else {
            return
        }
        let formula: String = formatFormula(formlatext)
        answerlabel.text = evalFormula(formula)
    }
}

private func formatFormula(_ formula: String) -> String {
    // 入力された整数には`.0`を追加して小数として評価する
    // また`÷`を`/`に、`×`を`*`に置換する
    let formattedFormula: String = formula.replacingOccurrences(
        of: "(?<=^|[÷×\\+\\-\\(])([0-9]+)(?=[÷×\\+\\-\\)]|$)",
        with: "$1.0",
        options: NSString.CompareOptions.regularExpression,
        range: nil
        ).replacingOccurrences(of: "÷", with: "/").replacingOccurrences(of: "×", with: "*")
    return formattedFormula
}

private func evalFormula(_ formula: String) -> String {
    do {
        // Expressionで文字列の計算式を評価して答えを求める
        let expression = Expression(formula)
        let answer = try expression.evaluate()
        return formatAnswer(String(answer))
    } catch {
        // 計算式が不当だった場合
        return "式を正しく入力してください"
    }
}

private func formatAnswer(_ answer: String) -> String {
    // 答えの小数点以下が`.0`だった場合は、`.0`を削除して答えを整数で表示する
    let formattedAnswer: String = answer.replacingOccurrences(
        of: "\\.0$",
        with: "",
        options: NSString.CompareOptions.regularExpression,
        range: nil)
    return formattedAnswer
}

