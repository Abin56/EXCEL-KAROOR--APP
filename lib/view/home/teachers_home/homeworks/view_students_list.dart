import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/widgets/appbar_color/appbar_clr.dart';
import 'package:excel_karror/view/widgets/fonts/google_poppins.dart';

class ViewStudentsList extends StatelessWidget {
  const ViewStudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            kHeight20,
            GooglePoppinsWidgets(
                text: "Homework submitted students".tr, fontsize: 20.h)
          ],
        ),
        flexibleSpace: const AppBarColorWidget(),
        foregroundColor: cWhite,
        // backgroundColor: adminePrimayColor,
      ),
      body: SafeArea(
          child: ListView.separated(
        itemCount: 5,
        separatorBuilder: ((context, index) {
          return kHeight10;
        }),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
                child: Card(
                  color: const Color.fromARGB(236, 228, 244, 255),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    shape: const BeveledRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 125, 169, 225),
                            width: 0.2)),
                    leading: const Icon(Icons.paste_sharp),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            children: [
                              GooglePoppinsWidgets(
                                text: "Name :  ",
                                fontsize: 16.h,
                                fontWeight: FontWeight.bold,
                              ),
                              GooglePoppinsWidgets(
                                text: "abin",
                                fontsize: 16.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: Row(
                            children: [
                              GooglePoppinsWidgets(
                                  text: "Status :  ",
                                  fontsize: 15.h,
                                  fontWeight: FontWeight.w500),
                              GooglePoppinsWidgets(
                                text: "Submitted",
                                fontsize: 15.h,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {},
                      child: GooglePoppinsWidgets(
                        text: "View ",
                        fontsize: 15.h,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
