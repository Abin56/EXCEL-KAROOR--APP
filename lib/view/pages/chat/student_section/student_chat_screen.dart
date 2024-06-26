import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/pages/chat/student_section/search/search_teachers.dart';
import 'package:excel_karror/view/pages/chat/student_section/teachers_message/teacher_messages.dart';
import 'package:excel_karror/view/widgets/appbar_color/appbar_clr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../controllers/userCredentials/user_credentials.dart';
import '../../../constant/sizes/constant.dart';
import 'group_message/student_message_group_screen.dart';

class StudentChatScreen extends StatelessWidget {
  const StudentChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> showsearch() async {
      await showSearch(context: context, delegate: SearchTeachers());
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: cWhite,
          flexibleSpace: const AppBarColorWidget(),
          // backgroundColor: adminePrimayColor,
          title: Text('Dujo Chat'.tr),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Icon(
                        Icons.group,
                        color: cWhite,
                      ),
                    ),
                    //////////////////////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Teachers".tr),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('SchoolListCollection')
                                .doc(UserCredentialsController.schoolId)
                                .collection(UserCredentialsController.batchId!)
                                .doc(UserCredentialsController.batchId)
                                .collection('classes')
                                .doc(UserCredentialsController.classId)
                                .collection('Students')
                                .doc(FirebaseAuth.instance.currentUser?.uid)
                                .collection("TeachersChatCounter")
                                .doc("c3cDX5ymHfITQ3AXcwSp")
                                .snapshots(),
                            builder: (context, messageIndex) {
                              if (messageIndex.hasData) {
                                if (messageIndex.data!.data() == null) {
                                  return const Text('');
                                } else {
                                  MessageCounter.teacherMessageCounter =
                                      messageIndex.data?.data()?['chatIndex'];
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.white,
                                      child: Center(
                                        child: Text(
                                          messageIndex.data!
                                              .data()!['chatIndex']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator.adaptive(),
                                );
                              }
                            }),
                      ],
                    )
                  ],
                ),
              ),
              // const Tab(icon: Icon(Icons.groups_2), text: 'Parents'),
              Tab(
                icon: const Icon(
                  Icons.class_,
                  color: cWhite,
                ),
                text: 'Group'.tr,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TeachersMessagesScreen(),
            // const Icon(Icons.directions_transit, size: 350),
            StudentsGroupMessagesScreen(),
          ],
        ),
        floatingActionButton: CircleAvatar(
          backgroundColor: adminePrimayColor,
          radius: 25,
          child: Center(
            child: IconButton(
                onPressed: () async {
                  await showsearch();
                },
                icon: const Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
