//
//  Filtro.swift
//  Agenda
//
//  Created by Adalberto Sena Silva on 19/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Filtro: NSObject {
    
    func filtraAlunos(listaDeAlunos:Array<Aluno>, texto:String) -> Array<Aluno> {
        let alunoEncontrado = listaDeAlunos.filter{(aluno) -> Bool in
            if let nome = aluno.nome{
                return nome.contains(texto)
            }
            
            return false
        }
        return alunoEncontrado
        
    }

}
