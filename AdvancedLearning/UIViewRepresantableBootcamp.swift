//
//  UIViewRepresantableBootcamp.swift
//  AdvancedLearning
//
//  Created by yunus olgun on 21.04.2025.
//

import SwiftUI

struct UIViewRepresantableBootcamp: View {
    
    @State private var text = ""
    
    var body: some View {
        VStack {
            Text(text)
            TextField("Type here...", text: $text)
                .frame(height: 55)
                .background(Color.gray)
            
            UITextFieldViewRepresantable(text: $text)
                .frame(height: 55)
                .background(Color.gray)
        }
    }
}

#Preview {
    UIViewRepresantableBootcamp()
}

struct UITextFieldViewRepresantable: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField {
        let textfield = getTextField()
        textfield.delegate = context.coordinator
        return textfield
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let textfield = UITextField(frame: .zero)
        
        let placeholder = NSAttributedString(string: "type here...",
                                             attributes: [
                                                .foregroundColor : UIColor.blue
                                             ])
        textfield.attributedPlaceholder = placeholder
        return textfield
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
             text = textField.text ?? ""
        }
    }
    
}


struct BasicUIViewRepresantable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
