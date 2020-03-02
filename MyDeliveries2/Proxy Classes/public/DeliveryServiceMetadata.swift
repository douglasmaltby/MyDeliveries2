// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

public class DeliveryServiceMetadata {
    private static var document_: CSDLDocument = DeliveryServiceMetadata.resolve()

    public static let lock: MetadataLock = MetadataLock()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(DeliveryServiceMetadata.self)
            defer { objc_sync_exit(DeliveryServiceMetadata.self) }
            do {
                return DeliveryServiceMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryServiceMetadata.self)
            defer { objc_sync_exit(DeliveryServiceMetadata.self) }
            do {
                DeliveryServiceMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! DeliveryServiceFactory.registerAll()
        DeliveryServiceMetadataParser.parsed.hasGeneratedProxies = true
        return DeliveryServiceMetadataParser.parsed
    }

    public class EntityTypes {
        private static var deliveryStatusType_: EntityType = DeliveryServiceMetadataParser.parsed.entityType(withName: "codejam.wwdc.services.DeliveryService.DeliveryStatusType")

        private static var packagesType_: EntityType = DeliveryServiceMetadataParser.parsed.entityType(withName: "codejam.wwdc.services.DeliveryService.PackagesType")

        public static var deliveryStatusType: EntityType {
            get {
                objc_sync_enter(DeliveryServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntityTypes.self) }
                do {
                    return DeliveryServiceMetadata.EntityTypes.deliveryStatusType_
                }
            }
            set(value) {
                objc_sync_enter(DeliveryServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntityTypes.self) }
                do {
                    DeliveryServiceMetadata.EntityTypes.deliveryStatusType_ = value
                }
            }
        }

        public static var packagesType: EntityType {
            get {
                objc_sync_enter(DeliveryServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntityTypes.self) }
                do {
                    return DeliveryServiceMetadata.EntityTypes.packagesType_
                }
            }
            set(value) {
                objc_sync_enter(DeliveryServiceMetadata.EntityTypes.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntityTypes.self) }
                do {
                    DeliveryServiceMetadata.EntityTypes.packagesType_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static var deliveryStatus_: EntitySet = DeliveryServiceMetadataParser.parsed.entitySet(withName: "DeliveryStatus")

        private static var packages_: EntitySet = DeliveryServiceMetadataParser.parsed.entitySet(withName: "Packages")

        public static var deliveryStatus: EntitySet {
            get {
                objc_sync_enter(DeliveryServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntitySets.self) }
                do {
                    return DeliveryServiceMetadata.EntitySets.deliveryStatus_
                }
            }
            set(value) {
                objc_sync_enter(DeliveryServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntitySets.self) }
                do {
                    DeliveryServiceMetadata.EntitySets.deliveryStatus_ = value
                }
            }
        }

        public static var packages: EntitySet {
            get {
                objc_sync_enter(DeliveryServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntitySets.self) }
                do {
                    return DeliveryServiceMetadata.EntitySets.packages_
                }
            }
            set(value) {
                objc_sync_enter(DeliveryServiceMetadata.EntitySets.self)
                defer { objc_sync_exit(DeliveryServiceMetadata.EntitySets.self) }
                do {
                    DeliveryServiceMetadata.EntitySets.packages_ = value
                }
            }
        }
    }
}
