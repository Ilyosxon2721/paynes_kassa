// import 'dart:async';
// import 'dart:math';
//
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:path_provider_windows/path_provider_windows.dart';
// import 'package:tdlib/td_api.dart';
// import 'package:tdlib/td_client.dart';
//
// int _random() => Random().nextInt(10000000);
//
// class TelegramController extends GetxController {
//   final PathProviderWindows provider = PathProviderWindows();
//   DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   int? client;
//   StreamController<TdObject> eventController = StreamController();
//   Map results = <int, Completer>{};
//   Map callbackResults = <int, Future<void>>{};
//   String device = '';
//   String deviceVersion = '';
//   final locale = Get.deviceLocale;
//
//   // TelegramController() {
//   //   eventController.stream.listen(_onEvent);
//   // }
//   @override
//   void onInit() {
//     eventController.stream.listen(_onEvent);
//     setDeviceModel();
//     super.onInit();
//   }
//
//   void setDeviceModel() async {
//     WindowsDeviceInfo info = await deviceInfo.windowsInfo;
//     device = info.computerName;
//     deviceVersion = info.displayVersion;
//   }
//
//   void _onEvent(TdObject event) async {
//     try {
//       print('start on event');
//       if (kDebugMode) {
//         // debugPrint('debug =>>>>>>>> ${event.toJson()}');
//         debugPrint('res =>>>>>>>> ${event.toJson().toString()}');
//         print('constructor =>>>>>>>> ${event.getConstructor()}');
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print('error =>>>>>> $e ${event.getConstructor()}');
//       }
//     }
//
//     switch (event.getConstructor()) {
//       case UpdateAuthorizationState.CONSTRUCTOR:
//         await _authorizationController(
//           (event as UpdateAuthorizationState).authorizationState,
//           event,
//           isOffline: true,
//         );
//         break;
//       case Countries.CONSTRUCTOR:
//         print(Countries.CONSTRUCTOR);
//         break;
//       case UpdateChatThemes.CONSTRUCTOR:
//         if (kDebugMode) {
//           print('UpdateChatThemes');
//         }
//         break;
//       case UpdateOption.CONSTRUCTOR:
//         _updateOptions(event);
//         break;
//       case UpdateUser.CONSTRUCTOR:
//         break;
//       case UpdateNewChat.CONSTRUCTOR:
//         break;
//       case UpdateScopeNotificationSettings.CONSTRUCTOR:
//         break;
//       case Chats.CONSTRUCTOR:
//         break;
//       case Chat.CONSTRUCTOR:
//         final json = event.toJson();
//         final chat = Chat.fromJson(json);
//         break;
//       case ChatListMain.CONSTRUCTOR:
//         break;
//       case UpdateUnreadMessageCount.CONSTRUCTOR:
//         final item = event.toJson();
//         break;
//       case PhoneNumberInfo.CONSTRUCTOR:
//         final phoneInfo = PhoneNumberInfo.fromJson(event.toJson());
//
//         break;
//       case Text.CONSTRUCTOR:
//         break;
//       case TdError.CONSTRUCTOR:
//         _errorController(event);
//         break;
//       default:
//     }
//   }
//
//   Future? _updateOptions(
//     TdObject event,
//   ) async {}
//   Future? _errorController(TdObject event) async {
//     final error = event.toJson();
//     final errorCode = error['code'];
//     final errorMessage = error['message'];
//     switch (errorCode) {
//       case 400:
//         switch (errorMessage) {
//           case 'PHONE_CODE_INVALID':
//             if (kDebugMode) {
//               print('PHONE_CODE_INVALID');
//             }
//
//             break;
//           case 'PHONE_CODE_EXPIRED':
//             if (kDebugMode) {
//               print('PHONE_CODE_EXPIRED');
//             }
//             break;
//           default:
//         }
//         break;
//       case 429:
//         break;
//       default:
//     }
//   }
//
//   Future? _authorizationController(
//     AuthorizationState authState,
//     TdObject event, {
//     bool isOffline = false,
//   }) async {
//     switch (authState.getConstructor()) {
//       case AuthorizationStateWaitTdlibParameters.CONSTRUCTOR:
//         print(AuthorizationStateWaitTdlibParameters.CONSTRUCTOR);
//         await send(
//           SetTdlibParameters(
//             parameters: TdlibParameters(
//               useTestDc: true,
//               databaseDirectory: 'C:/Users/ilyos/Downloads/Paynes/',
//               filesDirectory: 'C:/Users/ilyos/Downloads/Paynes/',
//               useFileDatabase: true,
//               useChatInfoDatabase: true,
//               useMessageDatabase: true,
//               useSecretChats: false,
//               apiId: 20672376,
//               apiHash: '4adb8bd4f6fc2f1f8f27db116fc518e5',
//               systemLanguageCode: locale?.languageCode ?? 'en',
//               deviceModel: device,
//               systemVersion: deviceVersion,
//               applicationVersion: '1.0',
//               enableStorageOptimizer: true,
//               ignoreFileNames: false,
//             ),
//           ),
//         );
//         break;
//       case AuthorizationStateWaitEncryptionKey.CONSTRUCTOR:
//         if ((authState as AuthorizationStateWaitEncryptionKey).isEncrypted) {
//           await send(const CheckDatabaseEncryptionKey(
//               encryptionKey: 'mostrandomencryption'));
//         } else {
//           await send(const SetDatabaseEncryptionKey(
//               newEncryptionKey: 'mostrandomencryption'));
//         }
//         break;
//       case AuthorizationStateWaitPhoneNumber.CONSTRUCTOR:
//         send(const GetCountries());
//         // Get.toNamed(Routes.getFirstScreen());
//         debugPrint('AuthorizationStateWaitPhoneNumber');
//         break;
//       case AuthorizationStateClosed.CONSTRUCTOR:
//         send(const LogOut());
//         debugPrint('AuthorizationStateClosed');
//         break;
//       case AuthorizationStateClosing.CONSTRUCTOR:
//         debugPrint('AuthorizationStateClosing');
//         break;
//       case AuthorizationStateReady.CONSTRUCTOR:
//         // Get.put(GetChatList()).getChatList();
//         // Get.offAndToNamed(Routes.getMainPage());
//         debugPrint('AuthorizationStateReady');
//         break;
//       case AuthorizationStateWaitCode.CONSTRUCTOR:
//         final eventJson = event.toJson();
//         final firstType =
//             eventJson['authorization_state']['code_info']['type']['@type'];
//         final firstTypeCodeLength =
//             eventJson['authorization_state']['code_info']['type']['length'];
//         // final secondType =
//         //     eventJson['authorization_state']['code_info']['next_type']['@type'];
//         // final secondTypeCodeLength =
//         // eventJson['authorization_state']['code_info']['next_type']['length'];
//
//         switch (firstType) {
//           case 'authenticationCodeTypeTelegramMessage':
//             if (firstTypeCodeLength > 0) {
//               // Get.toNamed(Routes.getTelegramAuth());
//             } else {}
//             break;
//           case 'authenticationCodeTypeSms':
//             if (firstTypeCodeLength > 0) {
//               // Get.toNamed(Routes.getSmsAuth());
//             } else {}
//             break;
//           case 'authenticationCodeTypeCall':
//             if (firstTypeCodeLength > 0) {
//               // Get.toNamed(Routes.getCallAuth());
//             } else {}
//             break;
//           default:
//         }
//
//         debugPrint(firstType);
//         break;
//       case AuthorizationStateWaitOtherDeviceConfirmation.CONSTRUCTOR:
//         debugPrint('AuthorizationStateWaitOtherDeviceConfirmation');
//         break;
//       case AuthorizationStateWaitRegistration.CONSTRUCTOR:
//         final json = event.toJson();
//         final result = AuthorizationStateWaitRegistration.fromJson(
//             json['authorization_state']);
//         // infos.registration = result;
//         // Get.offAndToNamed(Routes.getRegisterUserPage());
//         debugPrint('AuthorizationStateWaitRegistration');
//         // final result =
//         //     AuthorizationStateWaitRegistration.fromJson(event.toJson());
//         // infos.registration = result;
//         break;
//       case AuthorizationStateWaitPassword.CONSTRUCTOR:
//         debugPrint('AuthorizationStateWaitPassword');
//         break;
//       case AuthorizationStateLoggingOut.CONSTRUCTOR:
//         // Get.offAndToNamed(Routes.getFirstScreen());
//         send(const GetCountries());
//         debugPrint('AuthorizationStateLoggingOut');
//         break;
//       default:
//     }
//
//     return;
//   }
//
//   void destroyClient() async {
//     // tdSend(client ?? 0, const Close());
//   }
//
//   Future setAuthenticationPhoneNumber(String phoneNumber) async {
//     final result = await send(
//       SetAuthenticationPhoneNumber(
//         phoneNumber: phoneNumber,
//         settings: const PhoneNumberAuthenticationSettings(
//           allowFlashCall: true,
//           allowMissedCall: true,
//           isCurrentPhoneNumber: true,
//           allowSmsRetrieverApi: true,
//           authenticationTokens: [],
//         ),
//       ),
//     );
//     if (result != null && result is TdError) {
//       // snackbar.getSnackbarInfoWithResult(result);
//     }
//   }
//
//   Future setResendAuthenticationCode() async {
//     final result = await send(const ResendAuthenticationCode());
//     if (result != null && result is TdError) {
//       // Get.put(GetSnackBarClass()).getSnackbarInfoWithResult(result);
//     }
//   }
//
//   Future<TdObject?> send(event, {Future<void>? callback}) async {
//     final rndId = _random();
//     if (callback != null && client != null) {
//       callbackResults[rndId] = callback;
//       try {
//         tdSend(client ?? 1, event, rndId);
//       } catch (e) {
//         if (kDebugMode) {
//           print(e);
//         }
//       }
//     } else {
//       final completer = Completer<TdObject>();
//       results[rndId] = completer;
//       tdSend(client ?? 1, event, rndId);
//       return completer.future;
//     }
//   }
//
//   Future checkAuthenticationCode(
//     String code,
//   ) async {
//     final result = await send(
//       CheckAuthenticationCode(
//         code: code,
//       ),
//     );
//     if (result != null && result is TdError) {
//       if (kDebugMode) {
//         print('Error ${result.message}');
//       }
//     }
//   }
//
// // void getCountries() async {
// //   await send(const GetCountr);
// // }
// }
import 'package:galaxeus_lib/galaxeus_lib.dart';
import 'package:get/get.dart';
import 'package:paynes_kassa/common/global.dart';
import 'package:paynes_kassa/common/res/global_controlls.dart';
import 'package:paynes_kassa/pages/register/controller.dart';
import 'package:telegram_client/telegram_client.dart';

