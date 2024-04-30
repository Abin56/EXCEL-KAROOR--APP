import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:excel_karror/controllers/userCredentials/user_credentials.dart';
import 'package:excel_karror/model/user_deviceID_model/user_devideID_model.dart';
import 'package:excel_karror/utils/utils.dart';

class PushNotificationController extends GetxController {
  final currentUID = FirebaseAuth.instance.currentUser!.uid;
  RxString deviceID = ''.obs;
  Future<void> getUserDeviceID() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      deviceID.value = token ?? "";
    });
  }

  Future<void> allUSerDeviceID(String userrole) async {
    try {
      final UserDeviceIDModel userModel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: currentUID,
          userrole: userrole,
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection('AllUsersDeviceID')
          .doc(currentUID)
          .set(userModel.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  /////////////////////////////////// Teacher Part

  Future<void> allTeacherDeviceID() async {
    final String teacherUID =
        UserCredentialsController.teacherModel!.docid ?? currentUID;
    try {
      final UserDeviceIDModel teacherModel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: teacherUID,
          userrole: 'teacher',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection('AllTeacherDeviceID')
          .doc(teacherUID)
          .set(teacherModel.toMap())
          .then((value) async {
        await teacherDeviceID();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> teacherDeviceID() async {
    final String teacherUID =
        UserCredentialsController.teacherModel!.docid ?? currentUID;
    try {
      final UserDeviceIDModel student = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: teacherUID,
          userrole: 'teacher',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(UserCredentialsController.classId!)
          .collection('teachers')
          .doc(teacherUID)
          .collection('DevideID')
          .doc('DevideID')
          .set(student.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  /////////////////////////////////// Teacher Part
  ///

  /////////////////////////////////// Student Part

  Future<void> allStudentDeviceID() async {
    final String studentUID = UserCredentialsController.studentModel!.docid;

    try {
      final UserDeviceIDModel studentModel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: studentUID,
          userrole: 'studnet',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection('AllStudentDeviceID')
          .doc(studentUID)
          .set(studentModel.toMap())
          .then((value) async {
        await studentDeviceID();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> studentDeviceID() async {
    final String studentUID = UserCredentialsController.studentModel!.docid;
    try {
      final UserDeviceIDModel student = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: studentUID,
          userrole: 'student',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(UserCredentialsController.classId!)
          .collection('Students')
          .doc(studentUID)
          .collection('DevideID')
          .doc('DevideID')
          .set(student.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  /////////////////////////////////// Student Part
  ///
  ///
  /////////////////////////////////// Parent Part

  Future<void> allParentDeviceID() async {
    log('Parent DE:ID +++++++ $deviceID ++++++');
    final String parentUID =
        UserCredentialsController.parentModel!.docid ?? currentUID;

    try {
      final UserDeviceIDModel parentmodel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: parentUID,
          userrole: 'parent',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection('AllParentDeviceID')
          .doc(parentUID)
          .set(parentmodel.toMap())
          .then((value) async {
        await parentDeviceID();
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> parentDeviceID() async {
    final String parentUID =
        UserCredentialsController.parentModel!.docid ?? currentUID;
    try {
      final UserDeviceIDModel parentmodel = UserDeviceIDModel(
          batchID: UserCredentialsController.batchId!,
          classID: UserCredentialsController.classId!,
          devideID: deviceID.value,
          uid: parentUID,
          userrole: 'parent',
          schoolID: UserCredentialsController.schoolId!);
      await server
          .collection(UserCredentialsController.batchId!)
          .doc(UserCredentialsController.batchId!)
          .collection('classes')
          .doc(UserCredentialsController.classId!)
          .collection('Parents')
          .doc(parentUID)
          .collection('DevideID')
          .doc('DevideID')
          .set(parentmodel.toMap());
    } catch (e) {
      log(e.toString());
    }
  }

  /////////////////////////////////// Parent Part
}
