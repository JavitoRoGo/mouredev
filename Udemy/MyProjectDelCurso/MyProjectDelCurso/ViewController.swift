//
//  ViewController.swift
//  MyProjectDelCurso
//
//  Created by Javier Rodríguez Gómez on 19/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // Outles
    
    @IBOutlet var myButton: UIButton!
    @IBOutlet var myPickerView: UIPickerView!
    @IBOutlet var myPageControl: UIPageControl!
    @IBOutlet var mySegmentedControl: UISegmentedControl!
    @IBOutlet var mySlider: UISlider!
    @IBOutlet var myStepper: UIStepper!
    @IBOutlet var mySwitch: UISwitch!
    @IBOutlet var myProgressView: UIProgressView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var myStepperLabel: UILabel!
    @IBOutlet var mySwitchLabel: UILabel!
    @IBOutlet var myTextField: UITextField!
    @IBOutlet var myTextView: UITextView!
    
    // Variables
    
    private let myPickerViewValues = ["Uno", "Dos", "Tres", "Cuatro", "Cinco"]
    
    // UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton.setTitle("Mi botón", for: .normal)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
        myPageControl.isHidden = true
        
        mySegmentedControl.removeAllSegments() //siempre se crea con dos
        for (index, value) in myPickerViewValues.enumerated() {
            mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
        }
        mySegmentedControl.isHidden = true
        
        mySlider.minimumTrackTintColor = .red
        mySlider.minimumValue = 1
        mySlider.maximumValue = Float(myPickerViewValues.count)
        mySlider.value = 1
        mySlider.isHidden = true
        
        myStepper.minimumValue = 1
        myStepper.maximumValue = Double(myPickerViewValues.count)
        myStepper.isHidden = true
        
        mySwitch.onTintColor = .purple
        mySwitch.isOn = false
        
        myProgressView.progress = 0
        myProgressView.isHidden = true
        
        myActivityIndicator.color = .orange
        myActivityIndicator.startAnimating()
        myActivityIndicator.hidesWhenStopped = true
        
        myStepperLabel.textColor = .darkGray
        myStepperLabel.font = UIFont.boldSystemFont(ofSize: 36)
        myStepperLabel.text = "1"
        myStepperLabel.isHidden = true
        
        mySwitchLabel.text = "Está apagado"
        
        myTextField.textColor = .brown
        myTextField.placeholder = "Escribe algo"
        myTextField.delegate = self
        
        myTextView.textColor = .brown
        //myTextView.isEditable = false //se usa para que podamos leer pero no escribir
        myTextView.delegate = self
    }
    
    // Actions

    @IBAction func myButtonAction(_ sender: Any) {
        if myButton.backgroundColor == .blue {
            myButton.backgroundColor = .green
        } else {
            myButton.backgroundColor = .blue
        }
        
        myTextView.resignFirstResponder()
        //cierra el teclado del textView al pulsar el botón
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        let value = myPageControl.currentPage
        myPickerView.selectRow(value, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[value]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = value
        
        mySlider.value = Float(value + 1)
        
        myStepper.value = Double(value + 1)
        
        myProgressView.progress = Float(value+1) / 5.0
        
        myStepperLabel.text = "\(value + 1)"
    }
    
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        let value = mySegmentedControl.selectedSegmentIndex
        
        let myString = myPickerViewValues[value]
        myButton.setTitle(myString, for: .normal)
        
        myPickerView.selectRow(value, inComponent: 0, animated: true)
        
        myPageControl.currentPage = value
        
        mySlider.value = Float(value + 1)
        
        myStepper.value = Double(value + 1)
        
        myProgressView.progress = Float(value+1) / 5.0
        
        myStepperLabel.text = "\(value + 1)"
    }
    
    @IBAction func mySliderAction(_ sender: Any) {
        var progress: Float = 0 //se define para la progressView, que toma valores entre 0 y 1
        var text = ""
        switch mySlider.value {
        case 1..<2: //se pone así porque el valor es un float
            myButton.setTitle(myPickerViewValues[0], for: .normal)
            myPickerView.selectRow(0, inComponent: 0, animated: true)
            myPageControl.currentPage = 0
            mySegmentedControl.selectedSegmentIndex = 0
            myStepper.value = 1
            progress = 0.2
            text = "1"
        case 2..<3:
            myButton.setTitle(myPickerViewValues[1], for: .normal)
            myPickerView.selectRow(1, inComponent: 0, animated: true)
            myPageControl.currentPage = 1
            mySegmentedControl.selectedSegmentIndex = 1
            myStepper.value = 2
            progress = 0.4
            text = "2"
        case 3..<4:
            myButton.setTitle(myPickerViewValues[2], for: .normal)
            myPickerView.selectRow(2, inComponent: 0, animated: true)
            myPageControl.currentPage = 2
            mySegmentedControl.selectedSegmentIndex = 2
            myStepper.value = 3
            progress = 0.6
            text = "3"
        case 4..<5:
            myButton.setTitle(myPickerViewValues[3], for: .normal)
            myPickerView.selectRow(3, inComponent: 0, animated: true)
            myPageControl.currentPage = 3
            mySegmentedControl.selectedSegmentIndex = 3
            myStepper.value = 4
            progress = 0.8
            text = "4"
        default:
            myButton.setTitle(myPickerViewValues[4], for: .normal)
            myPickerView.selectRow(4, inComponent: 0, animated: true)
            myPageControl.currentPage = 4
            mySegmentedControl.selectedSegmentIndex = 4
            myStepper.value = 5
            progress = 1
            text = "5"
        }
        
        myProgressView.progress = progress
        
        myStepperLabel.text = text
    }
    
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        myButton.setTitle(myPickerViewValues[Int(value - 1)], for: .normal)
        myPickerView.selectRow(Int(value - 1), inComponent: 0, animated: true)
        myPageControl.currentPage = Int(value - 1)
        mySegmentedControl.selectedSegmentIndex = Int(value - 1)
        mySlider.value = Float(value)
        
        myProgressView.progress = Float(value) / 5.0
        
        myStepperLabel.text = "\(value)"
    }
    
    @IBAction func mySwitchAction(_ sender: Any) {
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myPageControl.isHidden = false
            mySegmentedControl.isHidden = false
            mySlider.isHidden = false
            myStepper.isHidden = false
            myStepperLabel.isHidden = false
            myProgressView.isHidden = false
            myActivityIndicator.stopAnimating()
            
            mySwitchLabel.text = "Está encendido"
        }
        else {
            myPickerView.isHidden = true
            myPickerView.isHidden = true
            myPageControl.isHidden = true
            mySegmentedControl.isHidden = true
            mySlider.isHidden = true
            myStepper.isHidden = true
            myStepperLabel.isHidden = true
            myProgressView.isHidden = true
            myActivityIndicator.startAnimating()
            
            mySwitchLabel.text = "Está apagado"
        }
    }
    
}



// Para no cargar el código del ViewController se puede poner el código del picker en una extensión
extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    // Notificar la línea seleccionada
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
        
        mySlider.value = Float(row + 1)
        
        myStepper.value = Double(row + 1)
        
        myProgressView.progress = Float(row+1) / 5.0
        
        myStepperLabel.text = "\(row + 1)"
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        //para que desaparezca el teclado al pulsar intro
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        myButton.setTitle(myTextField.text, for: .normal)
        //poner lo escrito en el botón
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        myTextField.isHidden = true
        //hace esto al empezar la edición
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        myTextField.isHidden = false
        //esto lo hace al terminar la edición
    }
}
