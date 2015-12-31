//
//  VistaQueso.swift
//  pizzaWatch
//
//  Created by Angel Agustín Martínez on 30/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import WatchKit
import Foundation


class VistaQueso: WKInterfaceController {

    @IBOutlet var pickerView: WKInterfacePicker!
    
    var tamañoElegido : String = ""
    var masaElegida : String = ""
    var quesoElegido : String = ""
    
    var listaQuesos: [(String, String)] = [
        ("Mozarela", "Mozarela"),
        ("Cheddar", "Cheddar"),
        ("Parmesano", "Parmesano"),
        ("Sin queso", "Sin queso")]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! ContextoPizza
        tamañoElegido = c.tamañoPizza
        masaElegida = c.tipoMasa
        
        //NSLog("Tamaño elegido fue: \(c.tamañoPizza)")
        //NSLog("Masa elegida fue: \(c.tipoMasa)")
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = listaQuesos.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerView.setItems(pickerItems)
        pickerView?.setSelectedItemIndex(1)
        quesoElegido = "Cheddar"
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerSelectedItemChanged(value: Int) {
        //NSLog("List Picker: \(listaQuesos[value].0) selected")
        //NSLog("List Picker: \(listaQuesos[value].1) selected")
        quesoElegido = listaQuesos[value].1
    }
    
    @IBAction func mostrarMasa() {
        let valorContexto = ContextoPizza()
        
        valorContexto.estableceTamañoPizza(tamañoElegido)
        valorContexto.estableceTipoMasa(masaElegida)
        valorContexto.estableceTipoQueso(quesoElegido)
        pushControllerWithName("IdentificadorIngredientes", context: valorContexto)
    }
}
