//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Adalberto Sena Silva on 22/03/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {

    
    var leiloeiro:Avaliador!
    private var joao:Usuario!
    private var maria:Usuario!
    private var jose:Usuario!
    
    override func setUp() {
        
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        
      leiloeiro = Avaliador()
        
    }

    override func tearDown() {
       
    }

    func testDeveEndenderLancesEmOrdemCrescente(){
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        
        
        try? leiloeiro.avalia(leiao: leilao)
        

        // Validacao
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    
    func testDeveEndenderLeilaoComApenasUmLance(){
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        try? leiloeiro.avalia(leiao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
        
    }
    
    func testDeveEncontrarOsTresMaioresLances(){

        let leilao = CriadorDeLeiao().para(descricao: "Playstation 4")
                                     .lance(joao, 300.0)
                                     .lance(maria, 400.0)
                                     .lance(joao, 500.0)
                                     .lance(maria, 600.0).constroi()
        
        try? leiloeiro.avalia(leiao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)

    }
    
    func testDeveIgnorarLeilaoSemLance(){
        let leilao = CriadorDeLeiao().para(descricao: "Playstation 4").constroi()
        
        XCTAssertThrowsError(try leiloeiro.avalia(leiao: leilao), "Não foi possivel avaliar Leilão sem lances") { (error) in print(error.localizedDescription)
            
        }
        
    }
}
