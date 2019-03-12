//
//  PostsService.swift
//  PostsList
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-12.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import Foundation

class ItemService {
    static let instance = ItemService()
    
    func getItems(completionHandler: @escaping (_ success: Bool, _ item: Item?,_ error: Error?) -> ()) {
        guard let url =  URL(string: postsUrl) else {
            completionHandler(false, nil, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
           guard  error == nil, let data = data else {
                completionHandler(false, nil, error)
                return
            }
            
            do {
                let item = try JSONDecoder().decode(Item.self, from: data)
                
                completionHandler(true, item, nil)
                
            } catch {
                completionHandler(false, nil, error)
            }
        }
        
        dataTask.resume()
    }
}
