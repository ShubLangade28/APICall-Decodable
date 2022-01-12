//
//  ApiManeger.swift
//  ApiTask
//
//  Created by Mac on 07/01/22.
//

import Foundation
class ApiManager
{
    typealias DataPassingClosure = ([Users]) -> ()
    func getData(completionHandler: @escaping DataPassingClosure)
    {
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString)else{return}
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        
        
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let response = response as? HTTPURLResponse else
            {
                print("Error in response")
                return
            }
            print("Response Code :- \(response.statusCode)")
            if let serverError = error
            {
                print(serverError.localizedDescription)
            }
            guard let jsonData = data else{return}
            let userDetails = self.parseData(serverData: jsonData)
            completionHandler(userDetails)
            
        }
        task.resume()
    }
    
    func parseData(serverData : Data) -> [Users]
    {
        var userAllDetails = [Users]()
        do
        {
            let userData = try JSONDecoder().decode([Users].self, from: serverData)
           
            userAllDetails.append(contentsOf: userData)
        }
        
        
        catch
        {
            print(error.localizedDescription)
        }
        
        return userAllDetails
    }

}
