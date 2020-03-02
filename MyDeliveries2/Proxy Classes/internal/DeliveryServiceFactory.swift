// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

internal class DeliveryServiceFactory {
    static func registerAll() throws {
        DeliveryServiceMetadata.EntityTypes.deliveryStatusType.registerFactory(ObjectFactory.with(create: { DeliveryStatusType(withDefaults: false) }, createWithDecoder: { d in try DeliveryStatusType(from: d) }))
        DeliveryServiceMetadata.EntityTypes.packagesType.registerFactory(ObjectFactory.with(create: { PackagesType(withDefaults: false) }, createWithDecoder: { d in try PackagesType(from: d) }))
        DeliveryServiceStaticResolver.resolve()
    }
}
