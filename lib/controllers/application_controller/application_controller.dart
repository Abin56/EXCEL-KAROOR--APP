import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:excel_karror/view/pages/splash_screen/splash_screen.dart';

class ApplicationController extends GetxController {
  RxString currentversion = '1.0.0+9'.obs;
  RxString latestVersion = ''.obs;
  RxString playstorelink = ''.obs;
  RxString message = ''.obs;

  Future<void> getLatestApplicationVersion() async {
    final firebaseplaystorelink = await FirebaseFirestore.instance
        .collection('Application_version')
        .doc('playstorelink')
        .get();
    final firebaseplaystoremessage = await FirebaseFirestore.instance
        .collection('Application_version')
        .doc('playstorelink')
        .get();
    final firebase = await FirebaseFirestore.instance
        .collection('Application_version')
        .doc('version')
        .get();
    message.value = firebaseplaystoremessage.data()!['message'];
    playstorelink.value = firebaseplaystorelink.data()!['link'];
    latestVersion.value = firebase.data()!['version'];
  }

  checkingLatestVersion(BuildContext context) async {
    if (currentversion.value == latestVersion.value) {
      nextpage(context);
      log("...................................");
    } else {
      log('+++++++++++++++++++++++++++++++++');
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(message.value)],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Ok'),
                onPressed: () async {
                  await openPlayStore();
                },
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> openPlayStore() async {
    String playStoreUrl = playstorelink.value;

    if (await canLaunch(playStoreUrl)) {
      await launch(playStoreUrl);
    } else {
      throw 'Could not launch Play Store';
    }
  }

  // @override
  // void onInit() async {
  //   await getLatestApplicationVersion();
  //   super.onInit();
  // }
}
