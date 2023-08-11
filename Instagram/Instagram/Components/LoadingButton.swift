//
//  LoadingButton.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 25.07.2023.
//

import SwiftUI

struct LoadingButton: View {
    class Model: ObservableObject {
        @Published var title: String = String()
        @Published var isLoading: Bool = false
        @Published var isDisabled: Bool = false
    }
    
    class Style: ObservableObject {
        @Published var content: ContentStyleModifier = ContentStyleModifier()
        @Published var title: TitleStyleModifier = TitleStyleModifier()
        @Published var progress: ProgressStyleModifier = ProgressStyleModifier()
    }
    
    @ObservedObject var model: Model
    @ObservedObject var style: Style
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Button {
                self.action?()
            } label: {
                if self.model.isLoading {
                    self.setupProgressView()
                } else {
                    self.setupTitle()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .disabled(self.model.isDisabled)
        }
        .modifier(self.style.content)
    }
    
    @ViewBuilder func setupProgressView() -> some View {
        ProgressView()
            .modifier(self.style.progress)
            .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder func setupTitle() -> some View {
        Text(self.model.title)
            .modifier(self.style.title)
            .frame(maxWidth: .infinity)
    }
}

extension LoadingButton {
    struct TitleStyleModifier: ViewModifier {
        var color: Color = .white
        var font: Font = .title2
        var alignment: Alignment = .center
        
        var padding: EdgeInsets = EdgeInsets()
        
        func body(content: Content) -> some View {
            content
                .foregroundColor(self.color)
                .font(self.font)
                .padding(self.padding)
                .frame(maxWidth: .infinity, alignment: self.alignment)
        }
    }
    
    struct ContentStyleModifier: ViewModifier {
        var background: Color = .white
        var cornerRadius: CGFloat = CGFloat.zero
        
        func body(content: Content) -> some View {
            content
                .background(self.background)
                .cornerRadius(self.cornerRadius)
        }
    }
    
    struct ProgressStyleModifier: ViewModifier {
        var color: Color = .white
        
        func body(content: Content) -> some View {
            content
                .tint(self.color)
        }
    }
}

struct LoadingButton_Previews: PreviewProvider {
    static var previews: some View {
        LoadingButton(model: LoadingButton.Model(), style: LoadingButton.Style())
    }
}
