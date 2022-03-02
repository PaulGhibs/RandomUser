//
//  APIService.swift
//  RandomUser
//
//  Created by Paul Ghibeaux on 23/02/2022.
//

import Foundation


class RandomUserService : APIRequest {
   
    func getInfos(url: String, callback: @escaping (Result<UsersCollections, UserError>) -> Void) {
        
        
        guard let url = URL(string: url) else {
            callback(.failure(UserError.badURL))
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            
            guard error == nil else {
            callback(.failure(UserError.badURL))
            return
            }
            
            guard let responseData = data, let httpResponse = response as? HTTPURLResponse, 200..<300  ~= httpResponse.statusCode else
            {
                callback(.failure(UserError.noInfoFound))
                return
            }
            
            if responseData == data {
                //pull out the declaration of the decoder object
                let decoder = JSONDecoder()
                //set how we want to interpret dates in the JSON
                decoder.dateDecodingStrategy = .iso8601
                //decode directly to an array of User structs rather than a Response
                if let decodedResponse = try?
                    decoder.decode(UsersCollections.self, from: data!) {
                   
                    DispatchQueue.main.async {
                        //decodedResponse is now [User] rather than Response.User
                        callback(.success(decodedResponse))
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            
        }.resume()
    }
    
    
}
