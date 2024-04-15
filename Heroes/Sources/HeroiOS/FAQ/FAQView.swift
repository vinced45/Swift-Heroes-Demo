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

struct FAQView: View {
    @State private var faqService = FAQService("https://vinced45.github.io/Swift-Heroes-Demo/")
    @State private var groupedByLevel =  [Int: [FAQ]]()
    @Environment(\.dismiss) private var dismiss
    func levelString(_ level: Int) -> String {
        switch level {
        case 1:
            "App Information"
        case 2:
            "More..."
        case 3:
            "Level 3 Title"
        case 4:
            "Level 4 Title"
        default:
            "Level 5 Title"
        }
    }
    var body: some View {
        NavigationStack {
            Group {
                if faqService.loading {
                    ProgressView()
                } else {
                    List {
                        ForEach(groupedByLevel.keys.sorted(), id: \.self) { key in
                            Section(header: Text(levelString(key))) {
                                ForEach(groupedByLevel[key]!) { faq in
                                    QuestionView(faq: faq, baseURL: faqService.baseURL)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("FAQ")
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
        }
        .task {
            await faqService.fetchFAQs()
            groupedByLevel =
            Dictionary(grouping: faqService.faqs.sorted(using: KeyPathComparator(\.sortOrder)), by: { $0.level })
        }
    }
}

struct QuestionView: View {
    @State private var showAnswer = false
    @State private var showWebView = false
    @Environment(\.dismiss) private var dismiss
    let faq: FAQ
    let baseURL: URL
    var body: some View {
        DisclosureGroup(
            isExpanded: $showAnswer,
            content: {
                VStack(alignment: .leading) {
                    Text(faq.answer)
                        .foregroundStyle(.secondary)
                    if let link = faq.link {
                        if faq.linkType != FAQ.FAQLinkType.external.rawValue {
                            Button {
                                showWebView.toggle()
                            } label: {
                                Text(link.title)
                            }
                            .buttonStyle(.bordered)
                            .sheet(isPresented: $showWebView) {
#if os(iOS)
                                VStack {
                                    FAQWebView(url: faq.linkURL(baseURL: baseURL)!)
                                    Button("Dismiss") {
                                        showWebView = false
                                    }
                                    .buttonStyle(.bordered)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                }
#else
                                VStack {
                                    FAQWebView(url: faq.linkURL(baseURL: baseURL)!)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Text("Press escape to exit view")
                                        .padding()
                                }
                                .frame(
                                    minWidth: 800,
                                    idealWidth: 800,
                                    maxWidth: .infinity,
                                    minHeight: 600,
                                    idealHeight: 600,
                                    maxHeight: .infinity
                                )
#endif
                            }
                        }
                        
                        else {
                            Link(link.title, destination: faq.linkURL(baseURL: baseURL)!)
                                .buttonStyle(.bordered)
                        }
                    }
                }
                .padding(.leading, 10)
            },
            label: {
                HStack(alignment: .top) {
                    Image(systemName: faq.qImage)
                        .imageScale(.medium)
                    Text(faq.question)
                        .fontWeight(.semibold)
                }
            }
        )
    }
}


#Preview {
    NavigationStack {
        FAQView()
    }
}
