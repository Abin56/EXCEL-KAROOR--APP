import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/pages/Homework/upload_part.dart';
import 'package:excel_karror/view/widgets/appbar_color/appbar_clr.dart';
import 'package:excel_karror/view/widgets/fonts/google_poppins.dart';
import 'package:excel_karror/widgets/login_button.dart';

class UploadHomework extends StatelessWidget {
  const UploadHomework({super.key, required this.task});
  final String task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            kHeight20,
            GooglePoppinsWidgets(text: "Submit HomeWork".tr, fontsize: 20.h)
          ],
        ),
        flexibleSpace: const AppBarColorWidget(),
        foregroundColor: cWhite,
        // backgroundColor: adminePrimayColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GooglePoppinsWidgets(
                  text: "Task :", fontsize: 25.h, fontWeight: FontWeight.bold),
              kHeight40,
              GooglePoppinsWidgets(
                  text: task,
                  // "Taskdjydjtyd vd  ydyrdrd jgfx fgfgf fx ydyrdyd tydydyrdy yy  yrjyrry ",
                  fontsize: 15.h,
                  fontWeight: FontWeight.w500),
              kHeight50,
              Center(
                  child:
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UploadHomeworkToTeacher(homeWorkName: '',homeworkID: '',);
                          },));
                        },
                        child: loginButtonWidget(
                          height: 40, width: 80, text: "Upload"),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
