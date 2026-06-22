//
//  GeometryReaderExampleView.swift
//  SwiftUI BaseHelper
//
//  Created by Rodrigo Okido on 09/10/22.
//

import SwiftUI
import DesignSystem

struct GeometryReaderExampleView: View {

    // MARK: - Property Wrappers
    @State private var scrollOffset: CGFloat = 0
    
    // MARK: - Private Properties
    private let maxHeaderHeight: CGFloat = 260
    private let minHeaderHeight: CGFloat = 64

    // MARK: - Computed Properties
    // 0 → header fully expanded
    // 1 → header fully collapsed.
    private var headerProgress: CGFloat {
        min(1, max(0, scrollOffset / (maxHeaderHeight - minHeaderHeight)))
    }

    // MARK: - Content
    var body: some View {
        // The outer GeometryReader gives us the top safe-area
        // inset (status bar + navigation bar). We extend the
        // header under that region so the scrolling track list
        // can never show through the translucent nav bar.
        GeometryReader { outer in
            let topInset = outer.safeAreaInsets.top
            ZStack(alignment: .top) {
                scrollContent(topInset: topInset)
                headerView(topInset: topInset)
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationTitle("Geometry Reader")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Private Views
private extension GeometryReaderExampleView {

    // Current header height, including the top safe-area inset.
    // - Overscrolling down (scrollOffset < 0): stretches past the max height.
    // - Scrolling up: shrinks down to `minHeaderHeight`, never below.
    func headerHeight(topInset: CGFloat) -> CGFloat {
        let expanded = maxHeaderHeight + topInset
        if scrollOffset < 0 {
            return expanded - scrollOffset
        }
        return max(minHeaderHeight + topInset, expanded - scrollOffset)
    }

    func headerView(topInset: CGFloat) -> some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(
                colors: [Color.purple, Color.indigo, Color.blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            Image(systemName: "music.note")
                .resizable()
                .scaledToFit()
                .frame(width: IconSize.huge)
                .foregroundStyle(.white.opacity(OpacityLevel.transparent))
                .offset(x: 60, y: -20)
                .opacity(1 - headerProgress)

            LinearGradient(
                colors: [.clear, .black.opacity(OpacityLevel.medium)],
                startPoint: .center,
                endPoint: .bottom
            )

            VStack(alignment: .leading, spacing: StackSpacing.quarck) {
                Text("Now Playing")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(OpacityLevel.opaque))
                    .opacity(max(0, 1 - headerProgress * 2.5))

                Text("Midnight City")
                    .font(.title2.bold())
                    .foregroundStyle(.white)
                    .lineLimit(1)

                Text("M83 · Hurry Up, We're Dreaming")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(OpacityLevel.opaque))
                    .opacity(max(0, 1 - headerProgress * 2.5))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding([.horizontal, .bottom], InsetSpacing.xxs)
        }
        .frame(maxWidth: .infinity)
        .frame(height: headerHeight(topInset: topInset), alignment: .bottom)
    }

    func scrollContent(topInset: CGFloat) -> some View {
        ScrollView {
            VStack(spacing: 0) {
                // Spacer that reserves the expanded header's space so the
                // track list starts flush with the header's bottom edge.
                Color.clear
                    .frame(height: maxHeaderHeight + topInset)

                VStack(spacing: StackSpacing.quarck) {
                    ForEach(sampleTracks.indices, id: \.self) { index in
                        trackRow(title: sampleTracks[index], index: index)
                    }
                }
                .padding(.horizontal, InsetSpacing.xxs)
                .padding(.vertical, InsetSpacing.nano)
            }
        }
        // Reliable scroll-offset source on iOS 18+. `contentOffset.y` sits at
        // `-contentInsets.top` at rest, so adding the inset gives 0 at rest,
        // positive while scrolling up (header shrinks), negative on overscroll
        // (header stretches).
        .onScrollGeometryChange(for: CGFloat.self) { geometry in
            geometry.contentOffset.y + geometry.contentInsets.top
        } action: { _, newValue in
            scrollOffset = newValue
        }
    }

    func trackRow(title: String, index: Int) -> some View {
        HStack(spacing: StackSpacing.nano) {
            RoundedRectangle(cornerRadius: CornerRadius.sm)
                .fill(
                    LinearGradient(
                        colors: [.purple.opacity(0.7), .blue.opacity(0.5)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: HeightSize.xl, height: HeightSize.xl)
                .overlay {
                    Image(systemName: "music.note")
                        .foregroundStyle(.white)
                        .font(.body)
                }

            VStack(alignment: .leading, spacing: StackSpacing.quarck) {
                Text(title)
                    .font(.headline)
                    .lineLimit(1)

                Text("M83 · Hurry Up, We're Dreaming")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer()

            Text("\(2 + (index % 4)):\(String(format: "%02d", 10 + (index * 7) % 50))")
                .font(.caption)
                .foregroundStyle(.secondary)

            Button { } label: {
                Image(systemName: "ellipsis")
                    .foregroundStyle(.secondary)
                    .padding(InsetSpacing.nano)
            }
        }
        .padding(InsetSpacing.nano)
    }

    var sampleTracks: [String] {
        [
            "Midnight City",
            "Outro",
            "Reunion",
            "Wait",
            "New Map",
            "Claudia Lewis",
            "Steve McQueen",
            "Raconte-Moi une Histoire",
            "OK Pal",
            "Splendor",
            "Year One, One UFO"
        ]
    }
}

#Preview {
    NavigationStack {
        GeometryReaderExampleView()
    }
}
