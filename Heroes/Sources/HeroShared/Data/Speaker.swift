//
//  Speaker.swift
//  
//
//  Created by Vince Davis on 4/9/24.
//

import Foundation
import SwiftUI

public struct Speaker: Identifiable, Equatable {
    public init(id: String, name: String, desc: String, image: Image) {
        self.id = id
        self.name = name
        self.desc = desc
        self.image = image
    }
    
    public var id: String
    public var name: String
    public var desc: String
    public var image: Image
}

public extension Speaker {
    static var all: [Speaker] {
        return [
            .alex,
            .alberto,
            .andrea,
            .andrei,
            .batuhan,
            .beyza,
            .borbala,
            .brad,
            .davide,
            .davide2,
            .emilio,
            .flora,
            .gyuree,
            .jane,
            .josip,
            .krysztof,
            .libranner,
            .lukasz,
            .marcin,
            .marco,
            .mete,
            .michael,
            .natan,
            .pedro,
            .peter,
            .pietro,
            .pol,
            .pradnya,
            .sara,
            .shai,
            .stefano,
            .vince,
            .vincenzo,
            .zach
        ]
    }
    
    static var alex: Speaker = .init(id: "1", 
                                     name: "Alex",
                                     desc: "",
                                     image: .alex)
    static var alberto: Speaker = .init(id: "2", 
                                        name: "Alberto",
                                        desc: "",
                                        image: .alberto)
    static var andrea: Speaker = .init(id: "3",
                                        name: "Andrea",
                                        desc: "",
                                        image: .andrea)
    static var andrei: Speaker = .init(id: "4",
                                        name: "Andrei",
                                        desc: "",
                                        image: .andrei)
    static var batuhan: Speaker = .init(id: "5",
                                        name: "Batuhan",
                                        desc: "",
                                        image: .batuhan)
    static var beyza: Speaker = .init(id: "6",
                                        name: "Beyza",
                                        desc: "",
                                        image: .beyza)
    static var borbala: Speaker = .init(id: "7",
                                        name: "Borbala",
                                        desc: "",
                                        image: .borbala)
    static var brad: Speaker = .init(id: "8",
                                        name: "Brad",
                                        desc: "",
                                        image: .brad)
    static var davide: Speaker = .init(id: "9",
                                        name: "Davide",
                                        desc: "",
                                        image: .davide)
    static var davide2: Speaker = .init(id: "10",
                                        name: "Davide",
                                        desc: "",
                                        image: .davide2)
    static var emilio: Speaker = .init(id: "11",
                                        name: "Emilio",
                                        desc: "",
                                        image: .emilio)
    static var flora: Speaker = .init(id: "12",
                                        name: "Flora",
                                        desc: "",
                                        image: .flora)
    static var gyuree: Speaker = .init(id: "13",
                                        name: "Gyuree",
                                        desc: "",
                                        image: .gyuree)
    static var jane: Speaker = .init(id: "14",
                                        name: "Jane",
                                        desc: "",
                                        image: .jane)
    static var josip: Speaker = .init(id: "15",
                                        name: "Josip",
                                        desc: "",
                                        image: .josip)
    static var krysztof: Speaker = .init(id: "16",
                                        name: "Krysztof",
                                        desc: "",
                                        image: .krysztof)
    static var libranner: Speaker = .init(id: "17",
                                        name: "Libranner",
                                        desc: "",
                                        image: .libranner)
    static var lukasz: Speaker = .init(id: "18",
                                        name: "Lukasz",
                                        desc: "",
                                        image: .lukasz)
    static var marcin: Speaker = .init(id: "19",
                                        name: "Marcin",
                                        desc: "",
                                        image: .marcin)
    static var marco: Speaker = .init(id: "20",
                                        name: "Marco",
                                        desc: "",
                                        image: .marco)
    static var mete: Speaker = .init(id: "21",
                                        name: "Mete",
                                        desc: "",
                                        image: .mete)
    static var michael: Speaker = .init(id: "22",
                                        name: "michael",
                                        desc: "",
                                        image: .michael)
    static var natan: Speaker = .init(id: "23",
                                        name: "Natan",
                                        desc: "",
                                        image: .natan)
    static var pedro: Speaker = .init(id: "24",
                                        name: "Pedro",
                                        desc: "",
                                        image: .pedro)
    static var peter: Speaker = .init(id: "25",
                                        name: "Peter",
                                        desc: "",
                                        image: .peter)
    static var pietro: Speaker = .init(id: "26",
                                        name: "Pietro",
                                        desc: "",
                                        image: .pietro)
    static var pol: Speaker = .init(id: "27",
                                        name: "Pol",
                                        desc: "",
                                        image: .pol)
    static var pradnya: Speaker = .init(id: "28",
                                        name: "Pradnya",
                                        desc: "",
                                        image: .pradnya)
    static var sara: Speaker = .init(id: "29",
                                        name: "Sara",
                                        desc: "",
                                        image: .sara)
    static var shai: Speaker = .init(id: "30",
                                        name: "shai",
                                        desc: "",
                                        image: .shai)
    static var stefano: Speaker = .init(id: "31",
                                        name: "Stefano",
                                        desc: "",
                                        image: .stefano)
    static var vince: Speaker = .init(id: "32",
                                        name: "Vince",
                                        desc: "",
                                        image: .vince)
    static var vincenzo: Speaker = .init(id: "33",
                                        name: "Vincenzo",
                                        desc: "",
                                        image: .vincenzo)
    static var zach: Speaker = .init(id: "34",
                                        name: "Zach",
                                        desc: "",
                                        image: .zach)
    
}

extension Speaker: Listable {
    public var type: ListType {
        return .speaker
    }
    
    public var title: String {
        self.name
    }
    
    public var subtitle: String {
        self.desc
    }
    
    public var badges: [String] {
        []
    }
}
