import 'package:package_info/package_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAppVersionProvider = FutureProvider<String>(
  (ref) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final appVersion = packageInfo.version;
    return appVersion;
  },
);
