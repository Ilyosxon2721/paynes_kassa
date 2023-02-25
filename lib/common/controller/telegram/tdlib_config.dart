import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';

class TdlibConfig extends GetxController {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  var path = Directory.current.path;
  WindowsDeviceInfo? info;
  void setDeviceInfo() async {
    info = await deviceInfo.windowsInfo;
    update();
  }

  @override
  void onInit() {
    setDeviceInfo();
    super.onInit();
  }

  static int api_id =
      20672376; // create your own telegram at here https://my.telegram.org/auth
  static String api_hash =
      "4adb8bd4f6fc2f1f8f27db116fc518e5"; // create your own telegram at here https://my.telegram.org/auth
  // static String telegram_database_key =
  //     base64.encode(utf8.encode("azkagram_key"));

  ///
  late String device_model = info?.computerName ?? 'Windows';
  static String version = "v1.0.0";
  static Map client_option = {
    "use_file_database": false,
    "use_chat_info_database": false,
    "use_message_database": false,
    "use_secret_chats": false,
    'enable_storage_optimizer': true,
  };
}

String getTdlib() {
  if (Platform.isWindows) {
    return "libtdjson.dll";
  } else if (Platform.isMacOS || Platform.isIOS) {
    return "libtdjson.dyll";
  }
  return "libtdjson.so";
}
