//
//  mailSend.swift
//  CoffeeLeg
//
//  Created by Hakan Sezer on 8.01.2024.
//

import Foundation
import MessageUI
import SwiftUI

// GastureTap Email.
struct MailComposeView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if MFMailComposeViewController.canSendMail() {
            let mailComposeViewController = MFMailComposeViewController()
            mailComposeViewController.setToRecipients(["hakanszer1@gmail.com"])
            mailComposeViewController.setSubject("Feedback")
            mailComposeViewController.mailComposeDelegate = context.coordinator
            uiViewController.present(mailComposeViewController, animated: true, completion: nil)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true, completion: nil)
        }
    }
}
