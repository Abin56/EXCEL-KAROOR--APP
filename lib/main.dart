import 'dart:developer';

import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
// import 'package:play_video/play_video.dart';
import 'package:provider/provider.dart';
import 'package:excel_karror/controllers/bloc/user_phone_otp/auth_state.dart';
import 'package:excel_karror/controllers/userCredentials/user_credentials.dart';
import 'package:excel_karror/firebase_options.dart';
import 'package:excel_karror/view/constant/responsive.dart';
import 'package:excel_karror/view/language/language.dart';
import 'package:excel_karror/view/language/select_language/select_language.dart';
import 'package:excel_karror/view/pages/chat_gpt/providers/chats_provider.dart';
import 'package:excel_karror/view/pages/chat_gpt/providers/models_provider.dart';
import 'package:excel_karror/view/pages/login/dujo_login_screen.dart';
import 'package:excel_karror/view/pages/splash_screen/splash_screen.dart';

import 'controllers/bloc/user_phone_otp/auth_cubit.dart';
import 'helper/shared_pref_helper.dart';
import 'local_database/parent_login_database.dart';

late Box<DBParentLogin> parentdataDB;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling  a background message ${message.messageId}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(DBParentLoginAdapter().typeId)) {
    Hive.registerAdapter(DBParentLoginAdapter());
  }
  parentdataDB = await Hive.openBox<DBParentLogin>('parentloginAuth');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //creating shared preference
  await SharedPreferencesHelper.initPrefs();
  // await PlayVideoRender.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ///[languageCode]and[countryCode] will be change [updateLanguage] function on select language page
  final String languageCode =
      SharedPreferencesHelper.getString("langCode") ?? "en";
  final String countryCode =
      SharedPreferencesHelper.getString("langCode") ?? "US";

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        designSize: const Size(423.5294196844927, 945.8823706287004),
        builder: (context) {
          return BlocProvider(
            create: (context) => AuthCubit(),
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (_) => ModelsProvider(),
                ),
                ChangeNotifierProvider(
                  create: (_) => ChatProvider(),
                ),
              ],
              child: GetMaterialApp(
                theme: ThemeData(
                    tabBarTheme: TabBarTheme(
                      unselectedLabelColor: cWhite,
                      labelColor: Colors.blue[100],
                      indicatorColor: Colors.green,
                    ),
                    // unselectedWidgetColor: cWhite,
                    appBarTheme: const AppBarTheme(foregroundColor: cWhite)),
                translations: GetxLanguage(),
                locale: Locale(languageCode, countryCode),
                debugShowCheckedModeBanner: false,
           //     home:        Scaffold(
  //                 body: Center(
  //                   child: 
  //                   Container(
  //                     color: Colors.amber,
  // width: 200.0,
  // height: 200.0,
  // child: Shimmer.fromColors(
  //   baseColor: Colors.grey.withOpacity(0.3),
  //   highlightColor: Colors.grey.withOpacity(0.1),
  //   child: Container(
  //     color: Colors.white,
  //   ),
  // ),)

  //                 ),
  //               ),
                home: BlocBuilder<AuthCubit, AuthState>(
                  buildWhen: (oldState, newState) {
                    return oldState is AuthInitialState;
                  },
                  builder: (context, state) {
                    ResponsiveApp.serMq(context);
                    if (state is AuthLoggedInState) {
                      if (SharedPreferencesHelper.getString("langCode") !=
                          null) {
                        return const SplashScreen();
                      } else {
                        return const SelectLanguage();
                      }
                    } else if (state is AuthLoggedOutState) {
                      if (SharedPreferencesHelper.getString("langCode") !=
                          null) {
                        return const SplashScreen();
                      } else {
                        return const SelectLanguage();
                      }
                    }
                    if (SharedPreferencesHelper.getString("langCode") != null) {
                      return const SplashScreen();
                    } else {
                      return const SelectLanguage();
                    }
                  },
                ),
              ),
            ),
          );
        });
  }
}

////

checkingSchoolActivate(BuildContext context) async {
  final checking = await FirebaseFirestore.instance
      .collection('SchoolListCollection')
      .doc(UserCredentialsController.schoolId)
      .get();

  if (checking.data()!['deactive'] == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const DujoLoginScren();
              },));
   // Get.offAll(() => const DujoLoginScren());
    // ignore: use_build_context_synchronously
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text('Your School is Deactivated')],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ok'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then((value) async {
                  await SharedPreferencesHelper.clearSharedPreferenceData();
                  UserCredentialsController.clearUserCredentials();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return const DujoLoginScren();
              },));
                //  Get.offAll(() => const DujoLoginScren());
                });
              },
            ),
          ],
        );
      },
    );
  } else {
    return;
  }
}
