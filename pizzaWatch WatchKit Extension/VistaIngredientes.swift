//
//  VistaIngredientes.swift
//  pizzaWatch
//
//  Created by Angel Agustín Martínez on 30/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import WatchKit
import Foundation


class VistaIngredientes: WKInterfaceController {

    @IBOutlet var pickerView: WKInterfacePicker!
    @IBOutlet var orderButton: WKInterfaceButton!
    
    @IBOutlet var jamon: WKInterfaceSlider!
    @IBOutlet var pepperoni: WKInterfaceSlider!
    @IBOutlet var salchicha: WKInterfaceSlider!
    @IBOutlet var aceituna: WKInterfaceSlider!
    @IBOutlet var cebolla: WKInterfaceSlider!
    @IBOutlet var pimiento: WKInterfaceSlider!
    @IBOutlet var piña: WKInterfaceSlider!
    @IBOutlet var anchoa: WKInterfaceSlider!
    
    var tamañoElegido : String = ""
    var masaElegida : String = ""
    var quesoElegido : String = ""
    var ingredientes : [Int] = [0,0,0,0,0,0,0,0]
    var posicionIngrediente : Int = 1
    
    var listaIngredientes: [(String, Int)] = [
        ("Jamón", 0),
        ("Pepperoni", 1),
        ("Salchicha", 2),
        ("Aceituna", 3),
        ("Cebolla", 4),
        ("Pimiento", 5),
        ("Piña", 6),
        ("Anchoa", 7)]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! ContextoPizza
        tamañoElegido = c.tamañoPizza
        masaElegida = c.tipoMasa
        quesoElegido = c.tipoQueso
        
        //NSLog("Tamaño elegido fue: \(c.tamañoPizza)")
        //NSLog("Masa elegida fue: \(c.tipoMasa)")
        //NSLog("Queso elegido fue: \(c.tipoQueso)")
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = listaIngredientes.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = $0.0
            pickerItem.caption = $0.0
            return pickerItem
        }
        pickerView.setItems(pickerItems)
        pickerView?.setSelectedItemIndex(1)
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func pickerSelectedItemChanged(value: Int) {
        NSLog("List Picker: \(listaIngredientes[value].0) selected")
        NSLog("List Picker: \(listaIngredientes[value].1) selected")
        
        ocultaSliders()
        
        posicionIngrediente = listaIngredientes[value].1
        
        switch posicionIngrediente {
        case 0:
            jamon.setHidden(false)
            break
        case 1:
            pepperoni.setHidden(false)
            break
        case 2:
            salchicha.setHidden(false)
            break
        case 3:
            aceituna.setHidden(false)
            break
        case 4:
            cebolla.setHidden(false)
            break
        case 5:
            pimiento.setHidden(false)
            break
        case 6:
            piña.setHidden(false)
            break
        default:
            anchoa.setHidden(false)
        }

    }
    
    func ocultaSliders() {
        jamon.setHidden(true)
        pepperoni.setHidden(true)
        salchicha.setHidden(true)
        aceituna.setHidden(true)
        cebolla.setHidden(true)
        pimiento.setHidden(true)
        piña.setHidden(true)
        anchoa.setHidden(true)
    }
    
    @IBAction func agregarIngrediente(value: Float) {
        var flagShowOrderButton = 0
        
        if(value == 0.0) {
            ingredientes[posicionIngrediente] = 0
        } else {
            ingredientes[posicionIngrediente] = 1
        }
        
        for ingrediente in ingredientes {
            if (ingrediente == 1) {
                flagShowOrderButton = 1
                break
            }
        }
        
        if(flagShowOrderButton == 1) {
            orderButton.setHidden(false)
        }else {
            orderButton.setHidden(true)
        }
    }
    
    @IBAction func ordenar() {
        var numeroIngredientes = 0
        
        for ingrediente in ingredientes {
            if (ingrediente == 1) {
                numeroIngredientes++
            }
        }
        
        //NSLog("Numero de ingredientes: \(numeroIngredientes)")
        
        if(numeroIngredientes > 0 && numeroIngredientes < 6) {
        
            let cancel = WKAlertAction(title: "No", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            
            })
        
            let action = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Default, handler: { () -> Void in
                self.popToRootController()
            })
        
            var orden = "Pizza \(tamañoElegido), \(masaElegida),"
            if(quesoElegido != "Sin queso") {
                orden += " con queso"
            }
            orden += " \(quesoElegido)"
            

            if(ingredientes[0] == 1) {
                orden += ", Jamón"
            }
            if(ingredientes[1] == 1) {
                orden += ", Pepperoni"
            }
            if(ingredientes[2] == 1) {
                orden += ", Salchicha"
            }
            if(ingredientes[3] == 1) {
                orden += ", Aceituna"
            }
            if(ingredientes[4] == 1) {
                orden += ", Cebolla"
            }
            if(ingredientes[5] == 1) {
                orden += ", Pimiento"
            }
            if(ingredientes[6] == 1) {
                orden += ", Piña"
            }
            if(ingredientes[7] == 1) {
                orden += ", Anchoa"
            }

            orden += "."
            self.presentAlertControllerWithTitle("Orden", message: orden, preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])
        } else {
            let cancel = WKAlertAction(title: "Ok", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
                
            })
            
            self.presentAlertControllerWithTitle("Ouch!!", message: "Sólo debe elegir entre 1 y 5 ingredientes", preferredStyle: WKAlertControllerStyle.Alert, actions: [cancel])
        }
    }
    
}
