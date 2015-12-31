//
//  ContextoPizza.swift
//  pizzaWatch
//
//  Created by Angel Agustín Martínez on 30/12/15.
//  Copyright © 2015 Angel Agustín Martínez. All rights reserved.
//

import WatchKit

class ContextoPizza: NSObject {
    var tamañoPizza : String = ""
    var tipoMasa : String = ""
    var tipoQueso : String = ""
    
    func estableceTamañoPizza(tamaño: String) {
        self.tamañoPizza = tamaño
    }
    
    func estableceTipoMasa(masa: String) {
        self.tipoMasa = masa
    }
    
    func estableceTipoQueso(queso : String) {
        self.tipoQueso = queso
    }
}
