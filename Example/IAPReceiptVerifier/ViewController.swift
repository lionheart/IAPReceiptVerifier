//
//  Copyright 2017 Lionheart Software LLC
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
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

