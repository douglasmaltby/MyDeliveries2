// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

open class DeliveryService<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = DeliveryServiceMetadata.document
    }

    open func fetchDeliveryStatus(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [DeliveryStatusType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try DeliveryStatusType.array(from: self.executeQuery(var_query.fromDefault(DeliveryServiceMetadata.EntitySets.deliveryStatus), headers: var_headers, options: var_options).entityList())
    }

    open func fetchDeliveryStatus(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([DeliveryStatusType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeliveryStatus(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeliveryStatusType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeliveryStatusType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<DeliveryStatusType>.from(self.executeQuery(query.fromDefault(DeliveryServiceMetadata.EntitySets.deliveryStatus), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchDeliveryStatusType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeliveryStatusType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeliveryStatusType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchDeliveryStatusTypeWithKey(deliveryStatusID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> DeliveryStatusType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchDeliveryStatusType(matching: var_query.withKey(DeliveryStatusType.key(deliveryStatusID: deliveryStatusID)), headers: headers, options: options)
    }

    open func fetchDeliveryStatusTypeWithKey(deliveryStatusID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (DeliveryStatusType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchDeliveryStatusTypeWithKey(deliveryStatusID: deliveryStatusID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPackages(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> [PackagesType] {
        let var_query = DataQuery.newIfNull(query: query)
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try PackagesType.array(from: self.executeQuery(var_query.fromDefault(DeliveryServiceMetadata.EntitySets.packages), headers: var_headers, options: var_options).entityList())
    }

    open func fetchPackages(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping ([PackagesType]?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPackages(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPackagesType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PackagesType {
        let var_headers = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options = RequestOptions.noneIfNull(options: options)
        return try CastRequired<PackagesType>.from(self.executeQuery(query.fromDefault(DeliveryServiceMetadata.EntitySets.packages), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchPackagesType(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PackagesType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPackagesType(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchPackagesTypeWithKey(packageID: String?, query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> PackagesType {
        let var_query = DataQuery.newIfNull(query: query)
        return try self.fetchPackagesType(matching: var_query.withKey(PackagesType.key(packageID: packageID)), headers: headers, options: options)
    }

    open func fetchPackagesTypeWithKey(packageID: String?, query: DataQuery?, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (PackagesType?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result = try self.fetchPackagesTypeWithKey(packageID: packageID, query: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open override var metadataLock: MetadataLock {
        return DeliveryServiceMetadata.lock
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadataWithLock(service: self, fetcher: nil, options: DeliveryServiceMetadataParser.options, mergeAction: { DeliveryServiceMetadataChanges.merge(metadata: self.metadata) })
        }
    }
}
