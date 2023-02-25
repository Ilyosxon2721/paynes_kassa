// import 'dart:async';
// import 'dart:io';
// import 'dart:isolate';
// import 'dart:math';
//
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:tdlib/td_api.dart';
// import 'package:tdlib/tdlib.dart';
//
// import 'telegram_controller.dart';
//
// int _random() => Random().nextInt(10000000);
//
// class GetXTelegramService extends GetxController {
//   late int client;
//   // late StreamController<TdObject> _eventController;
//   // late StreamSubscription<TdObject> _eventReceiver;
//   // late StreamController<TdObject> _eventController;
//   // late StreamSubscription<TdObject> _eventReceiver;
//   Map results = <int, Completer>{};
//   Map callbackResults = <int, Future<void>>{};
//   final telegramController = Get.put(TelegramController());
//   late Directory appDocDir;
//   late Directory appExtDir;
//   final ReceivePort _receivePort = ReceivePort();
//   late Isolate _isolate;
//   @override
//   void onInit() {
//     // _eventController = StreamController();
//     // _eventController.stream.listen(_onEvent);
//     initClient();
//     super.onInit();
//   }
//
//   void initClient() async {
//     client = tdCreate();
//
//     // ignore: unused_local_variable
//     bool storagePermission = await Permission.storage
//         .request()
//         .isGranted; // todo : handel storage permission
//     /*try {
//       PermissionStatus storagePermission =
//           await SimplePermissions.requestPermission(
//               Permission.WriteExternalStorage);
//     } on PlatformException catch (e) {
//       print(e);
//     }
//     */
//     appDocDir = await getApplicationDocumentsDirectory();
//     appExtDir = await getTemporaryDirectory();
//
//     //execute(SetLogStream(logStream: LogStreamEmpty()));
//     execute(const SetLogVerbosityLevel(newVerbosityLevel: 1));
//     tdSend(client, const GetCurrentState());
//     _isolate = await Isolate.spawn(_receive, _receivePort.sendPort,
//         debugName: "isolated receive");
//     _receivePort.listen(_receiver);
//   }
//
//   static _receive(sendPortToMain) async {
//     TdNativePlugin.registerWith();
//     await TdPlugin.initialize();
//     //var x = _rawClient.td_json_client_create();
//     while (true) {
//       final s = TdPlugin.instance.tdReceive();
//       if (s != null) {
//         sendPortToMain.send(s);
//       }
//     }
//   }
//
//   void _receiver(dynamic newEvent) async {
//     final event = convertToObject(newEvent);
//     if (event == null) {
//       return;
//     }
//     if (event is Updates) {
//       for (var event in event.updates) {
//         // _eventController.add(event);
//         telegramController.eventController.add(event);
//         telegramController.client = client;
//       }
//     } else {
//       // _eventController.add(event);
//       telegramController.eventController.add(event);
//     }
//     await _resolveEvent(event);
//   }
//
//   TdObject execute(TdFunction event) => tdExecute(event)!;
//   Future _resolveEvent(event) async {
//     if (event.extra == null) {
//       return;
//     }
//     final int extraId = event.extra;
//     if (results.containsKey(extraId)) {
//       results.remove(extraId).complete(event);
//     } else if (callbackResults.containsKey(extraId)) {
//       await callbackResults.remove(extraId);
//     }
//   }
//
//   void stop() {
//     // _eventController.close();
//     // _eventReceiver.cancel();
//     _receivePort.close();
//     _isolate.kill(priority: Isolate.immediate);
//   }
// }
import 'package:get/get.dart';
import 'package:telegram_client/telegram_client.dart';

import '../../global.dart';

class TelegramService extends GetxController {
  final Tdlib tg = Get.put(Global()).tg;

  void setPhoneNumber(String number) async {
    await tg
        .invoke(
          "setAuthenticationPhoneNumber",
          parameters: {
            "phone_number": number,
          },
          clientId: tg.client_id,
        )
        .then(
          (value) => print(value),
        );
  }
}
