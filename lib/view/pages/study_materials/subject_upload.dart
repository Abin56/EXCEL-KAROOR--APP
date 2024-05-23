import 'package:excel_karror/sruthi/widget/exm_upload_textformfeild.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/widgets/button_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:google_fonts/google_fonts.dart';

class SubjectUploading extends StatelessWidget {
  const SubjectUploading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Subject Upload "),
          ],
        ),
        backgroundColor: adminePrimayColor,
      ),
      body: Column(
        children: [
          kHeight20,
          ExamUploadTextFormFeild(text: "Teacher's Name", hintText: "Name"),
          kHeight20,
          ExamUploadTextFormFeild(
              text: "Subject Name", hintText: "Subject Name"),
          kHeight20,
          ButtonContainerWidget(
            curving: 18,
            colorindex: 2,
            height: 70.h,
            width: 300.w,
            child: Center(
              child: Text(
                "SUBMIT",
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
