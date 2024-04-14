//
//  File.swift
//  
//
//  Created by Vince Davis on 4/13/24.
//

#if os(iOS) || os(macOS) || os(visionOS)
import UniformTypeIdentifiers
import CoreSpotlight
#endif

public struct Spotlight {
    static public func testIndex() {
        #if os(iOS) || os(macOS) || os(visionOS)
        let attributeSet = CSSearchableItemAttributeSet(contentType: UTType.text)
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
        #endif
    }
    
    static public func deIndex() {
        #if os(iOS) || os(macOS) || os(visionOS)
        CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: ["1"]) { error in
            if let error = error {
                print("Deindexing error: \(error.localizedDescription)")
            } else {
                print("Search item successfully removed!")
            }
        }
        #endif
    }
}
