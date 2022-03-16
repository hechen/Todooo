//
//  String+.swift
//  Todooo Extension
//
//  Created by chen he on 2020/1/9.
//  Copyright © 2020 chen he. All rights reserved.
//

import Foundation

extension String {
    public
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    public
    var urlEncoded: String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
    }
}
