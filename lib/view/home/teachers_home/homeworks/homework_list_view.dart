import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/home/teachers_home/homeworks/view_students_list.dart';
import 'package:excel_karror/view/widgets/appbar_color/appbar_clr.dart';
import 'package:excel_karror/view/widgets/fonts/google_poppins.dart';

class HomeworksListView extends StatelessWidget {
  const HomeworksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Row(
          children: [
            kHeight20,
            GooglePoppinsWidgets(text: "HomeWorks".tr, fontsize: 20.h)
          ],
        ),
        flexibleSpace: const AppBarColorWidget(),
        foregroundColor: cWhite,
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (context, index) => kHeight10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 10.h),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: const Color.fromARGB(236, 228, 244, 255),
                    child: ListTile(
                      shape: const BeveledRectangleBorder(
                        side: BorderSide(
                          color: Color.fromARGB(255, 125, 169, 225),
                          width: 0.2,
                        ),
                      ),
                      leading: const Icon(Icons.paste_sharp),
                      title: GooglePoppinsWidgets(
                        text: "Subject",
                        fontsize: 17.h,
                        fontWeight: FontWeight.w700,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: GooglePoppinsWidgets(
                              text: "Subject : sub",
                              fontsize: 15.h,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    GooglePoppinsWidgets(
                                        text: "Task : ",
                                        fontsize: 15.h,
                                        fontWeight: FontWeight.bold),
                                    InkWell(
                                      onTap: () async {
                                        return showDialog(
                                          context: context,
                                          barrierDismissible:
                                              false, // user must tap button!
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Task'),
                                              content:
                                                  const SingleChildScrollView(
                                                child: ListBody(
                                                  children: <Widget>[
                                                    Text("sdadsadada")
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: GooglePoppinsWidgets(
                                        text: "View",
                                        fontsize: 16.h,
                                        color: adminePrimayColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const ViewStudentsList();
                                      },
                                    ),
                                  ),
                                  child: GooglePoppinsWidgets(
                                    text: "Students List",
                                    fontsize: 16.h,
                                    color: adminePrimayColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GooglePoppinsWidgets(
                                    text: "From : 10:10",
                                    fontsize: 15.h,
                                    fontWeight: FontWeight.bold),
                                Row(
                                  children: [
                                    GooglePoppinsWidgets(
                                        text: "To : ",
                                        fontsize: 15.h,
                                        fontWeight: FontWeight.bold),
                                    GooglePoppinsWidgets(
                                        text: "10 hr left",
                                        fontsize: 13.h,
                                        color: cred,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
