//
//  InterfaceController.swift
//  pizzaWatch WatchKit Extension
//
//  Created by Angel Agustín Martínez on 30/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    
    @IBOutlet var pickerView: WKInterfacePicker!
    
    var tamañoElegido : String = ""
    
    var listaTamaños: [(String, String)] = [
        ("Chica", "Chica"),
        ("Mediana", "Mediana"),
        ("Grande", "Grande")]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = listaTamaños.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerView.setItems(pickerItems)
        pickerView?.setSelectedItemIndex(1)
        tamañoElegido = "Mediana"
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerSelectedItemChanged(value: Int) {
        //NSLog("List Picker: \(listaTamaños[value].0) selected")
        //NSLog("List Picker: \(listaTamaños[value].1) selected")
        tamañoElegido = listaTamaños[value].1
    }
    
    @IBAction func mostrarMasa() {
        let valorContexto = ContextoPizza()
        valorContexto.estableceTamañoPizza(tamañoElegido)
        pushControllerWithName("IdentificadorMasa", context: valorContexto)
    }
    
}
