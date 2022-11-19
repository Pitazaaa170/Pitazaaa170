//
//  InternetService.swift
//  Pitaza170
//
//  Created by Артем Тихонов on 19.11.2022.
//

import Foundation

class InternetService {
    
    func loadUserCurrencies(completion: @escaping (Swift.Result<UserCurrencies,Error>)->Void){
        
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let userCurrencies = try decoder.decode(UserCurrencies.self, from: data)
                    completion(.success(userCurrencies))
                } catch {
                    return
                }
            }
        }.resume()
        
    }
    
    func loadUserRubles(completion: @escaping (Swift.Result<UserRubles,Error>)->Void){
        
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let userRubles = try decoder.decode(UserRubles.self, from: data)
                    completion(.success(userRubles))
                } catch {
                    return
                }
            }
        }.resume()
        
    }
    
}
