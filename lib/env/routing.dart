import 'package:recap_app/env/links.dart';
import 'package:recap_app/screens/login_screens/login.dart';
import 'package:recap_app/screens/home_screen/home_binding.dart';
import 'package:recap_app/screens/home_screen/home_screen.dart';
import 'package:recap_app/screens/invoices_screens/invoice_preview/invoice_preview_screen.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/new_business_details/new_business_details.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/new_invoice_binding.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/new_invoice_screen.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/new_items/add_item.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/new_items/items_binding.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/new_payer_details/new_payer_details.dart';
import 'package:recap_app/screens/invoices_screens/new_invoice_screen/sign_invoice/sign_invoice.dart';
import 'package:recap_app/screens/login_screens/login_binding.dart';
import 'package:recap_app/screens/splash_screen/splash_views.dart';
import 'package:get/get.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
      name: AppLinks.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: AppLinks.Login_Screen,
        page: () => Login(),
        transition: Transition.circularReveal,
        binding: LoginBinding()),
    GetPage(
        name: AppLinks.HOME,
        page: () => const HomeScreen(),
        transition: Transition.circularReveal,
        binding: HomeBinding()),
    GetPage(
      name: AppLinks.NEW_INVOICE,
      page: () => const NewInvoiceScreen(),
      transition: Transition.fadeIn,
      binding: NewInvoiceBinding(),
    ),
    GetPage(
      name: AppLinks.NEW_BUSINESS,
      page: () => const NewBusinessScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_PAYER,
      page: () => const NewPayerScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_ITEM,
      page: () => const NewItemScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: ItemsBidning(),
    ),
    GetPage(
      name: AppLinks.SIGNATURE,
      page: () => const SignatureScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.PREVIEW,
      page: () => InvoicePreviewScreen(),
    ),
  ];
}
