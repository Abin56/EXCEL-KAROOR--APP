import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/pages/search/search_school/search_school_searchdeligate.dart';
import 'package:excel_karror/view/widgets/container_image.dart';
import 'package:excel_karror/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/schoo_selection_controller/school_class_selection_controller.dart';
import '../../../widgets/fonts/google_monstre.dart';
import '../../../widgets/fonts/google_poppins.dart';

class SearchSchoolScreen extends StatelessWidget {
  SearchSchoolScreen({super.key});
  final SchoolClassSelectionController schoolClassSelectionController =
      Get.put(SchoolClassSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ContainerImage(
                        height: 180.h,
                        width: 180.w,
                        imagePath: 'assets/excel_karror/excel_karoor_logo.png'),
                  ],
                ),
              ),
              GoogleMonstserratWidgets(
                  text: "Welcome To".tr,
                  fontsize: 25,
                  fontWeight: FontWeight.bold),
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GoogleMonstserratWidgets(
                    text: 'EXCEL ',
                    fontsize: 20,
                    color: const Color.fromARGB(255, 230, 18, 3),
                    fontWeight: FontWeight.bold,
                  ),
                  GoogleMonstserratWidgets(
                    text: ' KAROOR',
                    fontsize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 200),
                child: GestureDetector(
                  onTap: () async {
                    await schoolClassSelectionController.fetchAllSchoolData();
                    if (context.mounted) {
                      _showSearch(context);
                    }
                  },
                  child: loginButtonWidget(
                    height: 60,
                    width: 180,
                    text: "Set Up Your App".tr,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GooglePoppinsWidgets(text: "Developed by", fontsize: 12),
                  kHeight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/leptonlogo.png'))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GoogleMonstserratWidgets(
                            text: "Lepton Communications",
                            fontsize: 13,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      )),
    );
  }

  Future<void> _showSearch(BuildContext context) async {
    await showSearch(context: context, delegate: SearchSchoolBar());
  }
}
