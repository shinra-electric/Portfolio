//
//  HalfSheetViewHelper.swift
//  HalfSheetModal
//
//  Created by Xianmo on 12/07/2021.
//

// This half modal sheet view is from Kavsoft https://youtu.be/rQKT7tn4uag

import SwiftUI


// custom Half Sheet Modifier
extension View {
    
    // Binding showSheet variable
    func halfSheet<SheetView: View>(showSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping () -> SheetView, onEnd: @escaping () -> ()) -> some View {
        
        return self
            .background(
                HalfSheetHelper(sheetView: sheetView(), showSheet: showSheet, onEnd: onEnd)
            )
        // Using overlay or background as they will automatically use the SwiftUI frame size
        // Note: Overlay didn't work...?
    }
}


// UIKit Integration
struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var showSheet: Bool
    var onEnd: () -> ()
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if showSheet {
            // Present Modal View...
            
            let sheetController = CustomHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        } else {
            // Close view when showSheet is toggled
            uiViewController.dismiss(animated: true)
        }
    }
    
    // On Dismiss
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfSheetHelper
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
            parent.onEnd()
        }
    }
}

// Custom UIHostingController for halfSheet
class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        
//        view.backgroundColor = .clear
        
        //set presentation controller properties
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium(),
                .large()
            ]
            
            // Shows grabber section line at the top of the sheet
            presentationController.prefersGrabberVisible = true
        }
    }
}
