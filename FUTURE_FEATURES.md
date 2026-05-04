# Cupertino Native Better

Native iOS 26+ Liquid Glass widgets for Flutter.

This library provides native Cupertino widgets that leverage Apple's
Liquid Glass design language introduced in iOS 26. All widgets automatically
fall back to standard Cupertino or Material widgets on older platforms.

---

## Getting Started

Just import and use — no initialization required:

```dart
import 'package:cupertino_native_better/cupertino_native_better.dart';

void main() {
  runApp(MyApp());
}
```

Platform version detection is handled automatically on first access.

---

## Available Widgets

- **CNButton** – Native push button with Liquid Glass effects  
- **CNIcon** – Platform-rendered SF Symbols and custom icons  
- **CNTabBar** – Native tab bar with split mode support  
- **CNSlider** – Native slider with controller support  
- **CNSwitch** – Native toggle switch  
- **CNPopupMenuButton** – Native popup menu  
- **CNSegmentedControl** – Native segmented control  
- **CNGlassButtonGroup** – Grouped buttons with unified glass effects  
- **CNSearchBar** – Expandable search bar with animations  
- **CNToast** – Toast notifications with glass effects  
- **CNDialog** – Native dialog/alert with Liquid Glass styling  
- **LiquidGlassContainer** – Apply glass effects to any widget  

---

## Dialog (CNDialog)

A fully native dialog system that adapts to platform conventions and
leverages Apple’s Liquid Glass design on supported versions.

### Platform Behavior

- **iOS 26+ / macOS 26+**
  - Native system dialogs with Liquid Glass effects

- **iOS < 26 / macOS < 26**
  - Falls back to Cupertino dialogs

- **Android / Others**
  - Falls back to Material dialogs

---

### Features

- Native alert dialogs and action sheets  
- Liquid Glass blur background (supported platforms)  
- Smooth system animations  
- Adaptive UI across platforms  
- Supports cancel, destructive, and default actions  
- Custom title, content, and actions  

---

### Basic Example

```dart
CNDialog.show(
  context: context,
  title: Text('Delete Item'),
  content: Text('Are you sure you want to delete this item?'),
  actions: [
    CNDialogAction(
      label: 'Cancel',
      isCancel: true,
      onPressed: () => Navigator.pop(context),
    ),
    CNDialogAction(
      label: 'Delete',
      isDestructive: true,
      onPressed: () {
        // handle delete
      },
    ),
  ],
);
```

---

### Action Sheet Example

```dart
CNDialog.showActionSheet(
  context: context,
  title: Text('Choose Option'),
  actions: [
    CNDialogAction(
      label: 'Edit',
      onPressed: () {},
    ),
    CNDialogAction(
      label: 'Delete',
      isDestructive: true,
      onPressed: () {},
    ),
  ],
  cancelAction: CNDialogAction(
    label: 'Cancel',
    isCancel: true,
    onPressed: () {},
  ),
);
```

---

### Notes

- Use `isDestructive` for dangerous actions (red styling)  
- Use `isCancel` for dismissal actions  
- Automatically handles safe areas and focus  
- Matches native system behavior closely  

---

## Platform Support

| Feature        | iOS 26+ | iOS < 26 | macOS 26+ | macOS < 26 | Other |
|---------------|--------|----------|-----------|------------|-------|
| Liquid Glass  | Native | Fallback | Native    | Fallback   | Material |
| SF Symbols    | Native | Native   | Native    | Native     | Flutter Icon |

---

## Key Features

- Reliable OS version detection (no platform channel issues)  
- Automatic fallback system  
- Native-level UI fidelity  
- Dark mode support  
- Glass effect composition (unioning)  

---

# Future Features Roadmap

This document tracks planned features prioritized by demand and complexity.

---

## Tier 1: Must-Have

| # | Component | Customizability | Complexity | Status | Notes |
|---|----------|----------------|------------|--------|------|
| 1 | CNNavigationBar | High | Medium | Planned | Large title + scroll shrink |
| 2 | CNTextField | High | Medium | Planned | Glass input + animations |
| 3 | CNSheet | High | Medium-High | Planned | Detents support |
| 4 | CNDialog | Medium | Low | Planned | Native dialogs |
| 5 | CNActionSheet | Medium | Low | Planned | Destructive actions |

---

## Tier 2: High Value

| # | Component | Customizability | Complexity | Status | Notes |
|---|----------|----------------|------------|--------|------|
| 6 | CNContextMenu | High | Medium | Planned | Long-press preview |
| 7 | CNPicker | Medium | Medium | Planned | Glass wheel picker |
| 8 | CNDatePicker | Medium | Medium | Planned | Date/time picker |
| 9 | CNProgressIndicator | Medium | Low | Planned | Circular & linear |
| 10 | CNToolbar | High | Medium | Planned | Glass toolbar union |