import '../../../pages/home/screens/pay/payments/dialogs/gos_uslugi_dialogs/budjet.dart';
import '../../routes/names.dart';

class TelegramController extends GetxController {
  final clickId = 118365835;
  final controller = Get.put(RegisterController());
  final payController = Get.put(BudgetDialog());
  final Tdlib tg = Get.put(Global()).tg;
  void task() async {
    tg.on(tg.event_update, callback);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    task();
  }

  dynamic callback(UpdateTd update) async {
    Future(() async {
      final type = update.raw["@type"];
      // final userId = update.raw["message"]["sender_id"]["user_id"];
      // final messageContent = update.raw["message"]["content"];
      // final message = update.raw["message"];
      switch (type) {
        case "updateNewMessage":
          if (update.raw["message"]["sender_id"]["user_id"] == clickId) {
            switch (update.raw["message"]["content"]["@type"]) {
              case "messageText":
                // print("Messages Length ${update.raw["message"]["rows"]}");
                // print("Messages ${update.raw["message"]["rows"]}");
                break;
              default:
            }
          }

          break;
      }
      switch (type) {
        case "updateChatLastMessage":
          print(update.raw);
          if (update.raw["chat_id"] == clickId) {
            if (update.raw["last_message"]["sender_id"]["user_id"] == clickId) {
              if (update.raw["last_message"]["content"]["text"]["text"]
                  .contains('Ошибка! Исполнительный документ не найден')) {
                mibFirstController.result.value =
                    update.raw["last_message"]["content"]["text"]["text"];
                mibFirstController.isError.value = true;
                mibFirstController.isProgress.value = false;
                print("Error ${mibFirstController.result.value}");
              } else {
                mibFirstController.result.value =
                    update.raw["last_message"]["content"]["text"]["text"];
                mibFirstController.isError.value = false;
                mibFirstController.isProgress.value = false;
                print("Success ${mibFirstController.result.value}");
              }
            }
          }
      }
      if (update.raw["@type"] == "updateAuthorizationState") {
        print(update.raw);
        if (update.raw["authorization_state"] is Map) {
          var authStateType = update.raw["authorization_state"]["@type"];
          await tg.initClient(
            update,
            clientId: update.client_id,
            tdlibParameters: update.client_option,
            isVoid: true,
          );
          if (authStateType == "authorizationStateWaitRegistration") {
            print(authStateType);
            if (update.raw["authorization_state"]["terms_of_service"] is Map) {
              Map terms_of_service =
                  update.raw["authorization_state"]["terms_of_service"] as Map;
              if (terms_of_service["text"] is Map) {}
            }
          }
          if (authStateType == "authorizationStateLoggingOut") {
            print(authStateType);
          }
          if (authStateType == "authorizationStateClosed") {
            print("close: ${update.client_id}");
            print(authStateType);
          }
          if (authStateType == "authorizationStateWaitPhoneNumber") {
            Get.offAllNamed(AppRoutes.register);
            print('authStateType');
            print(authStateType);
          }
          if (authStateType == "authorizationStateWaitEmailCode") {
            print(authStateType);
            Get.toNamed(AppRoutes.verifyWithEmail);
          }
          if (authStateType == "authenticationCodeTypeTelegramMessage") {
            print(authStateType);
            Get.offAllNamed(AppRoutes.verifyWithTelegram);
          }
          if (authStateType == "authenticationCodeTypeSms") {
            print(authStateType);
            Get.offAllNamed(AppRoutes.verifyWithSms);
          }
          if (authStateType == "authenticationCodeTypePhoneCall") {
            print(authStateType);
            Get.offAllNamed(AppRoutes.verifyWithEmail);
          }
          if (authStateType == "authorizationStateWaitQrCode") {
            print(authStateType);
            Get.offAllNamed(AppRoutes.verifyWithQr);
          }
          if (authStateType == 'authorizationStateLoggingOut') {
            Get.offAllNamed(AppRoutes.register);
          }
          if (authStateType == "authorizationStateWaitCode") {
            print('Wait Code');
            print(authStateType);
            var verifyType =
                update.raw["authorization_state"]["code_info"]["type"]["@type"];
            if (verifyType == "authorizationStateWaitEmailCode") {
              print(verifyType);
              Get.offAllNamed(AppRoutes.verifyWithEmail);
            }
            if (verifyType == "authenticationCodeTypeTelegramMessage") {
              print(verifyType);
              Get.offAllNamed(AppRoutes.verifyWithTelegram);
            }
            if (verifyType == "authenticationCodeTypeSms") {
              print(verifyType);
              Get.offAllNamed(AppRoutes.verifyWithSms);
            }
            if (verifyType == "authenticationCodeTypePhoneCall") {
              print(verifyType);
              Get.offAllNamed(AppRoutes.verifyWithPhoneCall);
            }
            if (verifyType == "authorizationStateWaitQrCode") {
              print(verifyType);
              Get.offAllNamed(AppRoutes.verifyWithQr);
            }
          }
          if (authStateType == "authorizationStateWaitPassword") {
            print("Wait Password");
            print(authStateType);
            // await tg.invoke(
            //   "checkAuthenticationPassword",
            //   parameters: {
            //     "password": password,
            //   },
            //   clientId: update.client_id,
            // );
          }
          if (authStateType == "authorizationStateReady") {
            print(authStateType);
            Map get_me = await tg.getMe(clientId: update.client_id);
            print(get_me);
            print(
                "\n\n${jsonToMessage((get_me["result"] as Map), jsonFullMedia: {})}");
            Get.offAllNamed(AppRoutes.login);
          }
        }
      }
    });
  }
}
