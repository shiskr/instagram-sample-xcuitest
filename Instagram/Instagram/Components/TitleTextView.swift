//
//  TitleTextView.swift
//  Instagram
//
//  Created by Cristian Crasneanu on 25.07.2023.
//

import SwiftUI

struct TitleTextFieldView: View {
    class Model: ObservableObject {
        @Published var title: String = String()
        @Published var text: String = String()
        @Published var error: String = String()
        
        @Published var placeholder: String = String()
        
        @Published var isSecure: Bool = false
        @Published var state: State = .normal
    }
    
    class Style: ObservableObject {
        @Published var title: TextStyleModifier = TextStyleModifier()
        @Published var text: TextFieldStyleModifier = TextFieldStyleModifier()
        @Published var error: TextStyleModifier = TextStyleModifier()
    }
    
    public enum State {
        case normal
        case error
    }
    
    @ObservedObject var model: Model
    @ObservedObject var style: Style
    
    var onTextChanged: ((_ text: String) -> Void)?
    var onSubmit: (() -> Void)?
    
    var body: some View {
        VStack {
            self.setupTitle()
            self.setupText()
            self.setupErrorText()
        }
    }
    
    @ViewBuilder func setupTitle() -> some View {
        if !self.model.title.isEmpty {
            Text(self.model.error)
                .modifier(self.style.title)
                .frame(maxWidth: .infinity, alignment: .leading)
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder func setupText() -> some View {
        if self.model.isSecure {
            self.setupSecureTextField()
        } else {
            self.setupTextField()
        }
    }
    
    @ViewBuilder func setupTextField() -> some View {
        TextField(self.model.placeholder, text: self.$model.text)
            .modifier(self.style.text)
            .onChange(of: self.model.text) { text in
                self.onTextChanged?(text)
            }
            .onSubmit {
                self.onSubmit?()
            }
    }
    
    @ViewBuilder func setupSecureTextField() -> some View {
        SecureField(self.model.placeholder, text: self.$model.text)
            .modifier(self.style.text)
            .onChange(of: self.model.text) { text in
                self.onTextChanged?(text)
            }
            .onSubmit {
                self.onSubmit?()
            }
    }
    
    @ViewBuilder func setupErrorText() -> some View {
        if self.model.state == .error  {
            Text(self.model.error)
                .modifier(self.style.error)
                .frame(maxWidth: .infinity, alignment: .leading)
        } else {
            EmptyView()
        }
    }
}
extension TitleTextFieldView {
    struct TextStyleModifier: ViewModifier {
        var font: Font = .title
        var color: Color = .black
        var padding: EdgeInsets = EdgeInsets()
        var alignment: TextAlignment = .leading
        
        func body(content: Content) -> some View {
            content
                .font(self.font)
                .foregroundColor(self.color)
                .multilineTextAlignment(self.alignment)
                .padding(self.padding)
        }
    }
    
    struct TextFieldStyleModifier: ViewModifier {
        var autocapitalization: UITextAutocapitalizationType = .none
        var font: Font = .title
        var color: Color = .black
        var padding: EdgeInsets = EdgeInsets()
        var background: Color = .white
        var cornerRadius: CGFloat = CGFloat.zero
        var keyboardType:  UIKeyboardType = .default
        var submitLabel:  SubmitLabel = .return
        
        func body(content: Content) -> some View {
            content
                .autocapitalization(self.autocapitalization)
                .font(self.font)
                .foregroundColor(self.color)
                .padding(self.padding)
                .background(self.background)
                .cornerRadius(self.cornerRadius)
                .keyboardType(self.keyboardType)
                .submitLabel(self.submitLabel)
        }
    }
}

struct TitleTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TitleTextFieldView(model: TitleTextFieldView.Model(), style: TitleTextFieldView.Style())
    }
}
