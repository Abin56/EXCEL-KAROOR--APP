import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/pages/exam_results/for_users/select_exam_users.dart';
import 'package:excel_karror/view/widgets/appbar_color/appbar_clr.dart';
import 'package:excel_karror/view/widgets/fonts/google_poppins.dart';

import '../../../constant/sizes/sizes.dart';

class UsersSelectExamLevelScreen extends StatelessWidget {
  final String classId;
  final String studentID;
  const UsersSelectExamLevelScreen(
      {super.key, required this.classId, required this.studentID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Results".tr),
        // backgroundColor: adminePrimayColor,
        foregroundColor: cWhite,
        flexibleSpace: const AppBarColorWidget(),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: adminePrimayColor,
                  // Color.fromARGB(255, 83, 153, 115)
                ),
                child: TextButton.icon(
                    onPressed: () async {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
               return UsersSelectExamWiseScreen(
                            classID: classId,
                            examLevel: 'School Level',
                            studentId: studentID,
                          );
               },));
                      // Get.off(() => UsersSelectExamWiseScreen(
                      //       classID: classId,
                      //       examLevel: 'School Level',
                      //       studentId: studentID,
                      //     ));
                    },
                    icon: const Icon(
                      Icons.receipt,
                      color: cWhite,
                    ),
                    label: GooglePoppinsWidgets(
                        fontsize: 20.h,
                        text: 'School Level'.tr,
                        color: Colors.white)),
              ),
            ],
          ),
          kHeight30,
          Container(
            width: 250.w,
            height: 100.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: adminePrimayColor,
              // const Color.fromARGB(255, 83, 153, 115)
            ),
            child: TextButton.icon(
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UsersSelectExamWiseScreen(
                        classID: classId,
                        examLevel: 'Public Level',
                        studentId: studentID,
                      );
                  },));
                  // Get.off(() => UsersSelectExamWiseScreen(
                  //       classID: classId,
                  //       examLevel: 'Public Level',
                  //       studentId: studentID,
                  //     ));
                },
                icon: const Icon(
                  Icons.receipt,
                  color: cWhite,
                ),
                label: GooglePoppinsWidgets(
                    fontsize: 20.h,
                    text: 'Public Level'.tr,
                    color: Colors.white)),
          )
        ],
      )),
    );
  }
}
