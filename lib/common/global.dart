import 'package:get/get.dart';
import 'package:telegram_client/telegram_client.dart';

import 'controller/telegram/tdlib_config.dart';

final config = Get.put(TdlibConfig());

class Global extends GetxController {
  // LibTdJson lib = LibTdJson(clientOption: {
  //   'api_id': 27904791,
  //   'api_hash': '6199f745713e2cc3bbf97f623531556e',
  //   'database_directory': "$path/user/",
  //   'files_directory': "$path/user/",
  // });

  Tdlib tg = Tdlib(clientOption: {
    'api_id': TdlibConfig.api_id,
    'api_hash': TdlibConfig.api_hash,
    'database_directory': "${config.path}/user/",
    'files_directory': "${config.path}/user/",
    'system_language_code': 'en',
  });
  // tg.on("update", (update) => print(update.raw));
}
