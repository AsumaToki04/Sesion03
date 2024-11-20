//
//  ContentView02.swift
//  Sesion03
//
//  Created by DAMII on 19/11/24.
//

import SwiftUI

struct Persona: Identifiable {
    let id = UUID()
    let nombre: String
}

struct ContentView02: View {
    
    @State private var listaPersonas: [Persona] = []
    
    var body: some View {
        VStack {
            List(listaPersonas) { item in
                Text(item.nombre)
            }
            
            Button("Agregar persona") {
                let newPosition = listaPersonas.count + 1
                let nuevaPersona = Persona(nombre: "Persona # \(newPosition)")
                listaPersonas.append(nuevaPersona)
            }
        }
    }
}
