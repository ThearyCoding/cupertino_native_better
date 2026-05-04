/// Native iOS 26+ Liquid Glass widgets for Flutter.
///
/// This library provides native Cupertino widgets that leverage Apple's
/// Liquid Glass design language introduced in iOS 26. All widgets automatically
/// fall back to standard Cupertino or Material widgets on older platforms.
///
/// ## Getting Started
///
/// Just import and use! No initialization required:
///
/// ```dart
/// import 'package:cupertino_native_better/cupertino_native_better.dart';
///
/// void main() {
///   runApp(MyApp());
/// }
/// ```
///
/// PlatformVersion now auto-initializes on first access.
///
/// ## Available Widgets
///
/// - [CNButton] - Native push button with Liquid Glass effects
/// - [CNIcon] - Platform-rendered SF Symbols and custom icons
/// - [CNTabBar] - Native tab bar with split mode support
/// - [CNSlider] - Native slider with controller support
/// - [CNSwitch] - Native toggle switch
/// - [CNPopupMenuButton] - Native popup menu
/// - [CNSegmentedControl] - Native segmented control
/// - [CNGlassButtonGroup] - Grouped buttons with unified glass effects
/// - [CNSearchBar] - Expandable search bar with animations
/// - [CNToast] - Toast notifications with glass effects
/// - [CNDialog] - Native dialog/alert with Liquid Glass styling and platform-adaptive presentation
/// - [LiquidGlassContainer] - Apply glass effects to any widget
///
/// ## Dialog (CNDialog)
///
/// A fully native dialog component that automatically adapts to platform conventions:
///
/// - **iOS 26+ / macOS 26+**: Uses native system dialogs with Liquid Glass effects,
///   matching Apple's latest design language.
/// - **iOS < 26 / macOS < 26**: Falls back to Cupertino-style alert dialogs.
/// - **Other platforms**: Falls back to Material dialogs.
///
/// ### Features
///
/// - Native alert and action sheet presentation
/// - Smooth animations and transitions from the system UI
/// - Automatic dark mode and theme synchronization
/// - Configurable title, message, and actions
/// - Supports both blocking dialogs and non-blocking sheets
///
/// ### Example
///
/// ```dart
/// CNDialog.show(
///   context: context,
///   title: Text('Delete Item'),
///   content: Text('Are you sure you want to delete this item?'),
///   actions: [
///     CNDialogAction(
///       label: 'Cancel',
///       onPressed: () => Navigator.pop(context),
///     ),
///     CNDialogAction(
///       label: 'Delete',
///       isDestructive: true,
///       onPressed: () {
///         // Handle delete
///       },
///     ),
///   ],
/// );
/// ```
///
/// ## Platform Support
///
/// | Feature | iOS 26+ | iOS < 26 | macOS 26+ | macOS < 26 | Other |
/// |---------|---------|----------|-----------|------------|-------|
/// | Liquid Glass | Native | Cupertino fallback | Native | Cupertino fallback | Material fallback |
/// | SF Symbols | Native | Native | Native | Native | Flutter Icon |
///
/// ## Key Features
///
/// - **Reliable Version Detection**: Uses `Platform.operatingSystemVersion`
///   parsing instead of platform channels, fixing release build issues.
/// - **Comprehensive Fallbacks**: Every widget gracefully degrades on older OS versions.
/// - **Multiple Icon Types**: SF Symbols, custom IconData, and image assets.
/// - **Dark Mode Support**: Automatic theme synchronization.
/// - **Glass Effect Unioning**: Multiple buttons can share unified glass effects.
library;

// Platform interface
export 'cupertino_native_platform_interface.dart';
export 'cupertino_native_method_channel.dart';

// Components
export 'components/button.dart';
export 'components/icon.dart';
export 'components/slider.dart';
export 'components/switch.dart';
export 'components/tab_bar.dart';
export 'components/native_tab_bar.dart';
export 'components/popup_menu_button.dart';
export 'components/popup_gesture.dart';
export 'components/segmented_control.dart';
export 'components/glass_button_group.dart';
export 'components/liquid_glass_container.dart';
export 'components/search_bar.dart';
export 'components/toast.dart';
export 'components/floating_island.dart';
export 'components/search_scaffold.dart';
export 'components/dialog.dart';
export 'components/experimental/glass_card.dart';

// Styles
export 'style/button_style.dart';
export 'style/button_data.dart';
export 'style/sf_symbol.dart';
export 'style/image_placement.dart';
export 'style/glass_effect.dart';
export 'style/spotlight_mode.dart';
export 'style/tab_bar_search_item.dart';

// Utilities
export 'utils/platform_view_guard.dart';
export 'utils/version_detector.dart';
export 'utils/theme_helper.dart';

import 'cupertino_native_platform_interface.dart';

/// Top-level facade for simple plugin interactions.
///
/// Use this class for low-level platform interactions. Most users should
/// use the widget components directly instead.
class CupertinoNativeBetter {
  /// Returns the platform version string from the native implementation.
  ///
  /// This is primarily useful for debugging. For version checks, use
  /// [PlatformVersion] instead.
  Future<String?> getPlatformVersion() {
    return CupertinoNativePlatform.instance.getPlatformVersion();
  }
}
