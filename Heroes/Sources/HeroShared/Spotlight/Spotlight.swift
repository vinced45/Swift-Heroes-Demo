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
#if os(iOS)
import UIKit
#endif

public struct Spotlight {
    @MainActor
    static public func indexSpeakers() async -> Bool {
        await withCheckedContinuation { continuation in
            Spotlight.indexSpeakers(){ success in
                continuation.resume(returning: success)
            }
        }
    }
    
    static public func deIndexSpeakers() async -> Bool {
        await withCheckedContinuation { continuation in
            Spotlight.deIndexSpeakers(){ success in
                continuation.resume(returning: success)
            }
        }
    }
    
//    static public func handleUserActivity(_ userActivity: NSUserActivity) {
//        
//    }
}

private extension Spotlight {
    @MainActor
    static private func indexSpeakers(completion: @escaping (Bool) -> Void) {
        #if os(iOS) || os(macOS) || os(visionOS)
        
        let items = Speaker.all.map({
            let attributeSet = CSSearchableItemAttributeSet(contentType: UTType.text)
            attributeSet.title = $0.name
            attributeSet.contentDescription = $0.subtitle
            #if os(iOS)
            if let image = $0.image.getUIImage(newSize: .init(width: 30, height: 30)),
               let data = image.jpegData(compressionQuality: 1.0) {
                attributeSet.thumbnailData = data
            }
            attributeSet.actionIdentifiers = ["CS_ACTION_1"]
            #endif
            
            return CSSearchableItem(uniqueIdentifier: $0.id, domainIdentifier: "com.swiftheroes", attributeSet: attributeSet)
        })
        
        CSSearchableIndex.default().indexSearchableItems(items) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Search item successfully indexed!")
                completion(true)
            }
        }
        #endif
    }
    
    static private func deIndexSpeakers(completion: @escaping (Bool) -> Void) {
        #if os(iOS) || os(macOS) || os(visionOS)
        let identifiers = Speaker.all.map({ $0.id })
        CSSearchableIndex.default().deleteSearchableItems(withIdentifiers: identifiers) { error in
            if let error = error {
                print("Deindexing error: \(error.localizedDescription)")
                completion(false)
            } else {
                print("Search item successfully removed!")
                completion(true)
            }
        }
        #endif
    }
}
