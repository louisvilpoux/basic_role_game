//
//  Personnage.swift
//  RPG
//
//  Created by Louis Vilpoux on 24/04/2020.
//  Copyright © 2020 Louis Vilpoux. All rights reserved.
//

import Foundation

class Personnage {
    var nom: String
    var classe: Classe
    var arme: Arme
    var vie: Int
    
    init(nom: String, classe: Classe) {
        self.nom = nom
        self.classe = classe
        self.vie = 100
        switch classe {
        case Classe.Archer:
            self.arme = Arc()
        case Classe.Guerrier:
            self.arme = Epee()
        case Classe.Mage:
            self.arme = Sceptre()
        }
    }
    
    func joue(contre personnage: Personnage) {
        var fightChoice: Int
        print("Nom : \(self.nom)\nVie : \(self.vie)\nDégâts de son arme : \(self.arme.degats)")
        print("Quel choix :\n1. Attaquer\n2. Améliorer son arme")
        fightChoice = input()
        switch fightChoice {
        case 1:
            self.attaque(personne: personnage)
        case 2:
            self.ameliore()
        default:
            break
        }
    }
    
    func ameliore() {
        self.arme.degats = self.arme.degats + 5
    }
    
    func attaque(personne: Personnage) {
        personne.vie = personne.vie - self.arme.degats
    }
}

enum Classe {
    case Archer, Guerrier, Mage
}
