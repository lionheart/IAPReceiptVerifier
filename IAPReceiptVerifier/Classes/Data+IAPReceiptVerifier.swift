//
//  Data+IAPReceiptVerifier.swift
//  IAPReceiptVerifier
//
//  Created by Daniel Loewenherz on 10/26/17.
//

import Foundation

public extension Data {
    init(key: RSAKey) throws {
        var error: Unmanaged<CFError>?
        guard let data = SecKeyCopyExternalRepresentation(key.key, &error) as Data? else {
            throw error!.takeRetainedValue() as Error
        }

        self = data
    }
}
