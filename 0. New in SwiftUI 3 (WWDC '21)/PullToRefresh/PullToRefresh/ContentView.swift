//
//  ContentView.swift
//  PullToRefresh
//
//  Created by Xianmo on 19/06/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var number: String = httpcats.allCases.randomElement()!.rawValue

    var body: some View {
            VStack {
                callNewImage(number: number)
                List {
                    Text("Pull down on this text to refresh the image")
                    Text("It demonstrates both pull-to-refresh and AsyncImage (loading an image over a network), both of which utilise the new async/await feature of Swift 5.5.")
                    Text("Also, it has [cats](https://http.cat)...")
                }
                .listRowSeparator(.hidden)
                .refreshable {
                    number = getNewNumber(oldNumber: number)
                }
            }
            .background(.black)
    }
    
    struct callNewImage: View {
        var number: String
        
        var body: some View {
            AsyncImage(url: URL(string: "https://http.cat/\(number)")) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
            }
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
    
    func getNewNumber(oldNumber: String) -> String {
        let newNumber = httpcats.allCases.randomElement()!.rawValue
        
        if newNumber != oldNumber {
            return newNumber
        } else {
            return getNewNumber(oldNumber: newNumber)
        }
        
    }
 
    enum httpcats: String, CaseIterable, Identifiable {
        case continue101 = "100"
        case switchingProtocols101 = "101"
        case processing102 = "102"
        case ok200 = "200"
        case created201 = "201"
        case accepted = "202"
        case nonAuthorativeInformation203 = "203"
        case noContent204 = "204"
        case partialContent206 = "206"
        case multiStatus207 = "207"
        case multipleChoices300 = "300"
        case movedPermanently301 = "301"
        case found302 = "302"
        case seeOther303 = "303"
        case notModified304 = "304"
        case useProxy305 = "305"
        case temporaryRedirect307 = "307"
        case permanentRedirect308 = "308"
        case badRequest400 = "400"
        case unauthorized401 = "401"
        case paymentRequired402 = "402"
        case forbidden403 = "403"
        case notFound404 = "404"
        case methodNotAllowed405 = "405"
        case notAcceptable406 = "406"
        case proxyAuthenticationRequired407 = "407"
        case requestTimeout408 = "408"
        case conflict409 = "409"
        case gone410 = "410"
        case lengthRequired411 = "411"
        case preconditionFailed412 = "412"
        case payloadTooLarge413 = "413"
        case requestURITooLong414 = "414"
        case unsupportedMediaType415 = "415"
        case requestRangeNotSatisfiable416 = "416"
        case expectationFailed417 = "417"
        case imATeapot418 = "418"
        case enhanceYourCalm420 = "420"
        case misdirectedRequest421 = "421"
        case unprocessableEntity422 = "422"
        case locked423 = "423"
        case failedDependency424 = "424"
        case tooEarly425 = "425"
        case upgradeRequired426 = "426"
        case tooManyRequests429 = "429"
        case requestHeaderFieldsTooLarge431 = "431"
        case noResponse444 = "444"
        case blockedByWindowsParentalControl450 = "450"
        case unavailableFroLegalReasons451 = "451"
        case clientClosedRequest499 = "499"
        case internalServerError500 = "500"
        case notImplemented501 = "501"
        case badGateway502 = "502"
        case serviceUnavailable503 = "503"
        case gatewayTimeout504 = "504"
        case variantAlsoNegotiates506 = "506"
        case insufficientStorage507 = "507"
        case loopDetected508 = "508"
        case bandwithLimitExceeded509 = "509"
        case notExtended510 = "510"
        case networkAuthenticationRequired511 = "511"
        case networkConnectTimeoutError599 = "599"
                
        var id: String { self.rawValue }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
