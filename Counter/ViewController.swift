//
//  ViewController.swift
//  Counter
//
//  Created by Mybro on 5/1/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var historyView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    private var counter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счетчика: 0"
        historyView.text = "История изменений: \n"
        historyView.isEditable = false
        historyView.isScrollEnabled = true
    }
    
    
    private func addToHistory(_ message: String)  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date() )
        historyView.text += " \(dateString): \(message)"
        
    }
    
    @IBAction func buttonPlusTap(_ sender: Any) {
        counter += 1
        counterLabel.text = "Значение счетчика: \(counter)"
        addToHistory(" Значение изменено на +1 ")
    }
    
    @IBAction func buttonMinusTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значние счетчика: \(counter)"
            addToHistory("Значение изменено на -1")
        } else {
            addToHistory( " попытка уменьшить значние счетчика ниже 0 ")
        }
    }
    
    @IBAction func resetButtonTap(_ sender: Any) {
        counter = 0
        counterLabel.text = "Значение счетчика: \(counter)"
        addToHistory(" Значение сброшено ")
    }
    
    
    
    
}