---

## Tier 3: Nice-to-Have

| # | Component | Customizability | Complexity | Status | Notes |
|---|----------|----------------|------------|--------|------|
| 11 | CNStepper | Low | Low | Planned | +/- increment |
| 12 | CNPageControl | Low | Low | Planned | Carousel dots |
| 13 | CNColorPicker | High | High | Planned | iOS 14+ color picker |
| 14 | CNRefreshControl | Medium | Medium | Planned | Pull-to-refresh |
| 15 | CNListTile | High | Medium | Planned | Glass list cells |

---

## Tier 4: Advanced

| # | Component | Customizability | Complexity | Status | Notes |
|---|----------|----------------|------------|--------|------|
| 16 | CNHapticFeedback | Low | Low | Planned | Native haptic wrapper |
| 17 | CNTipKit | High | High | Planned | iOS 17+ tooltips |
| 18 | CNScrollView | High | High | Planned | Native scroll physics |
| 19 | CNMenu | Medium | Medium | Planned | iOS 14+ pull-down menus |

---

## Implementation Details

### CNNavigationBar
- iOS API: `UINavigationBar` with iOS 26 appearance  
- SwiftUI: `NavigationStack` with `navigationBarTitleDisplayMode`  
- Features:
  - Large title collapses on scroll  
  - Glass blur background  
  - Custom back button  
  - Trailing actions  
  - Search integration  

### CNTextField
- iOS API: `UITextField`  
- SwiftUI: `TextField`  
- Features:
  - Glass container on focus  
  - Animated placeholder  
  - Clear button  
  - Secure entry option  
  - Custom keyboard types  

### CNSheet
- iOS API: `UISheetPresentationController`  
- SwiftUI: `.sheet` with `presentationDetents`  
- Features:
  - Multiple detents  
  - Drag indicator  
  - Dismiss on drag  
  - Glass background  
  - Scrollable content  

### CNContextMenu
- iOS API: `UIContextMenuInteraction`  
- SwiftUI: `contextMenu`  
- Features:
  - Preview with blur  
  - Nested menus  
  - SF Symbols support  
  - Destructive styling  

### CNProgressIndicator
- iOS API: `UIActivityIndicatorView` / `UIProgressView`  
- SwiftUI: `ProgressView`  
- Features:
  - Circular & linear  
  - Determinate / indeterminate  
  - Custom tint colors  

---

## Tab Bar Enhancements

### CNTabBar Search Tab
- Status: Implemented in v1.2.0  
- Features:
  - Native search role  
  - Floating search button  
  - Animated expansion  
  - Tab collapse during search  
  - Programmatic control  

### CNTabBar Bottom Accessory (Future)
- iOS API: `tabViewBottomAccessory()`  
- Features:
  - Now Playing style  
  - Inline / expanded states  
  - Glass effect integration  

---

## iOS 26 APIs

### Tab Bar Minimize Behavior
```swift
TabView { ... }
    .tabBarMinimizeBehavior(.onScrollDown)
```

### Glass Effect Modifiers
```swift
.glassEffect(.regular)
.glassEffect(.prominent)
.glassEffect(.regular.interactive())
```

### Search Toolbar Behavior
```swift
.searchToolbarBehavior(.minimize)
```

---

## Sources & References

- [Apple: iOS 26 Liquid Glass Design](https://www.apple.com/newsroom/2025/06/apple-introduces-a-delightful-and-elegant-new-software-design/)  
- [Donny Wals: Tab Bars on iOS 26](https://www.donnywals.com/exploring-tab-bars-on-ios-26-with-liquid-glass/)  
- [Nil Coalescing: SwiftUI Search iOS 26](https://nilcoalescing.com/blog/SwiftUISearchEnhancementsIniOSAndiPadOS26/)  
- [Seb Vidal: What's New in UIKit 26](https://sebvidal.com/blog/whats-new-in-uikit-26/)  
- [Apple Developer: Tab Navigation](https://developer.apple.com/documentation/swiftui/enhancing-your-app-content-with-tab-navigation)  
- [WWDC25: Build UIKit App with Liquid Glass](https://developer.apple.com/videos/play/wwdc2025/284/)  

---

## Contributing

1. Research iOS 26 APIs  
2. Plan intuitive Flutter API  
3. Implement Swift/SwiftUI for iOS 26+  
4. Fallback to Cupertino on older iOS  
5. Test on iOS 26+ and older versions  
6. Document with examples  

---

*Last updated: December 2025*