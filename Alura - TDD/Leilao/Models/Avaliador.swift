
import Foundation

enum ErroAvaliador:Error{
    case LeilaoSemLance(String)
}

class Avaliador{
    
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var maiores: [Lance] = []
    
    func avalia(leiao:Leilao) throws {
        
        if leiao.lances?.count == 0{
            throw ErroAvaliador.LeilaoSemLance("Não é possivel Avaliar um Leilão sem lances")
        }
        
        
        guard let lances = leiao.lances else {return}
        
        for lance in lances {
            if lance.valor > maiorDeTodos{
                maiorDeTodos = lance.valor
            }
            if lance.valor < menorDeTodos{
                menorDeTodos = lance.valor
                
            }
        }
        
      pegaOsMaioresLancesNoLeilao(leiao)
    }
    
    func maiorLance() -> Double{
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    func tresMaiores() -> [Lance]{
        return maiores
    }
    
    
    private func pegaOsMaioresLancesNoLeilao(_ leilao:Leilao){
        guard let lances = leilao.lances else {return}
        
        maiores = lances.sorted(by: { (lista1, lista2) -> Bool in
            return lista1.valor > lista2.valor
        })
        
       let maioresLances = maiores.prefix(3)
        maiores = Array(maioresLances)
        
    }
    
}
