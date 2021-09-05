//
//  ContentView.swift
//  AtividadeAula4
//
//  Created by Rafael Silva on 21/08/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Pessoa.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Pessoa.nome, ascending: false)]
    ) var pessoas:FetchedResults<Pessoa>
    
    @State var txtNome = ""
    var body: some View {
        TabView{
            VStack{
                List{
                    ForEach(pessoas, id: \.self){
                        pe in
                        Text("\(pe.nome ??  "--")")
                    }
                }
                
            }
            
            HStack{
                TextField("Digite nome do cliente",text : $txtNome).textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Salvar"){
                    let pessoa = Pessoa(context: managedObjectContext)
                    pessoa.nome = txtNome
                    PersistenceController.banco.save()
                    self.txtNome = ""
                   
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
