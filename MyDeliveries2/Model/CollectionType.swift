//
// MyDeliveries2
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 01/03/20
//

import Foundation

enum CollectionType: String {
    case deliveryStatus = "DeliveryStatus"
    case packages = "Packages"
    case none = ""
    static let all = [deliveryStatus, packages]
}
