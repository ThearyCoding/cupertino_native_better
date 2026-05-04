import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cupertino_native_platform_interface.dart';

/// An implementation of [CupertinoNativePlatform] that uses method channels.
class MethodChannelCupertinoNative extends CupertinoNativePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cupertino_native');

  @override
  /// See [CupertinoNativePlatform.getPlatformVersion].
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  /// See [CupertinoNativePlatform.getMajorOSVersion].
  Future<int?> getMajorOSVersion() async {
    final version = await methodChannel.invokeMethod<int>('getMajorOSVersion');
    return version;
  }

  @override
  /// See [CupertinoNativePlatform.beginTransition].
  Future<void> beginTransition() async {
    await methodChannel.invokeMethod<void>('beginTransition');
  }

  @override
  /// See [CupertinoNativePlatform.endTransition].
  Future<void> endTransition() async {
    await methodChannel.invokeMethod<void>('endTransition');
  }

  @override
  /// See [CupertinoNativePlatform.showNativeDialog].
  Future<String?> showNativeDialog({
    required String title,
    String? message,
    required String primaryButtonText,
    String? secondaryButtonText,
    String? cancelButtonText,
    String primaryButtonStyle = 'normal',
    String secondaryButtonStyle = 'normal',
    String? preferredAction,
  }) async {
    final action = await methodChannel
        .invokeMethod<String>('showNativeDialog', {
          'title': title,
          'message': message,
          'primaryButtonText': primaryButtonText,
          'secondaryButtonText': secondaryButtonText,
          'cancelButtonText': cancelButtonText,
          'primaryButtonStyle': primaryButtonStyle,
          'secondaryButtonStyle': secondaryButtonStyle,
          'preferredAction': preferredAction,
        });
    return action;
  }
}
