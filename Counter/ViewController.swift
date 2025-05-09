//
//  ViewController.swift
//  Counter
//
//  Created by Luca Park on 5/9/25.
//

import UIKit

class ViewController: UIViewController {
    var counterValue: Int = 0 {
        didSet {
            counterLabel.text = "\(counterValue)"
            updateBgColor()
//            updateFontColor()
        }
    }

    @IBOutlet var counterLabel: UILabel!
    @IBAction func increment() {
        if counterValue < 10 {
            counterValue += 1
        }
    }

    @IBAction func decrement() {
        if counterValue > -10 {
            counterValue -= 1
        }
    }

    @IBAction func reset() {
        counterValue = 0
    }

    func updateBgColor() {
        switch counterValue {
        case 1 ... 10:
            let alpha = CGFloat(counterValue)/15
            view.backgroundColor = .red
                .withAlphaComponent(alpha)

        case -10 ... -1:
            let alpha = CGFloat(abs(counterValue))/15
            view.backgroundColor = .blue
                .withAlphaComponent(alpha)

        default:
            view.backgroundColor = .black
            counterLabel.textColor = .white
        }
    }

    func updateFontColor() {
        switch abs(counterValue) {
        case 1 ... 5:
            counterLabel.textColor = .white
        case 6 ... 10:
            counterLabel.textColor = .black
        default:
            counterLabel.textColor = .white
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterValue = 0
    }
}
