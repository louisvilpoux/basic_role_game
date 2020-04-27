//
//  main.swift
//  RPG
//
//  Created by Louis Vilpoux on 24/04/2020.
//  Copyright © 2020 Louis Vilpoux. All rights reserved.
//

import Foundation

// Function to let user enter a value and cast it into integer
func input() -> Int {
    let strData = readLine();
    
    return Int(strData!)!
}

func matchClasse(_ value: Int) -> Classe {
    switch value {
    case 1:
        return Classe.Archer
    case 2:
        return Classe.Guerrier
    case 3:
        return Classe.Mage
    default:
        return Classe.Archer
    }
}


/*
 ######
 ######
*/


var persoChoice : Int = 0


// Player 1 choice
repeat {
    print("Classe du personnage 1 :\n1. Archer\n2. Guerrier\n3. Mage")
    persoChoice = input()
} while (persoChoice != 1 && persoChoice != 2 && persoChoice != 3)
let personnageUn = Personnage(nom: "Personnage 1", classe: matchClasse(persoChoice))

// Player 2 choice
repeat {
    print("Classe du personnage 2 :\n1. Archer\n2. Guerrier\n3. Mage")
    persoChoice = input()
} while (persoChoice != 1 && persoChoice != 2 && persoChoice != 3)
let personnageDeux = Personnage(nom: "Personnage 2", classe: matchClasse(persoChoice))

// Combat
while (personnageUn.vie > 0 && personnageDeux.vie > 0) {
    personnageUn.joue(contre: personnageDeux)
    if personnageDeux.vie > 0 {
        personnageDeux.joue(contre: personnageUn)
    }
}


// Final result
if personnageUn.vie <= 0 {
    print("Le vainqueur est \(personnageDeux.nom)")
}
else {
    print("Le vainqueur est \(personnageUn.nom)")
}
