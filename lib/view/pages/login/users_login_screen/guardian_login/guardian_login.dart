// ignore_for_file: must_be_immutable

import 'package:excel_karror/info/info.dart';
import 'package:excel_karror/utils/utils.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:get/get.dart';

import '../../../../../controllers/sign_in_controller/guardian_login_controller.dart';
import '../../../../../model/Text_hiden_Controller/password_field.dart';
import '../../../../../widgets/forget_password_page.dart';
import '../../../../constant/sizes/constant.dart';
import '../../../../widgets/container_image.dart';
import '../../../../widgets/fonts/google_monstre.dart';
import '../../../../widgets/fonts/google_poppins.dart';
import '../../../../widgets/textformfield_login.dart';
import '../../sign_up/guardian_sign_up/guardian_signup_verification_screen.dart';

class GuardianLoginScreen extends StatelessWidget {
  int? pageIndex;
  PasswordField hideGetxController = Get.find<PasswordField>();

  GuardianLoginScreen({this.pageIndex, super.key});

  GuardianLoginController guardianLoginController =
      Get.put(GuardianLoginController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: SizedBox(
          // color: cred,
          height: 80.h,
          width: 115.w,
          child: Center(
              child: Image.asset(
            appLogo,
            color: Colors.white,
            fit: BoxFit.cover,
          )),
        ),
        backgroundColor: adminePrimayColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContainerImage(
                  height: 340.h,
                  width: double.infinity,
                  imagePath: 'assets/images/Login_screen.png'),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Enter Mail id Session >>>>>>>
                    Padding(
                      padding: EdgeInsets.only(right: 140.w, left: 10.w),
                      child: GoogleMonstserratWidgets(
                        fontsize: 25.w,
                        text: 'Guardian Login'.tr,
                        color: cblack,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    kHeight10,
                    SigninTextFormfield(
                        obscureText: false,
                        hintText: 'Email ID'.tr,
                        labelText: 'Enter Mail ID',
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mail_outline,
                          ),
                        ),
                        textEditingController:
                            guardianLoginController.emailIdController,
                        function: checkFieldEmailIsValid),
                    // Enter Password session >>>>>>>>
                    Obx(
                      () => SigninTextFormfield(
                        hintText: 'Password'.tr,
                        obscureText: hideGetxController.isObscurefirst.value,
                        labelText: 'Password',
                        icon: Icons.lock,
                        textEditingController:
                            guardianLoginController.passwordController,
                        function: checkFieldPasswordIsValid,
                        prefixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.lock),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(hideGetxController.isObscurefirst.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            hideGetxController.toggleObscureFirst();
                          },
                        ),
                      ),
                    ),
                    kHeight10,
                    Padding(
                      padding: EdgeInsets.only(left: 210.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: GooglePoppinsWidgets(
                          fontsize: 16,
                          text: 'Forgot Password?'.tr,
                          fontWeight: FontWeight.w400,
                          color: adminePrimayColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.h),
                      child: GestureDetector(
                          onTap: () {
                            guardianLoginController.signIn(context);
                          },
                          child: Obx(
                            () => guardianLoginController.isLoading.value
                                ? circularProgressIndicatotWidget
                                : loginButtonWidget(
                                    height: 60,
                                    width: 180,
                                    text: 'Login'.tr,
                                  ),
                          )),
                    ),
                    kHeight20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GooglePoppinsWidgets(
                            text: "Don't Have an account?".tr, fontsize: 15),
                        GestureDetector(
                          onTap: () {
                            
                            Get.off(() => GuardianSignUpFirstScreen(
                                  pageIndex: 2,
                                ));
                          },
                          child: GooglePoppinsWidgets(
                            text: ' Sign Up'.tr,
                            fontsize: 19,
                            color: cblue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
