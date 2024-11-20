//
//  ContentView03.swift
//  Sesion03
//
//  Created by DAMII on 19/11/24.
//

import SwiftUI

class ModeloDatos: ObservableObject {
    @Published var personas: [String] = ["Juan", "Nadia", "Maria"]
}

struct ContentView03: View {
    
    @StateObject private var modelo = ModeloDatos()
    @State private var nuevaPersona: String = ""
    
    var body: some View {
        VStack {
            
            List {
                ForEach(modelo.personas, id: \.self) { item in
                    Text(item)
                }.onDelete { indices in
                    modelo.personas.remove(atOffsets: indices)
                }
            }
            
            HStack {
                
                TextField("Ingresar un nombre", text: $nuevaPersona)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Agregar") {
                    modelo.personas.append(nuevaPersona)
                    nuevaPersona = ""
                }
                .padding()
                .background(nuevaPersona.isEmpty ? .gray : .blue)
                .foregroundColor(.white)
                .disabled(nuevaPersona.isEmpty)
                
            }
            
        }
    }
}
