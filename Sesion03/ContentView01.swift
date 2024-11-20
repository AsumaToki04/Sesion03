//
//  ContentView01.swift
//  Sesion03
//
//  Created by DAMII on 19/11/24.
//

import SwiftUI

struct ContentView01: View {
    
    @AppStorage("nombreUsuario") private var nombre: String = "" // UserDefault
    
    var body: some View {
        VStack {
            
            TextField("Ingresa tu nombre", text: $nombre)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Text("Hola, \(nombre)")
                .font(.title)
            
        }
    }
}
