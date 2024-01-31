
import UIKit




class ViewController: UIViewController {


    var firstRow: [CalculatorButtonModel] = []
    var secondRow: [CalculatorButtonModel] = []
    var thirdRow: [CalculatorButtonModel] = []
    var fourthRow: [CalculatorButtonModel] = []
    var fifthRow: [CalculatorButtonModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillButtonArrays()
        createResultView()
    }
    
    var firstSayı: Int?
    var arr: [CalculatorButtonModel] = []
    var buttons: [CalculatorButtonModel] = []

//    let buttonLabels = ["C", "%", "()", "÷"]
////    let buttonLabels1 = ["C", "()", "%", "÷", "1", "2", "3", "x", "4", "5", "6", "+", "7", "8", "9", "-", ".", "0", "000", "="]
//    let buttonLabels2 = ["1", "2", "3", "x"]
//    let buttonLabels3 = ["4", "5", "6", "+"]
//    let buttonLabels4 = ["7", "8", "9", "-"]
//    let buttonLabels5 = ["000", "0", ".", "="]
    
    func fillButtonArrays() {
        let deleteBtn = CalculatorButtonModel(title: "C", type: .delete)
        let moduloBtn = CalculatorButtonModel(title: "%", type: .modulo)
        let backspaceBtn = CalculatorButtonModel(title: "()", type: .backspace)
        let divideBtn = CalculatorButtonModel(title: "/", type: .divide)
        
        let num1 = CalculatorButtonModel(title: "1", type: .number)
        let num2 = CalculatorButtonModel(title: "2", type: .number)
        let num3 = CalculatorButtonModel(title: "3", type: .number)
        let num4 = CalculatorButtonModel(title: "4", type: .number)
        let num5 = CalculatorButtonModel(title: "5", type: .number)
        let num6 = CalculatorButtonModel(title: "6", type: .number)
        let num7 = CalculatorButtonModel(title: "7", type: .number)
        let num8 = CalculatorButtonModel(title: "8", type: .number)
        let num9 = CalculatorButtonModel(title: "9", type: .number)
        let num0 = CalculatorButtonModel(title: "0", type: .number)
        let num000 = CalculatorButtonModel(title: "000", type: .number)
        
        let multiplyBtn = CalculatorButtonModel(title: "*", type: .multiply)
        let sumBtn = CalculatorButtonModel(title: "+", type: .sum)
        let extractBtn = CalculatorButtonModel(title: "-", type: .extract)
        let equalBtn = CalculatorButtonModel(title: "=", type: .equal)
        let pointBtn = CalculatorButtonModel(title: ".", type: .point)
        
        firstRow.append(contentsOf: [deleteBtn, moduloBtn, backspaceBtn, divideBtn])
        secondRow.append(contentsOf: [num1, num2, num3, multiplyBtn])
        thirdRow.append(contentsOf: [num4, num5, num6, sumBtn])
        fourthRow.append(contentsOf: [num7, num8, num9, extractBtn])
        fifthRow.append(contentsOf: [num000, num0, pointBtn, equalBtn])
        
        buttons.append(contentsOf: [num1, num2, num3, num4, num5, num6, num7, num8, num9, num0, num000, multiplyBtn, sumBtn, extractBtn, equalBtn, pointBtn, backspaceBtn, deleteBtn, divideBtn, moduloBtn])
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
        view.addSubview(calculationView)
        
        NSLayoutConstraint.activate([
            calculationView.leadingAnchor.constraint(equalTo: resultView.leadingAnchor),
            calculationView.trailingAnchor.constraint(equalTo: resultView.trailingAnchor),
            calculationView.topAnchor.constraint(equalTo: resultView.bottomAnchor),  // Change here
            calculationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)     // Change here
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
        
        for j in 0..<5 {
            let buttonStackView = createButtonStackView(index: j)
            buttonsContainer.addArrangedSubview(buttonStackView)
        }
        
        return buttonsContainer
    }
    
    func createButtonStackView(index: Int) -> UIStackView {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 20
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        switch index {
        case 0:
            arr = firstRow
        case 1:
            arr = secondRow
        case 2:
            arr = thirdRow
        case 3:
            arr = fourthRow
        case 4:
            arr = fifthRow
        default:
            print("default")
        }
        
        for i in 0..<4 {
            let button = createButton(with: arr[i].title)
            
         
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
      
          
            buttonStackView.addArrangedSubview(button)
        }

        return buttonStackView
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        
        print(title)
        
        let x = buttons.filter{ $0.title == title }.first
        
        if let x {
            if x.type == .number{
                firstSayı = Int(x.title)
            }
        }
        
      }
    
//    func findElementInArray(_ title: String, inArray arr: [CalculatorButtonModel]) -> CalculatorButtonModel? {
//        for _ in arr {
//            if element.title == title {
//                return element
//            } else{
//                return nil
//            }
//        }
//    }


    

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

    func createButton(with title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)

        
        return button
    }
}
