//
//  pokemonsesion.swift
//  urlsessions
//
//  Created by duverney muriel on 10/08/23.
//

import Foundation

struct PokemonDataModel: Decodable{
    let name: String
    let url: String
}

struct PokemonResponseDataModel: Decodable{
    let pokemons: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey{
        case results
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemons = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}


final class pokemonsesion: ObservableObject {
    
    @Published var pokemon:  [PokemonDataModel] = []
    
    func getPokemons(){
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        
        URLSession.shared.dataTask(with: url!){data, response,error in
            if let _ = error{
                print("error")
            }
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("pokemons \(pokemonDataModel)")
                DispatchQueue.main.async {
                    self.pokemon = pokemonDataModel.pokemons
                }
            }
        }.resume()
    }
    
}
