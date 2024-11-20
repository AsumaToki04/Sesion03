//
//  ContentView02.swift
//  Sesion03
//
//  Created by DAMII on 19/11/24.
//

import SwiftUI

struct Persona: Codable, Identifiable {
    let id: UUID
    let nombre: String
    
    init(id: UUID = UUID(), nombre: String) {
        self.id = id
        self.nombre = nombre
    }
}

struct ContentView02: View {
    
    @State private var listaPersonas: [Persona] = [] // Array Personas
    
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
    
    private func archivoURL() -> URL {
        let documentos = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first!
        return documentos.appendingPathComponent("personas.json")
    }
    
    private func guardarDatos() {
        do {
            let datos = try JSONEncoder().encode(listaPersonas) // datos -> texto plano
            try datos.write(to: archivoURL())
        } catch {
            print("Error al guardar: \(error)")
        }
    }
    
    private func cargarDatos() {
        do {
            let datos = try Data(contentsOf: archivoURL()) // datos <- texto plano
            listaPersonas = try JSONDecoder().decode([Persona].self, from: datos)
        } catch {
            print("Error al cargar: \(error)")
        }
    }
}
