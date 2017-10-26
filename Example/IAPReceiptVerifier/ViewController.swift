//
//  ViewController.swift
//  IAPReceiptVerifier
//
//  Created by dlo on 10/26/2017.
//  Copyright (c) 2017 dlo. All rights reserved.
//

import UIKit
import IAPReceiptVerifier

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let (_privateKey, _publicKey) = try! SecKey.generateBase64Encoded2048BitRSAKey()
        print(_privateKey)
        print("-----")
        print(_publicKey)
    }

    func retrieveReceiptWithoutSignature() {
        let url = URL(string: "https://your-app.herokuapp.com/verify")!
        let verifier = IAPReceiptVerifier(url: url)

        verifier.verify { receipt in
            // Your application logic here.
        }
    }

    func retrieveReceiptWithSignature(publicKey: String) {
        let url = URL(string: "https://your-app.herokuapp.com/verify")!
        guard let verifier = IAPReceiptVerifier(url: url, base64EncodedPublicKey: publicKey) else {
            return
        }

        verifier.verify { receipt in
            guard let receipt = receipt else {
                // Someone tampered with the payload!
                return
            }

            // Your application logic here.
        }
    }
}

