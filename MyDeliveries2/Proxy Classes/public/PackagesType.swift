// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

open class PackagesType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var packageID_: Property = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "PackageID")

    private static var name_: Property = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "Name")

    private static var description_: Property = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "Description")

    private static var price_: Property = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "Price")

    private static var deliveryStatus_: Property = DeliveryServiceMetadata.EntityTypes.packagesType.property(withName: "DeliveryStatus")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: DeliveryServiceMetadata.EntityTypes.packagesType)
    }

    open class func array(from: EntityValueList) -> [PackagesType] {
        return ArrayConverter.convert(from.toArray(), [PackagesType]())
    }

    open func copy() -> PackagesType {
        return CastRequired<PackagesType>.from(self.copyEntity())
    }

    open class var deliveryStatus: Property {
        get {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                return PackagesType.deliveryStatus_
            }
        }
        set(value) {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                PackagesType.deliveryStatus_ = value
            }
        }
    }

    open var deliveryStatus: [DeliveryStatusType] {
        get {
            return ArrayConverter.convert(PackagesType.deliveryStatus.entityList(from: self).toArray(), [DeliveryStatusType]())
        }
        set(value) {
            PackagesType.deliveryStatus.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, [EntityValue]())))
        }
    }

    open class var description: Property {
        get {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                return PackagesType.description_
            }
        }
        set(value) {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                PackagesType.description_ = value
            }
        }
    }

    open var description: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PackagesType.description))
        }
        set(value) {
            self.setOptionalValue(for: PackagesType.description, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(packageID: String?) -> EntityKey {
        return EntityKey().with(name: "PackageID", value: StringValue.of(optional: packageID))
    }

    open class var name: Property {
        get {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                return PackagesType.name_
            }
        }
        set(value) {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                PackagesType.name_ = value
            }
        }
    }

    open var name: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PackagesType.name))
        }
        set(value) {
            self.setOptionalValue(for: PackagesType.name, to: StringValue.of(optional: value))
        }
    }

    open var old: PackagesType {
        return CastRequired<PackagesType>.from(self.oldEntity)
    }

    open class var packageID: Property {
        get {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                return PackagesType.packageID_
            }
        }
        set(value) {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                PackagesType.packageID_ = value
            }
        }
    }

    open var packageID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: PackagesType.packageID))
        }
        set(value) {
            self.setOptionalValue(for: PackagesType.packageID, to: StringValue.of(optional: value))
        }
    }

    open class var price: Property {
        get {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                return PackagesType.price_
            }
        }
        set(value) {
            objc_sync_enter(PackagesType.self)
            defer { objc_sync_exit(PackagesType.self) }
            do {
                PackagesType.price_ = value
            }
        }
    }

    open var price: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: PackagesType.price))
        }
        set(value) {
            self.setOptionalValue(for: PackagesType.price, to: DecimalValue.of(optional: value))
        }
    }
}
