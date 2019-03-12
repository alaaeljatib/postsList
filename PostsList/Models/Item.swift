//
//  Item.swift
//  PostsList
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-12.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import Foundation

struct Item : Codable {
    public private(set) var posts : [Post]
    public private(set) var comments: [Comment]
    public private(set) var profile : Profile
}
