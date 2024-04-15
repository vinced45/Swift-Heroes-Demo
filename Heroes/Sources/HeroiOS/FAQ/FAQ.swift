//
// Created for FAQ JSON Generator
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import SwiftUI

struct FAQ: Codable, Identifiable, Hashable {
    struct Link: Codable, Hashable {
        var title: String
        var url: String
        
    }

    enum FAQLinkType: String, Codable {
        case none
        case image = "Local Image"
        case video = "Local Video"
        case weblink = "Local Link"
        case external = "External Link"
    }
    
    var id = UUID()
    let sortOrder: Int
    let level: Int
    let question: String
    let answer: String
    let linkType: String
    let link: Link?
    
    func linkURL(baseURL: URL) -> URL? {
        if let type = FAQLinkType(rawValue: linkType) , let link {
            switch type {
            case .none:
                 return nil
            case .image:
                return baseURL.appending(path: "media").appending(path: link.url)
            case .video:
                return baseURL.appending(path: "media").appending(path: link.url)
            case .weblink:
                return baseURL.appending(path: "html").appending(path: link.url)
            case .external:
                return URL(string: link.url)!
            }
        } else {
            return nil
        }
    }
    
    var qImage: String {
        if let  linkENum = FAQLinkType(rawValue: linkType) {
            switch linkENum {
            case .none:
                return "quote.opening"
            case .image:
                return "photo.fill"
            case .video:
               return  "video.fill"
            case .weblink:
                return "link"
            case .external:
                return "globe.americas.fill"
            }
        } else {
            return "quote.opening"
        }
    }
    enum CodingKeys: CodingKey {
        case sortOrder, level, question, answer, linkType, link
    }
}


