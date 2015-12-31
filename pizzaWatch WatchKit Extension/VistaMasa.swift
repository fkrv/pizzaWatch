//
//  VistaMasa.swift
//  pizzaWatch
//
//  Created by Angel Agustín Martínez on 30/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import WatchKit
import Foundation


class VistaMasa: WKInterfaceController {

    @IBOutlet var pickerView: WKInterfacePicker!
    
    var tamañoElegido : String = ""
    var masaElegida : String = ""
    
    var listaMasas: [(String, String)] = [
        ("Delgada", "Delgada"),
        ("Crujiente", "Crujiente"),
        ("Gruesa", "Gruesa")]
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! ContextoPizza
        tamañoElegido = c.tamañoPizza
        //NSLog("Tamaño elegido fue: \(c.tamañoPizza)")
        
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = listaMasas.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerView.setItems(pickerItems)
        pickerView?.setSelectedItemIndex(1)
        masaElegida = "Crujiente"
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerSelectedItemChanged(value: Int) {
        //NSLog("List Picker: \(listaMasas[value].0) selected")
        //NSLog("List Picker: \(listaMasas[value].1) selected")
        masaElegida = listaMasas[value].1
    }
    
    @IBAction func mostrarQueso() {
        let valorContexto = ContextoPizza()
        
        valorContexto.estableceTamañoPizza(tamañoElegido)
        valorContexto.estableceTipoMasa(masaElegida)
        pushControllerWithName("IdentificadorQueso", context: valorContexto)
    }
}
