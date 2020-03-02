// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

internal class DeliveryServiceMetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        DeliveryServiceMetadata.document = metadata
        DeliveryServiceMetadataChanges.merge1(metadata: metadata)
        try! DeliveryServiceFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !DeliveryServiceMetadata.EntityTypes.deliveryStatusType.isRemoved {
            DeliveryServiceMetadata.EntityTypes.deliveryStatusType = metadata.entityType(withName: "codejam.wwdc.services.DeliveryService.DeliveryStatusType")
        }
        if !DeliveryServiceMetadata.EntityTypes.packagesType.isRemoved {
            DeliveryServiceMetadata.EntityTypes.packagesType = metadata.entityType(withName: "codejam.wwdc.services.DeliveryService.PackagesType")
        }
        if !DeliveryServiceMetadata.EntitySets.deliveryStatus.isRemoved {
            DeliveryServiceMetadata.EntitySets.deliveryStatus = metadata.entitySet(withName: "DeliveryStatus")
        }
        if !DeliveryServiceMetadata.EntitySets.packages.isRemoved {
            DeliveryServiceMetadata.EntitySets.packages = metadata.entitySet(withName: "Packages")
        }
        if !DeliveryStatusType.deliveryStatusID.isRemoved {
            DeliveryStatusType.deliveryStatusID = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "DeliveryStatusID")
        }
        if !DeliveryStatusType.packageID.isRemoved {
            DeliveryStatusType.packageID = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "PackageID")
        }
        if !DeliveryStatusType.location.isRemoved {
            DeliveryStatusType.location = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "Location")
        }
        if !DeliveryStatusType.deliveryTimestamp.isRemoved {
            DeliveryStatusType.deliveryTimestamp = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "DeliveryTimestamp")
        }
        if !DeliveryStatusType.statusType.isRemoved {
            DeliveryStatusType.statusType = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "StatusType")
        }
        if !DeliveryStatusType.selectable.isRemoved {
            DeliveryStatusType.selectable = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "Selectable")
        }
        if !DeliveryStatusType.status.isRemoved {
            DeliveryStatusType.status = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "Status")
        }
        if !PackagesType.packageID.isRemoved {
            PackagesType.packageID = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "PackageID")
        }
        if !PackagesType.name.isRemoved {
            PackagesType.name = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "Name")
        }
        if !PackagesType.description.isRemoved {
            PackagesType.description = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "Description")
        }
        if !PackagesType.price.isRemoved {
            PackagesType.price = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "Price")
        }
        if !PackagesType.deliveryStatus.isRemoved {
            PackagesType.deliveryStatus = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "DeliveryStatus")
        }
    }
}
