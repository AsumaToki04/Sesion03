//
//  ContentView04.swift
//  Sesion03
//
//  Created by DAMII on 11/23/24.
//

import SwiftUI

struct Usuario: Identifiable {
    let id = UUID()
    let nombre: String
    let email: String
}

class ModelUsuario: ObservableObject {
    @Published var listaUsuarios: [Usuario] = [Usuario(nombre: "Toki", email: "asumatoki04@gmail.com")]
}

struct ContentView04: View {
    @ObservedObject var modelGlobal = ModelUsuario()
    
    var body: some View {
        NavigationView {
            ListaUsuarios(model: modelGlobal)
        }
    }
}

struct ListaUsuarios: View {
    @ObservedObject var model: ModelUsuario
    @State private var mostrarSheet = false
    
    var body: some View {
        VStack {
            List(model.listaUsuarios) { item in
                VStack {
                    Text(item.nombre).font(.headline)
                    Text(item.email).font(.subheadline).foregroundColor(.gray)
                }
            }
        }
        .navigationTitle("Usuarios")
        .toolbar {
            Button(action: {
                mostrarSheet = true
            }) {
                Image(systemName: "plus")
            }
        }
        .sheet(isPresented: $mostrarSheet) {
            RegistroUsuario(model: model, mostrarSheet: $mostrarSheet)
        }
    }
}

struct RegistroUsuario: View {
    @ObservedObject var model: ModelUsuario
    @Binding var mostrarSheet: Bool
    
    @State private var nombre: String = ""
    @State private var email: String = ""
    var body: some View {
        Form {
            TextField("Nombre", text: $nombre)
            TextField("Email", text: $email)
            
            Button("Guardar") {
                let nuevo = Usuario(nombre: nombre, email: email)
                model.listaUsuarios.append(nuevo)
                mostrarSheet = false
            }
        }
        .navigationTitle("Registro de Usuario")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancelar") {
                    mostrarSheet = false
                }
            }
        }
    }
}
