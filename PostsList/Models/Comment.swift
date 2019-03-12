//
//  Comment.swift
//  PostsList
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-12.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import Foundation

struct Comment : Codable{
    public private(set) var id: Int
    public private(set) var body: String
    public private(set) var postId: Int
}
