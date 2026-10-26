import 'package:flutter/services.dart';

class ZynovaVpnService {
  static const MethodChannel _channel =
      MethodChannel('com.zynova.vpn/control');

  static Future<bool> requestVpnPermission() async {
    try {
      final result =
          await _channel.invokeMethod<bool>('requestVpnPermission');
      return result ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  static Future<bool> hasVpnPermission() async {
    try {
      final result =
          await _channel.invokeMethod<bool>('checkVpnPermission');
      return result ?? false;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }
}
