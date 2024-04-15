//
// Created for FAQ JSONGenerator
//
// Follow me on Mastodon: @StewartLynch@iosdev.space
// Follow me on Threads: @StewartLynch (https://www.threads.net)
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch


import Foundation

@Observable
class FAQService {
    var faqs: [FAQ] = []
    var loading = false
    let jsonURLString: String
    init(base: String, appName: String) {
        let supportedLanguages: [String] = ["en", "it"]
        let locale = supportedLanguages.contains(where: NSLocale.current.identifier.contains) ? NSLocale.current.identifier : "en"
        
        self.jsonURLString = "\(base)\(locale)/\(appName).json"
    }
    var jsonURL: URL {
        URL(string: jsonURLString)!
    }
    
    var baseURL: URL {
        jsonURL.deletingLastPathComponent()
    }
    
    var baseURLString: String {
        baseURL.absoluteString
    }
    
    func fetchFAQs() async {
        do {
            let (data, _) = try  await URLSession.shared.data(from: URL(string: jsonURLString)!)
            faqs = try JSONDecoder().decode(
                [FAQ].self,
                from: data
            )
            loading = false
        } catch {
            print("Could not decode")
            loading = false
        }
    }
}
