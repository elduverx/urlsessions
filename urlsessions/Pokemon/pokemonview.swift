//
//  pokemonview.swift
//  urlsessions
//
//  Created by duverney muriel on 10/08/23.
//

import SwiftUI

struct pokemonview: View {
    
  @StateObject  var viewModel: pokemonsesion = pokemonsesion()
    
    var body: some View {
        Form{
            ForEach(viewModel.pokemon, id: \.name){ poke in
                Text(poke.name)
            }
        }
            .onAppear{
                viewModel.getPokemons()
            }
    }
}

struct pokemonview_Previews: PreviewProvider {
    static var previews: some View {
        pokemonview()
    }
}
