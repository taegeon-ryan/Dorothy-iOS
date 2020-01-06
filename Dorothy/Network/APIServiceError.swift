//
//  APIServiceError.swift
//  Dorothy
//
//  Created by 유태건 on 2020/01/04.
//  Copyright © 2020 유태건. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case responseError
    case parseError(Error)
}
