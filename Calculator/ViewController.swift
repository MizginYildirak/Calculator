import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createResultView()
    }
    
    func createResultView() {
        let resultView = createView(withColor: UIColor(red: 219/255, green: 228/255, blue: 235/255, alpha: 255/255))
        self.view.addSubview(resultView)
        
        NSLayoutConstraint.activate([
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            resultView.topAnchor.constraint(equalTo: view.topAnchor),
            resultView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        let calculatorLabel = createLabel(withText: "Calculator")
        resultView.addSubview(calculatorLabel)
        
        NSLayoutConstraint.activate([
            calculatorLabel.centerXAnchor.constraint(equalTo: resultView.centerXAnchor),
            calculatorLabel.centerYAnchor.constraint(equalTo: resultView.topAnchor, constant: 100)
        ])
        
        let textfieldStackView = createTextfieldStackView()
        resultView.addSubview(textfieldStackView)
        
        NSLayoutConstraint.activate([
            textfieldStackView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor, constant: -20),
            textfieldStackView.bottomAnchor.constraint(equalTo: resultView.bottomAnchor, constant: -40)
        ])
        
        createCalculationView(resultView)
    }

    func createTextfieldStackView() -> UIStackView {
        let calculationLabel = createLabel(withText: "sa", fontSize: 17, alignment: .right)
        let calculatorTextField = createTextField(withPlaceholder: "Enter text", fontSize: 26, height: 60, alignment: .right)
        
        let textfieldStackView = UIStackView(arrangedSubviews: [calculationLabel, calculatorTextField])
        textfieldStackView.spacing = 5
        textfieldStackView.axis = .vertical
        textfieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return textfieldStackView
    }

    func createCalculationView(_ resultView: UIView) {
        let calculationView = createView(withColor: UIColor(red: 234/255, green: 238/255, blue: 243/255, alpha: 255/255))
        resultView.addSubview(calculationView)
        
        NSLayoutConstraint.activate([
            calculationView.leadingAnchor.constraint(equalTo: resultView.leadingAnchor),
            calculationView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor),
            calculationView.topAnchor.constraint(equalTo: resultView.bottomAnchor),
            calculationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let buttonsContainer = createButtonsContainer()
        calculationView.addSubview(buttonsContainer)
        
        NSLayoutConstraint.activate([
            buttonsContainer.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 20),
            buttonsContainer.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),
            buttonsContainer.topAnchor.constraint(equalTo: calculationView.topAnchor, constant: 20),
            buttonsContainer.bottomAnchor.constraint(equalTo: calculationView.bottomAnchor, constant: -20)
        ])
    }

    func createButtonsContainer() -> UIStackView {
        let buttonsContainer = UIStackView()
        buttonsContainer.axis = .vertical
        buttonsContainer.spacing = 20
        buttonsContainer.distribution = .fillEqually
        buttonsContainer.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<5 {
            let buttonStackView = createButtonStackView()
            buttonsContainer.addArrangedSubview(buttonStackView)
        }
        
        return buttonsContainer
    }

    func createButtonStackView() -> UIStackView {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for _ in 0..<4 {
            let button = createButton()
            buttonStackView.addArrangedSubview(button)
        }
        
        return buttonStackView
    }

    // Utility Functions

    func createView(withColor color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    func createLabel(withText text: String, fontSize: CGFloat = 17, alignment: NSTextAlignment = .left) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func createTextField(withPlaceholder placeholder: String, fontSize: CGFloat = 17, height: CGFloat, alignment: NSTextAlignment = .left) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.font = UIFont.systemFont(ofSize: fontSize)
        textField.textAlignment = alignment
        textField.heightAnchor.constraint(equalToConstant: height).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }

    func createButton() -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
}
