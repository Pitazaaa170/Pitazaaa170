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
    
    func loadGlobalCurrencies(completion: @escaping (Swift.Result<GlobalCurrencies,Error>)->Void){
        
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
                    let globalCurrencies = try decoder.decode(GlobalCurrencies.self, from: data)
                    completion(.success(globalCurrencies))
                } catch {
                    return
                }
            }
        }.resume()
        
    }
    
    func loadRegisteredUsers(completion: @escaping (Swift.Result<UsersForAdmin,Error>)->Void){
        
        let urlString = "https://localhost/adminservice/v1/users"
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode(UsersForAdmin.self, from: data)
                    completion(.success(users))
                } catch {
                    return
                }
            }
        }.resume()
        
    }
    
    func postToBlockUser(id: Int, completion: @escaping (Bool)->Void){
        
        let urlString = "https://localhost/adminservice/v1/user/block/\(id)"

        guard let url = URL(string: urlString) else {return}

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            }
        }.resume()
    }
    
    func postToUnblockUser(id: Int, completion: @escaping (Bool)->Void){
        
        let urlString = "https://localhost/adminservice/v1/user/unblock/\(id)"

        guard let url = URL(string: urlString) else {return}

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            }
        }.resume()
    }
    
    func loadUnregisteredUsers(completion: @escaping (Swift.Result<UnregisteredUsers,Error>)->Void){
        
        let urlString = "https://localhost/adminservice/v1/registrations"
        
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let users = try decoder.decode(UnregisteredUsers.self, from: data)
                    completion(.success(users))
                } catch {
                    return
                }
            }
        }.resume()
        
    }
    
    func putToApproveUser(id: Int, completion: @escaping (Bool)->Void){
        
        let urlString = "https://localhost/adminservice/v1/registration"

        guard let url = URL(string: urlString) else {return}
        
        let bodyStruct = PutUsersStruct(userId: id, registrationApprove: true)
        let bodyData = Data()
        do {
            let bodyData = try JSONEncoder().encode(bodyStruct)
        } catch {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = bodyData
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            }
        }.resume()
    }
    
    func putToRejectUser(id: Int, completion: @escaping (Bool)->Void){
        
        let urlString = "https://localhost/adminservice/v1/registration"

        guard let url = URL(string: urlString) else {return}
        
        let bodyStruct = PutUsersStruct(userId: id, registrationApprove: false)
        let bodyData = Data()
        do {
            let bodyData = try JSONEncoder().encode(bodyStruct)
        } catch {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = bodyData
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let error = error {
                print(error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                if httpResponse.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
                
            }
        }.resume()
    }
    
}
