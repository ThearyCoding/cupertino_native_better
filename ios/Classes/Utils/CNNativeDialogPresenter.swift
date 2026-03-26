import Foundation
import Flutter
import UIKit

final class CNNativeDialogPresenter {
  static let shared = CNNativeDialogPresenter()

  private init() {}

  func show(args: [String: Any], result: @escaping FlutterResult) {
    DispatchQueue.main.async {
      guard let title = args["title"] as? String,
            let primaryButtonText = args["primaryButtonText"] as? String else {
        result(
          FlutterError(
            code: "INVALID_ARGS",
            message: "title and primaryButtonText are required",
            details: nil
          )
        )
        return
      }

      guard let presenter = self.topViewController() else {
        result(
          FlutterError(
            code: "NO_PRESENTING_CONTROLLER",
            message: "Could not find a view controller to present dialog",
            details: nil
          )
        )
        return
      }

      let message = args["message"] as? String
      let secondaryButtonText = args["secondaryButtonText"] as? String
      let cancelButtonText = args["cancelButtonText"] as? String
      let type = (args["type"] as? String) ?? "alert"
      let primaryButtonStyle = (args["primaryButtonStyle"] as? String) ?? "normal"
      let secondaryButtonStyle = (args["secondaryButtonStyle"] as? String) ?? "normal"
      let preferredAction = args["preferredAction"] as? String

      let preferredStyle: UIAlertController.Style = type == "actionSheet" ? .actionSheet : .alert
      let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

      let primaryAction = UIAlertAction(
        title: primaryButtonText,
        style: self.actionStyle(from: primaryButtonStyle)
      ) { _ in
        result("primary")
      }
      alert.addAction(primaryAction)

      var secondaryAction: UIAlertAction?
      if let secondaryButtonText {
        let action = UIAlertAction(
          title: secondaryButtonText,
          style: self.actionStyle(from: secondaryButtonStyle)
        ) { _ in
          result("secondary")
        }
        secondaryAction = action
        alert.addAction(action)
      }

      var cancelAction: UIAlertAction?
      if let cancelButtonText {
        let action = UIAlertAction(title: cancelButtonText, style: .cancel) { _ in
          result("cancel")
        }
        cancelAction = action
        alert.addAction(action)
      }

      switch preferredAction {
      case "primary":
        alert.preferredAction = primaryAction
      case "secondary":
        alert.preferredAction = secondaryAction
      case "cancel":
        alert.preferredAction = cancelAction
      default:
        break
      }

      if let popover = alert.popoverPresentationController {
        popover.sourceView = presenter.view
        popover.sourceRect = CGRect(
          x: presenter.view.bounds.midX,
          y: presenter.view.bounds.maxY - 1,
          width: 1,
          height: 1
        )
        popover.permittedArrowDirections = []
      }

      presenter.present(alert, animated: true, completion: nil)
    }
  }

  private func actionStyle(from rawStyle: String) -> UIAlertAction.Style {
    return rawStyle == "destructive" ? .destructive : .default
  }

  private func topViewController() -> UIViewController? {
    guard let scene = UIApplication.shared.connectedScenes
      .compactMap({ $0 as? UIWindowScene })
      .first(where: { $0.activationState == .foregroundActive }) else {
      return UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController
    }

    let root = scene.windows.first(where: \.isKeyWindow)?.rootViewController
    return topViewController(from: root)
  }

  private func topViewController(from root: UIViewController?) -> UIViewController? {
    guard let root else { return nil }

    if let presented = root.presentedViewController {
      return topViewController(from: presented)
    }

    if let nav = root as? UINavigationController {
      return topViewController(from: nav.visibleViewController)
    }

    if let tab = root as? UITabBarController {
      return topViewController(from: tab.selectedViewController)
    }

    return root
  }
}
