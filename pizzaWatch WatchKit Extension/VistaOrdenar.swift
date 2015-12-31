//
//  VistaOrdenar.swift
//  pizzaWatch
//
//  Created by Angel Agustín Martínez on 30/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import WatchKit
import Foundation


class VistaOrdenar: WKInterfaceController {

    var tamañoElegido : String = ""
    var masaElegida : String = ""
    var quesoElegido : String = ""
    
    @IBOutlet var lblTamañoElegido: WKInterfaceLabel!
    @IBOutlet var lblMasaElegida: WKInterfaceLabel!
    @IBOutlet var lblQuesoElegido: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        let c = context as! ContextoPizza
        tamañoElegido = c.tamañoPizza
        masaElegida = c.tipoMasa
        quesoElegido = c.tipoQueso
        
        NSLog("Tamaño elegido fue: \(c.tamañoPizza)")
        NSLog("Masa elegida fue: \(c.tipoMasa)")
        NSLog("Queso elegido fue: \(c.tipoQueso)")
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        lblTamañoElegido.setText(tamañoElegido)
        lblMasaElegida.setText(masaElegida)
        lblQuesoElegido.setText(quesoElegido)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func confirmar() {
        let cancel = WKAlertAction(title: "Cancel", style: WKAlertActionStyle.Cancel, handler: { () -> Void in
            
        })
        
        let action = WKAlertAction(title: "Action", style: WKAlertActionStyle.Default, handler: { () -> Void in
            
        })
        
        self.presentAlertControllerWithTitle("Alert", message: "Example watchOS 2 alert interface un mensaje muy muy muy pero muy grande como si tuviera muchas información de ingredientes para una pizza mediana con parmesano etc", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancel, action])
    }
    
}
