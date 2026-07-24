//
//  ChatbotView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 24/07/26.
//

import SwiftUI
import DesignSystem

struct ChatbotView: View {

    // MARK: - Property Wrappers
    @State private var messages: [ChatMessage]
    @State private var draftText: String

    // MARK: - Initializer
    init(messages: [ChatMessage] = ChatMessage.mockConversation,
         draftText: String = "") {
        self.messages = messages
        self.draftText = draftText
    }

    // MARK: - Content
    var body: some View {
        VStack(spacing: StackSpacing.md) {
            ScrollViewReader { proxy in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: StackSpacing.xxs) {
                        ForEach(messages) { message in
                            MessageBubbleView(text: message.text,
                                               backgroundColor: message.backgroundColor,
                                               alignment: message.alignment)
                            .id(message.id)
                        }
                    }
                    .padding(.horizontal, InsetSpacing.md)
                }
                .onChange(of: messages.count) {
                    scrollToLastMessage(using: proxy)
                }
                .task {
                    scrollToLastMessage(using: proxy)
                }
            }
            Divider()
            inputRow
        }
        .padding(.vertical, InsetSpacing.md)
        .navigationTitle("Chatbot")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Content
private extension ChatbotView {

    var inputRow: some View {
        HStack(alignment: .bottom, spacing: StackSpacing.xs) {
            SimpleTextFieldView(style: .bordered,
                                fieldName: "",
                                placeholder: "Type a message...",
                                textContent: $draftText)
            VStack {
                Spacer()
                Button(action: sendDraftMessage) {
                    Image(systemName: "paperplane.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: IconSize.xxs, height: IconSize.xxs)
                        .foregroundStyle(.white)
                        .padding(InsetSpacing.xs)
                        .background(Circle().fill(.blue))
                }
                .accessibilityLabel("Send message")
                Spacer()
            }
        }
        .padding(.horizontal, InsetSpacing.md)
        .background(.gray)
        .frame(height: 30)
    }
}

// MARK: - Private Methods
private extension ChatbotView {

    func sendDraftMessage() {
        let trimmedText = draftText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedText.isEmpty else { return }

        messages.append(ChatMessage(text: trimmedText, alignment: .trailing, backgroundColor: ChatMessage.sentColor))
        draftText = ""
    }

    func scrollToLastMessage(using proxy: ScrollViewProxy) {
        guard let lastMessageID = messages.last?.id else { return }
        withAnimation {
            proxy.scrollTo(lastMessageID, anchor: .bottom)
        }
    }
}

/// Local mock chat message used only to demonstrate `MessageBubbleView` — not a Domain model.
struct ChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let alignment: MessageBubbleAlignment
    let backgroundColor: Color
}

extension ChatMessage {

    static let sentColor: Color = .blue
    static let receivedColor: Color = .gray.opacity(OpacityLevel.transparent)

    static let mockConversation: [ChatMessage] = [
        ChatMessage(text: "Hey! Are we still on for lunch?",
                    alignment: .leading,
                    backgroundColor: receivedColor),
        ChatMessage(text: "Yes, 12:30 works great.",
                    alignment: .trailing,
                    backgroundColor: sentColor),
        ChatMessage(text: "Perfect, see you there!",
                    alignment: .leading,
                    backgroundColor: receivedColor),
        ChatMessage(text: "Awesome, I'll bring the documents we talked about too.",
                    alignment: .trailing,
                    backgroundColor: sentColor)
    ]
}

#Preview {
    NavigationStack {
        ChatbotView()
    }
}
