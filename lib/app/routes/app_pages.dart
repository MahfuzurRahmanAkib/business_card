import 'package:get/get.dart';

import '../modules/account_details/bindings/account_details_binding.dart';
import '../modules/account_details/views/account_details_view.dart';
import '../modules/allContact/bindings/all_contact_binding.dart';
import '../modules/allContact/views/all_contact_view.dart';
import '../modules/bottomNavBar/bindings/bottom_nav_bar_binding.dart';
import '../modules/bottomNavBar/views/bottom_nav_bar_view.dart';
import '../modules/card/bindings/card_binding.dart';
import '../modules/card/views/card_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/create/bindings/create_binding.dart';
import '../modules/create/views/create_view.dart';
import '../modules/createAccountOtp/bindings/create_account_otp_binding.dart';
import '../modules/createAccountOtp/views/create_account_otp_view.dart';
import '../modules/createCard/bindings/create_card_binding.dart';
import '../modules/createCard/views/create_card_view.dart';
import '../modules/edit/bindings/edit_binding.dart';
import '../modules/edit/views/edit_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/forget/bindings/forget_binding.dart';
import '../modules/forget/views/forget_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reset/bindings/reset_binding.dart';
import '../modules/reset/views/reset_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/start/bindings/start_binding.dart';
import '../modules/start/views/start_view.dart';
import '../modules/update/bindings/update_binding.dart';
import '../modules/update/views/update_view.dart';
import '../modules/view/bindings/view_binding.dart';
import '../modules/view/views/view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.START,
      page: () => const StartView(),
      binding: StartBinding(),
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => const CreateView(),
      binding: CreateBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGET,
      page: () => const ForgetView(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: _Paths.RESET,
      page: () => ResetView(),
      binding: ResetBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAV_BAR,
      page: () => const BottomNavBarView(),
      binding: BottomNavBarBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.CARD,
      page: () => const CardView(),
      binding: CardBinding(),
    ),
    GetPage(
      name: _Paths.ACTDETAILS,
      page: () => const AccountDetailsView(),
      binding: AccountDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT_OTP,
      page: () => const CreateAccountOtpView(),
      binding: CreateAccountOtpBinding(),
    ),
    GetPage(
      name: _Paths.EDIT,
      page: () => const EditView(),
      binding: EditBinding(),
    ),
    GetPage(
      name: _Paths.ALL_CONTACT,
      page: () => const AllContactView(),
      binding: AllContactBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE,
      page: () => const UpdateView(),
      binding: UpdateBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_CARD,
      page: () => const CreateCardView(),
      binding: CreateCardBinding(),
    ),
    GetPage(
      name: _Paths.VIEW,
      page: () => const ViewView(),
      binding: ViewBinding(),
    ),
  ];
}
