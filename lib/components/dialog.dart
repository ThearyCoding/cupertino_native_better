import '../cupertino_native_platform_interface.dart';

/// Button action returned from [CNDialog.show].
enum CNDialogAction {
  /// The primary/confirm button.
  primary,

  /// The secondary button.
  secondary,

  /// The cancel button.
  cancel,
}


/// Style for dialog actions.
enum CNDialogActionStyle {
  /// Regular action.
  normal,

  /// Destructive action.
  destructive,
}

/// Native alert dialog helper.
///
/// This uses `UIAlertController` on iOS and `NSAlert` on macOS through
/// the plugin method channel.
class CNDialog {
  CNDialog._();

  /// Shows a native alert dialog.
  ///
  /// Returns the action that was tapped, or `null` if the dialog could not be shown.
  static Future<CNDialogAction?> show({
    required String title,
    String? message,
    String primaryButtonText = 'OK',
    String? secondaryButtonText,
    String? cancelButtonText = 'Cancel',
    CNDialogActionStyle primaryButtonStyle = CNDialogActionStyle.normal,
    CNDialogActionStyle secondaryButtonStyle = CNDialogActionStyle.normal,
    CNDialogAction? preferredAction,
  }) async {
    final actionId = await CupertinoNativePlatform.instance.showNativeDialog(
      title: title,
      message: message,
      primaryButtonText: primaryButtonText,
      secondaryButtonText: secondaryButtonText,
      cancelButtonText: cancelButtonText,
      primaryButtonStyle: primaryButtonStyle.name,
      secondaryButtonStyle: secondaryButtonStyle.name,
      preferredAction: preferredAction?.name,
    );

    switch (actionId) {
      case 'primary':
        return CNDialogAction.primary;
      case 'secondary':
        return CNDialogAction.secondary;
      case 'cancel':
        return CNDialogAction.cancel;
      default:
        return null;
    }
  }
}
