import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:paynes_kassa/pages/register/index.dart';

import '../../pages/home/index.dart';
import '../../pages/home/screens/pay/payments/screens/mib/first_screen/index.dart';
import '../../pages/home/screens/pay/payments/screens/mib/second_screen/index.dart';
import '../../pages/login/index.dart';
import '../../pages/register/verify/with_email/index.dart';
import '../../pages/register/verify/with_phone_call/index.dart';
import '../../pages/register/verify/with_qr/index.dart';
import '../../pages/register/verify/with_sms/index.dart';
import '../../pages/register/verify/with_telegram/index.dart';
import 'routes.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // about boot up the app
    GetPage(
      name: AppRoutes.initial,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyWithEmail,
      page: () => const VerifyWithEmailPage(),
      binding: VerifyWithEmailBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyWithSms,
      page: () => const VerifyWithSmsPage(),
      binding: VerifyWithSmsBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyWithPhoneCall,
      page: () => const VerifyWithPhoneCallPage(),
      binding: VerifyWithPhoneCallBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyWithTelegram,
      page: () => const VerifyWithTelegramPage(),
      binding: VerifyWithTelegramBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyWithQr,
      page: () => const VerifyWithQRPage(),
      binding: VerifyWithQRBinding(),
    ),
    GetPage(
      name: AppRoutes.mibFirstPage,
      page: () => const MibFirstPage(),
      binding: MibFirstBinding(),
    ),
    GetPage(
      name: AppRoutes.mibSecondPage,
      page: () => const MibSecondPage(),
      binding: MibSecondBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.SIGN_IN,
    //   page: () => const SignInPage(),
    //   binding: SignInBinding(),
    // ),

    // 需要登录
    // GetPage(
    //   name: AppRoutes.Application,
    //   page: () => ApplicationPage(),
    //   binding: ApplicationBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    // 最新路由
    // GetPage(name: AppRoutes.EmailLogin, page: () => EmailLoginPage(), binding: EmailLoginBinding()),
    // GetPage(name: AppRoutes.Register, page: () => RegisterPage(), binding: RegisterBinding()),
    // GetPage(name: AppRoutes.Forgot, page: () => ForgotPage(), binding: ForgotBinding()),
    // GetPage(name: AppRoutes.Phone, page: () => PhonePage(), binding: PhoneBinding()),
    // GetPage(name: AppRoutes.SendCode, page: () => SendCodePage(), binding: SendCodeBinding()),
    // // 首页
    // GetPage(
    //     name: AppRoutes.Contact,
    //     page: () => const ContactPage(),
    //     binding: ContactBinding()),
    // // //消息
    // GetPage(
    //   name: AppRoutes.Message,
    //   page: () => const MessagePage(),
    //   binding: MessageBinding(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),
    // // //我的
    // GetPage(
    //     name: AppRoutes.Profile,
    //     page: () => const ProfilePage(),
    //     binding: ProfileBinding()),
    // //聊天详情
    // GetPage(name: AppRoutes.Chat, page: () => ChatPage(), binding: ChatBinding()),
    //
    // GetPage(name: AppRoutes.Photoimgview, page: () => PhotoImgViewPage(), binding: PhotoImgViewBinding()),
    // GetPage(name: AppRoutes.VoiceCall, page: () => VoiceCallViewPage(), binding: VoiceCallViewBinding()),
    // GetPage(name: AppRoutes.VideoCall, page: () => VideoCallPage(), binding: VideoCallBinding()),
  ];
}
