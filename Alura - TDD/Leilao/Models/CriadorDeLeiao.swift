//
//  CriadorDeLeiao.swift
//  Leilao
//
//  Created by Adalberto Sena Silva on 22/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class CriadorDeLeiao: NSObject {

    
    private var leilao:Leilao!
    
    func para(descricao:String) -> Self{
        leilao = Leilao(descricao: descricao)
        return self
    }

    func lance(_ usuario:Usuario, _ valor:Double)->Self{
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
}
