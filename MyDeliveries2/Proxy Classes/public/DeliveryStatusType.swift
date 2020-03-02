// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

open class DeliveryStatusType: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var deliveryStatusID_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "DeliveryStatusID")

    private static var packageID_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "PackageID")

    private static var location_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "Location")

    private static var deliveryTimestamp_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "DeliveryTimestamp")

    private static var statusType_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "StatusType")

    private static var selectable_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "Selectable")

    private static var status_: Property = DeliveryServiceMetadata.EntityTypes.deliveryStatusType.property(withName: "Status")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: DeliveryServiceMetadata.EntityTypes.deliveryStatusType)
    }

    open class func array(from: EntityValueList) -> [DeliveryStatusType] {
        return ArrayConverter.convert(from.toArray(), [DeliveryStatusType]())
    }

    open func copy() -> DeliveryStatusType {
        return CastRequired<DeliveryStatusType>.from(self.copyEntity())
    }

    open class var deliveryStatusID: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.deliveryStatusID_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.deliveryStatusID_ = value
            }
        }
    }

    open var deliveryStatusID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeliveryStatusType.deliveryStatusID))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.deliveryStatusID, to: StringValue.of(optional: value))
        }
    }

    open class var deliveryTimestamp: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.deliveryTimestamp_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.deliveryTimestamp_ = value
            }
        }
    }

    open var deliveryTimestamp: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: DeliveryStatusType.deliveryTimestamp))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.deliveryTimestamp, to: value)
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(deliveryStatusID: String?) -> EntityKey {
        return EntityKey().with(name: "DeliveryStatusID", value: StringValue.of(optional: deliveryStatusID))
    }

    open class var location: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.location_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.location_ = value
            }
        }
    }

    open var location: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeliveryStatusType.location))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.location, to: StringValue.of(optional: value))
        }
    }

    open var old: DeliveryStatusType {
        return CastRequired<DeliveryStatusType>.from(self.oldEntity)
    }

    open class var packageID: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.packageID_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.packageID_ = value
            }
        }
    }

    open var packageID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeliveryStatusType.packageID))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.packageID, to: StringValue.of(optional: value))
        }
    }

    open class var selectable: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.selectable_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.selectable_ = value
            }
        }
    }

    open var selectable: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: DeliveryStatusType.selectable))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.selectable, to: IntValue.of(optional: value))
        }
    }

    open class var status: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.status_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.status_ = value
            }
        }
    }

    open var status: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeliveryStatusType.status))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.status, to: StringValue.of(optional: value))
        }
    }

    open class var statusType: Property {
        get {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                return DeliveryStatusType.statusType_
            }
        }
        set(value) {
            objc_sync_enter(DeliveryStatusType.self)
            defer { objc_sync_exit(DeliveryStatusType.self) }
            do {
                DeliveryStatusType.statusType_ = value
            }
        }
    }

    open var statusType: String? {
        get {
            return StringValue.optional(self.optionalValue(for: DeliveryStatusType.statusType))
        }
        set(value) {
            self.setOptionalValue(for: DeliveryStatusType.statusType, to: StringValue.of(optional: value))
        }
    }
}
