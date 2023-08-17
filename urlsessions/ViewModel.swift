//
//  viewModel.swift
//  urlsessions
//
//  Created by duverney muriel on 7/08/23.
//

import Foundation


final class ViewModel{
    
    func getApi(){
    
        let urlSession = URLSession.shared
        guard let url = URL(string: "https://itunes.apple.com/search/media=music&entity=song&term=avicii")else {return}
        
        urlSession.dataTask(with: url){data,response,error in
//            print("data \(String(describing: data))")
//            print("response \(String(describing: response) )")
//            print("error \(String(describing: error?.localizedDescription))")
            
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data)
                print("\(String(describing: json))")
            }
        }.resume()
    }
    
}

