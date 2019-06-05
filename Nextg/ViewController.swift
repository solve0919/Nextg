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
        formlabel.text = ""
        answerlabel.text = ""
//        ロード時の処理
    }
    
    @IBAction func inputformla(_ sender: UIButton) {
// 飛んできた文字を表示させる
        guard let formlatext = formlabel.text else {
            return
        }
//   入力欄にタイトルの文字を文字列で飛ばす
        guard let senderedText = sender.titleLabel?.text else {
            return
        }
//        もともとの数字に送った数字を足す
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
//        let formula: String = formatFormula(formulatext)
//        answerlabel.text = evalFormula(formula)
    }
    
    
}

