import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../common/layouts/layout_with_drawer/layout_with_drawer.dart';
import '../../../common/widgets/buttons/app_buttons.dart';
import '../../../utils/constants/sizes.dart';
import '../../payment_gateway/bkash/payment_page.dart';
import '../../pdf_viewer/view/pdf_screen.dart';
import '../../web_view/web_view.dart';
import '../controllers/cart_controller.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return AppLayoutWithDrawer(
      globalKey: controller.cartKey,
      title: const Text('Cart'),
      body: RefreshIndicator(
        onRefresh: (){
          return Future.delayed(const Duration(seconds: 5));
        },
        child: ListView(
          children: [
            AppButtons.largeFlatFilledButton(
              onPressed: () {
                Get.to(() => const PdfScreen(
                      pdfUrl: 'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                    ));
              },
              buttonText: 'Show pdf'),
            const Gap(AppSizes.md),
            AppButtons.largeFlatFilledButton(
                onPressed: () {
                  Get.to(() =>  WebViewScreen(
                    url: 'https://www.google.com/',
                  ));
                },
                buttonText: 'Show web'),
            const Gap(AppSizes.md),
            AppButtons.largeFlatFilledButton(
                onPressed: () {
                  //Get.to(() => const VideoApp());
                },
                buttonText: 'Show video'),
            const Gap(AppSizes.md),
            AppButtons.largeFlatFilledButton(
                onPressed: () {
                  Get.to(() => const Payment());
                },
                buttonText: 'Payment')
          ]
        ),
      ),
    );
  }
}
