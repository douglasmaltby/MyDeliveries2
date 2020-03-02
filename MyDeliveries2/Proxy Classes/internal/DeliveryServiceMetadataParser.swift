// # Proxy Compiler 19.9.2-46cb48-20191112

import Foundation
import SAPOData

internal class DeliveryServiceMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = DeliveryServiceMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = DeliveryServiceMetadataParser.options
        let metadata = parser.parseInProxy(DeliveryServiceMetadataText.xml, url: "codejam.wwdc.services.DeliveryService")
        metadata.proxyVersion = "19.9.2-46cb48-20191112"
        return metadata
    }
}
