import Foundation
import MobileCoreServices
import CoreSpotlight
import SwiftUI

public class Heroes {
    public init() {}
    
    public var test: String = "Testing"
    
    public func testIndex() {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
        attributeSet.title = "Swift Heroes Index"
        attributeSet.contentDescription = "My test of the index"

        let item = CSSearchableItem(uniqueIdentifier: "1", domainIdentifier: "com.swiftheroes", attributeSet: attributeSet)
        CSSearchableIndex.default().indexSearchableItems([item]) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully indexed!")
            }
        }
    }
    
    public func deIndex() {
        CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: ["1"]) { error in
            if let error = error {
                print("Deindexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully removed!")
            }
        }
    }
}
