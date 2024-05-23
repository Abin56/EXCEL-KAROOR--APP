
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel_karror/controllers/get_teacher_subject/get_sub.dart';
import 'package:excel_karror/controllers/userCredentials/user_credentials.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/pages/Subject/student/chapter_display.dart';
import 'package:excel_karror/view/widgets/appbar_color/appbar_clr.dart';
import 'package:excel_karror/view/widgets/container_image.dart';
import 'package:excel_karror/view/widgets/fonts/google_monstre.dart';
import 'package:excel_karror/view/widgets/fonts/google_poppins.dart';
import 'package:excel_karror/widgets/Iconbackbutton.dart';

class StudentSubjectScreen extends StatelessWidget {
 final TeacherSubjectController teacherSubjectController =
      Get.put(TeacherSubjectController());
  StudentSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const AppBarColorWidget(),
        foregroundColor: cWhite,
        automaticallyImplyLeading: false,
       // backgroundColor: adminePrimayColor,
        title: Row(
          children: [
            IconButtonBackWidget(
              color: cWhite,
            ),
            GooglePoppinsWidgets(
              text: "Subjects".tr,
              fontsize: 20.h,
              color: cWhite,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("SchoolListCollection")
                .doc(UserCredentialsController.schoolId)
                .collection(UserCredentialsController.batchId!)
                .doc(UserCredentialsController.batchId)
                .collection("classes")
                .doc(UserCredentialsController.classId)
                .collection("subjects")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasData) {
                return Column(children: [
                  Expanded(
                    child: GridView.count(
                      padding: const EdgeInsets.all(15),
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children:
                          List.generate(snapshot.data!.docs.length, (index) {
                        if (snapshot.data!.docs[index]['teacherId'] != null ||
                            snapshot.data!.docs[index]['teacherId'] != '') {
                          teacherSubjectController.getSubject(
                              snapshot.data!.docs[index]['teacherId']);
                        } else {
                          return const SizedBox();
                        }

                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>

                            // StudyMaterials()

                            // ));

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChapterDisplay(
                                  subjectID: snapshot.data!.docs[index]
                                      ['docid']),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12,bottom: 12,left: 8,),
                            child: Container(
                               decoration: BoxDecoration(border: Border.all(color: Colors.green,width: 2 ),),
                              child: Container(
                                  decoration: BoxDecoration(border: Border.all(color: cWhite,width: 2 ),),
                                child: Container(
                                  decoration: BoxDecoration(border: Border.all(color: Colors.lightGreen,width: 2 ),
                                    // gradient: RadialGradient(colors: [
                                    //    Colors.lightBlueAccent,
                                    //    Colors.blue
                                    // ]),
                                    color: cWhite,
                                    // Color.fromARGB(255, 90, 123, 194),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 30,
                                
                                  // ignore: sort_child_properties_last
                                  child: Center(
                                    child: Column(
                                       // crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                            ),
                                            child: ContainerImage(
                                              height: 60.h,
                                              imagePath:'assets/images/teachernew.png',
                                              width: 70.w,
                                            ),
                                          ),
                                        //  SizedBox(width: 10.h),
                                          SizedBox(
                                            height:30, // set a fixed height for the container
                                            child: Center(
                                                child: FutureBuilder(
                                                    future:
                                                        teacherSubjectController
                                                            .getSubject(snapshot
                                                                    .data
                                                                    ?.docs[index]['teacherId']),
                                                    builder: (context, snap) {
                                                      return SizedBox(
                                                        height: 20,
                                                        width: 70,
                                                        child:GooglePoppinsWidgets(
                                                                text: snap.data ??"",
                                                                fontsize: 12),
                                                      );
                                                    })),
                                          ),
                                         // kHeight20,
                                          Flexible(
                                            child: GooglePoppinsWidgets(
                                              text: snapshot.data!.docs[index] ['subjectName'],
                                              fontsize: 20.h,
                                              color: cblack,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ]);
              }
              return GoogleMonstserratWidgets(
                text: 'No Subjects Added!',
                fontsize: 14,
              );
            }),
      ),
    );
  }
}

const text = [""];
