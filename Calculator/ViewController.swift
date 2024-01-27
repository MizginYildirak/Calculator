//
//  ViewController.swift
//  Calculator
//
//  Created by MİZGİN YILDIRAK on 26.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createResultView()
    }
    
    func createResultView() {
        let resultView = UIView()
        resultView.backgroundColor = UIColor(red: 219/255, green: 228/255, blue: 235/255, alpha: 255/255)
        self.view.addSubview(resultView)
        
        resultView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        
        
        // Modüler yap
        
        let calculatorLabel = UILabel()
        calculatorLabel.text = "Calculator"
        
        resultView.addSubview(calculatorLabel)
        
        calculatorLabel.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                calculatorLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
                calculatorLabel.centerYAnchor.constraint(equalTo: resultView.topAnchor, constant: 100)
               ])
        
        
        
        // Modüler yap
        
        let calculationLabel = UILabel()
    
        calculationLabel.text = "sa"
        calculationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        calculationLabel.font = UIFont.systemFont(ofSize: 17)
        calculationLabel.textAlignment = .right
        
        let calculatorTextField = UITextField()
        calculatorTextField.placeholder = "Enter text"
        calculatorTextField.textAlignment = .right
   
        calculatorTextField.font = UIFont.systemFont(ofSize: 26)
        calculatorTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true // Adjust the height here

        
        let textfieldStackView = UIStackView(arrangedSubviews: [calculationLabel, calculatorTextField])
        resultView.addSubview(textfieldStackView)
        textfieldStackView.spacing = 5
        textfieldStackView.axis = .vertical

        
        textfieldStackView.translatesAutoresizingMaskIntoConstraints = false
               NSLayoutConstraint.activate([
                textfieldStackView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -20),
                textfieldStackView.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -40)
               ])
        
               createCalculationView(resultView)
    }

    func createCalculationView(_ resultView: UIView) {
        let calculationView = UIView()
        calculationView.backgroundColor = UIColor(red: 234/255, green: 238/255, blue: 243/255, alpha: 255/255)
        resultView.addSubview(calculationView)
        
        calculationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculationView.leadingAnchor.constraint(equalTo: resultView.leadingAnchor),
            calculationView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor),
            calculationView.topAnchor.constraint(equalTo: resultView.bottomAnchor),
            calculationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let buttonsContainer = UIStackView()
        buttonsContainer.axis = .vertical
        buttonsContainer.spacing = 20
        buttonsContainer.distribution = .fillEqually
        calculationView.addSubview(buttonsContainer)
        
        for stackIndex in 0..<5 {
            let buttonCount = 4
            let buttonWidth: CGFloat = 50
            let buttonHeight: CGFloat = 30
            let spacing: CGFloat = 20
            
            let buttonStackView = UIStackView()
            buttonStackView.axis = .horizontal
            buttonStackView.distribution = .fillEqually
            buttonStackView.spacing = spacing
            
            for buttonIndex in 0..<buttonCount {
                let button = UIButton(type: .system)
                button.backgroundColor = .black
                
                buttonStackView.addArrangedSubview(button)
                button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
                button.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
            }
            
            buttonsContainer.addArrangedSubview(buttonStackView)
        }
        
        buttonsContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsContainer.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 20),
            buttonsContainer.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),
            buttonsContainer.topAnchor.constraint(equalTo: calculationView.topAnchor, constant: 20),
            buttonsContainer.bottomAnchor.constraint(equalTo: calculationView.bottomAnchor, constant: -20)
        ])
    }
}
