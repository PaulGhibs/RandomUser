//
//  APIService.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation


class RandomUserService : APIRequest {
   
    func getInfos(url: String, callback: @escaping (Result<UsersResult, UserError>) -> Void) {
        guard let url = URL(string: url) else {
            callback(.failure(UserError.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                callback(.failure(UserError.badURL))
                return
            }
            
            guard let responseData = data, let httpResponse = response as? HTTPURLResponse, 200..<300  ~= httpResponse.statusCode else {
                callback(.failure(UserError.noInfoFound(data, response)))
                return
            }
            
            do {
                // here we have data, so we try to decode into a list Anime
                let listUsers = try JSONDecoder().decode(UsersResult.self, from: responseData)
                callback(.success(listUsers))
            } catch let jsonErr {
                // if decode failed, return callback(.failure)
                print("Erreur de décodage", jsonErr)
                callback(.failure(UserError.noInfoFound(data, response)))
            }
            
        }
        task.resume()
        
    }
    
    
}
