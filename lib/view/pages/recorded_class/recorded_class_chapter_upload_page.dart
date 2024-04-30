import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:excel_karror/sruthi/widget/exm_upload_textformfeild.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/widgets/button_container_widget.dart';
import 'package:excel_karror/widgets/Iconbackbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/recorded_class_controller/recorded_class_controller.dart';
import '../../constant/sizes/constant.dart';
import 'recorded_class_subject_wise.dart';

class RecordedClassChapterUploadPage extends StatelessWidget {
  RecordedClassChapterUploadPage(
      {super.key, required this.subjectID, required this.subjectName});
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RecordedClassController _recordedClassController =
      Get.put(RecordedClassController());
  final String subjectID;
  final String subjectName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButtonBackWidget(
              color: cWhite,
            ),
            Text("Chapter Upload".tr),
          ],
        ),
        backgroundColor: adminePrimayColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _recordedClassController.formKey,
          child: Column(
            children: [
              kHeight20,
              ExamUploadTextFormFeild(
                  validator: checkFieldEmpty,
                  textfromController:
                      _recordedClassController.chapterNumberController,
                  text: "Chapter No.".tr,
                  hintText: "Chapter Number".tr),
              kHeight20,
              ExamUploadTextFormFeild(
                  validator: checkFieldEmpty,
                  textfromController:
                      _recordedClassController.chapterNameController,
                  text: "Chapter Name".tr,
                  hintText: "Chapter Name".tr),
              kHeight20,
              GestureDetector(
                onTap: () {
                  if (_recordedClassController.formKey.currentState?.validate() ?? false) {
                    _recordedClassController
                        .createChapter(subjectID, subjectName)
                        .then((value) {
                      return showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Chapter Upload'.tr),
                              content: Text('New Chapter Added!'.tr),
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: MaterialButton(
                                    child: Text('Ok'.tr),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                )
                              ],
                            );
                          });
                    });
                  }
                },
                child: ButtonContainerWidget(
                  curving: 18,
                  colorindex: 2,
                  height: 70.h,
                  width: 300.w,
                  child: Center(
                    child: Obx(
                        () => _recordedClassController.chapterIsLoading.value
                            ? const CircularProgressIndicator()
                            : Text(
                                "Create Chapter".tr,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700),
                              )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RecordedClassSubjectWisePage(subjectID: subjectID),
                      ));
                },
                child: ButtonContainerWidget(
                  curving: 18,
                  colorindex: 2,
                  height: 70.h,
                  width: 300.w,
                  child: Center(
                    child: Text(
                      "Upload Recorded Classes".tr,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
