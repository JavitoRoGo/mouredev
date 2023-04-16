//
//  HomeViewController.swift
//  MyCalculator
//
//  Created by Javier Rodríguez Gómez on 24/3/21.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    // Los mark son para crear divisiones y navegar más fácil en la barra superior
    
    // Result
    @IBOutlet weak var resultLabel: UILabel!
    
    // Numbers
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    // Operators
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercent: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    @IBOutlet weak var operatorAddition: UIButton!
    @IBOutlet weak var operatorSubstraction: UIButton!
    @IBOutlet weak var operatorMultiplication: UIButton!
    @IBOutlet weak var operatorDivision: UIButton!
    
    // MARK: - Variables
    
    // private var es una variable privada, esto es, solo se puede usar dentro de esta clase, para controlarla mejor y que no pueda usarse fuera de esta clase
    private var total: Double = 0                   // El resultado final
    private var temp: Double = 0                    // Valor por pantalla temporal
    private var operating = false                   // Indicar si se ha seleccionado un operador aritmético
    private var decimal = false                     // Indicar si el valor es decimal
    private var operation: OperationType = .none    // Indica la operación actual
    
    // MARK: - Constants
    
    private let kDecimalSeparator = Locale.current.decimalSeparator! // con esto accedemos al separador decimal del idioma actual del dispositivo. Se añade ! al final para desempaquetarlo y pasarlo de String? a String
    private let kMaxLength = 9 // Indica el número máximo de dígitos del número: 9
    // private let kMaxValue: Double = 9999999999 // Valor máximo. Estas dos líneas pueden borrarse porque se modificó el formateador para establecer el máximo y mínimo número de dígitos
    // private let kMinValue: Double = 0.00000001 // Valor mínimo
    private let kTotal = "total" // esta la vamos a usar para almacenar el total mostrado en pantalla y recuperarlo en caso de que muera la aplicación
    // Esto es nuevo: a las constantes se les suele dar de nombre kNombre, para indicar con la "k" que es una constante
    
    private enum OperationType {        // Así es más fácil saber qué operador se ha pulsado
        case none, addition, substraction, multiplication, division, percent
    }
    
    // MARK: - Formatters
    
    // Formateo de valores auxiliar
    private let auxFormatter: NumberFormatter = {       // creo que esto es un closure, parecido a una función
        let formatter = NumberFormatter()               // se define el formateador
        let locale = Locale.current                     // define el idioma y ajustes locales
        formatter.groupingSeparator = ""                // define el separador de miles, que no se muestra por ser vacío
        formatter.decimalSeparator = locale.decimalSeparator // define el separador decimal como el local
        formatter.numberStyle = .decimal                // estilo de número decimal, que acepte no solo enteros
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    /* Esta función es cosecha propia, y creo que hace los mismo que la declaración anterior auxFormatter (¿closure?)
    func auxFormatterPrueba() -> NumberFormatter {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.usesGroupingSeparator = false
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
    } */
    
    // Formateo de valores auxiliar. Creamos este otro para ver la longitud total del resultado y usar la notación científica
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""     // lo dejamos plano, sin separadores decimales o de miles
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 100    //con estas 3 líneas le decimos que lea y trabaje con números grandes para que pueda contar los dígitos y no pasar a notación científica
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
    }()
    
    // Formateo de valores por pantalla
    
    private let printFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator // ahora sí se muestra el separador, que será el del idioma local
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9      // 9 dígitos no decimales como máximo, igual que definimos más arriba
        formatter.minimumFractionDigits = 0     // puede no haber decimales
        formatter.maximumFractionDigits = 8
        return formatter
    }()
    
    // Formato científico
    
    private let printScientificFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "E"
        return formatter
    }()
    
    
    // MARK: - Initialization
    
    init() {
        super.init(nibName: nil, bundle: nil)
        //esto es para asociar el xib con el controlador
    }
    
    // esto hay que ponerlo porque sí para que no salga error
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init/coder:) has not implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Como se ha definido el separador decimal como el local, vamos a hacer que la vista muestre ese mismo separador en el botón decimal de la vista
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
        // Recuperar el valor total almacenado del uso anterior de la app, en caso de que fallara
        total = UserDefaults.standard.double(forKey: kTotal)
        
        result()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Esta función es otra parte del ciclo de vida de la app o pantalla, desde que se instancia hasta que se dibuja y desaparece; se pone para que los botones salgan también redondos en iPad. Ver vídeo que lo explica bien
        
        // UI
        
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        operatorAC.round()
        operatorPlusMinus.round()
        operatorPercent.round()
        operatorResult.round()
        operatorAddition.round()
        operatorSubstraction.round()
        operatorMultiplication.round()
        operatorDivision.round()
        
    }
    
    // MARK: - Button Actions
    
    @IBAction func operatorACAction(_ sender: UIButton) {
        clear()
        sender.shine()
    }
    
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        sender.shine()
    }
    
    @IBAction func operatorPercentAction(_ sender: UIButton) {
        // lo primero es calcular o terminar cualquier operación previa que hubiera en pantalla
        if operation != .percent {
            result()
        }
        operating = true
        operation = .percent
        result()
        sender.shine()
    }
    
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        sender.shine()
    }
    
    @IBAction func operatorAdditionAction(_ sender: UIButton) {
 
        if operation != .none {
            result()
        }

        operating = true
        operation = .addition
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func operatorSubstractionAction(_ sender: UIButton) {

        if operation != .none {
            result()
        }

        operating = true
        operation = .substraction
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func operatorMultiplicationAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }

        operating = true
        operation = .multiplication
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func operatorDivisionAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .division
        sender.selectOperation(true)
        sender.shine()
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))! // cogemos el valor plano, sin formato
        if !operating && currentTemp.count >= kMaxLength {
            return // si no estamos operando o los dígitos se pasan del máximo haz return, para la ejecución de toda la función
        }
        
        // muestra el propio texto que ya tuvieras (se añade ! para desempaquetarlo y que no sea nil) más el separador decimal que ya estaba definido:
        if !resultLabel.text!.contains(kDecimalSeparator) {
            resultLabel.text = resultLabel.text! + kDecimalSeparator
            decimal = true // cambiamos a true el valor de la var creada para indicar que hay decimales y que no haga nada si volvemos a pulsar este botón
        }
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    @IBAction func numberAction(_ sender: UIButton) {
        operatorAC.setTitle("C", for: .normal)
        
        // se comprueba que no estamos operando y que no se pasa del número máximo de dígitos:
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLength {
            return
        }
        
        // volvemos al formato que sí tiene en cuenta los decimales
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        // Casos que se pueden dar al pulsar los números
        // Hemos seleccionado una operación, esto es, operating (es Bool) es true, hay que almacenar el valor en pantalla en temp:
        if operating {
            total = total == 0 ? temp : total // no idea. Creo que es algo así como "si total=0 pues el nuevo total es temp; en caso contrario es el total, o sea, cero"
            resultLabel.text = ""
            currentTemp = ""
            operating = false // al pulsar los números ya no estamos operando
        }
        
        // Hemos seleccionado decimales
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        // asignando un tag en el inspector de Atributos conseguimos que, con solo una acción y la propiedad .tag que es Int, nos devuelva el valor del botón que pulsamos
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()
        
        sender.shine()
    }
    
    // MARK: - Funciones
    
    // Función para limpiar los valores
    private func clear() {
        operation = .none   // anula cualquier operación pendiente
        // operation es la variable que definimos en Variables y es de tipo enum
        operatorAC.setTitle("AC", for: .normal)
        // a continuación la var temporal la ponemos a 0 con el botón C, y todo a 0 si volvemos a pulsar AC
        if temp != 0 {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()    // fija el total a 0 y calcula el total
        }
    }
    
    // Función para obtener el resultado final
    private func result() {
        
        switch operation {  // break detiene la operación una vez que encuentra el caso correcto. En teoría no haría falta porque cada case es excluyente, por lo que no revisa los demás desde que uno sea válido
        case .none:
            // No hacemos nada
            break
        case .addition:
            total = total + temp
            break
        case .substraction:
            total = total - temp
            break
        case .multiplication:
            total = total * temp
            break
        case .division:
            total = total / temp
            break
        case .percent:
            temp = temp / 100
            total = temp
            break
        }
        
        // Formateo en pantalla
        
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count > kMaxLength {
            // en la fila if se define la constante currentTotal y a la vez se compara
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operation = .none // da por terminada la operación una vez que muestra el resultado
        
        selectVisualOperation()
        
        // Guardado del total en caso de colapso de la app (se explica en otro vídeo)
        UserDefaults.standard.set(total, forKey: kTotal)
        
        print("TOTAL = \(total)") // para verlo también por consola
    }
    
    // Mantener seleccionado el botón de operación pulsado.
    private func selectVisualOperation() {
        if !operating {
            // No estamos operando -> botones apagados
            operatorAddition.selectOperation(false)
            operatorSubstraction.selectOperation(false)
            operatorMultiplication.selectOperation(false)
            operatorDivision.selectOperation(false)
        } else {
            switch operation {
            case .none, .percent:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break // para que se detenga la ejecución una vez que se resuelva. Creo que es para que no compare más valores
            case .addition:
                operatorAddition.selectOperation(true)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .substraction:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(true)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(false)
                break
            case .multiplication:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(true)
                operatorDivision.selectOperation(false)
                break
            case .division:
                operatorAddition.selectOperation(false)
                operatorSubstraction.selectOperation(false)
                operatorMultiplication.selectOperation(false)
                operatorDivision.selectOperation(true)
                break
            }
        }
    }
    
}
