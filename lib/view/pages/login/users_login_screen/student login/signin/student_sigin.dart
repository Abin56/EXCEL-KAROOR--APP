import 'package:adaptive_ui_layout/flutter_responsive_layout.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:excel_karror/controllers/sign_up_controller/student_sign_up_controller.dart';
import 'package:excel_karror/model/Text_hiden_Controller/password_field.dart';
import 'package:excel_karror/utils/utils.dart';
import 'package:excel_karror/view/colors/colors.dart';
import 'package:excel_karror/view/constant/sizes/constant.dart';
import 'package:excel_karror/view/constant/sizes/sizes.dart';
import 'package:excel_karror/view/pages/login/users_login_screen/student%20login/student_login.dart';
import 'package:excel_karror/view/widgets/container_image.dart';
import 'package:excel_karror/view/widgets/fonts/google_poppins.dart';
import 'package:excel_karror/view/widgets/textformfield_login.dart';
import 'package:excel_karror/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../controllers/userCredentials/user_credentials.dart';
import '../../../../../../model/student_model/student_model.dart';
import '../../../userVerify_Phone_OTP/get_otp..dart';

class StudentSignInScreen extends StatelessWidget {
  final int pageIndex;
  final PasswordField hideGetxController = Get.find<PasswordField>();
  StudentSignInScreen({required this.pageIndex, super.key});

 // final formKey = GlobalKey<FormState>();
  final StudentSignUpController studentSignUpController =
      Get.put(StudentSignUpController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
          foregroundColor: cWhite,
          title: SizedBox(
            // color: cred,
            height: 80.h,
            width: 115.w,
            child: Center(
                child: Image.asset(
              'assets/excel_karror/excelKaroor.png',
              color: Colors.white,
              fit: BoxFit.cover,
            )),
          ),
          backgroundColor: const Color.fromARGB(255, 6, 71, 157)),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            kHeight20,
            ContainerImage(
              height: 250.h,
              width: double.infinity,
              imagePath: 'assets/images/splash.png',
            ),
            kHeight30,
           studentSignUpController.isLoading.value
                ? circularProgressIndicatotWidget
                : SizedBox(
                    height: 60.h,
                    width: 350.w,
                    child: DropdownSearch<StudentModel>(
                        selectedItem: StudentModel(
                          admissionNumber: "",
                          alPhoneNumber: "",
                          bloodgroup: "",
                          createDate: "",
                          dateofBirth: "",
                          district: "",
                          gender: "",
                          houseName: "",
                          parentPhoneNumber: "",
                          place: "",
                          profileImageId: "",
                          profileImageUrl: '',
                          studentName: 'Select Student'.tr,
                          studentemail: '',
                          docid: '',
                          userRole: '',
                          classId: '',
                          guardianId: '',
                          parentId: '',
                        ),
                        validator: (v) => v == null ? "required field" : null,
                        items: studentSignUpController.classWiseStudentList,
                        itemAsString: (StudentModel u) => u.studentName,
                        onChanged: (value) {
                          UserCredentialsController.studentModel = value;
                        },onSaved: (newValue) => newValue!.studentName,),
                  ),
            kHeight30,
            Form(
              key: studentSignUpController. formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                          studentSignUpController.emailController,
                      function: checkFieldEmailIsValid),
                  kHeight10,
                  Padding(
                    padding: EdgeInsets.only(right: 29.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GooglePoppinsWidgets(
                            text: "* Use a valid email".tr,
                            fontsize: 13.w,
                            fontWeight: FontWeight.w400,
                            color: adminePrimayColor),
                      ],
                    ),
                  ),
         SigninTextFormfield(
                      hintText: 'Password'.tr,
                      obscureText: hideGetxController.isObscurefirst.value,
                      labelText: 'Password',
                      icon: Icons.lock,
                      textEditingController:
                          studentSignUpController.passwordController,
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
               SigninTextFormfield(
                      hintText: 'Confirm Password'.tr,
                      obscureText: hideGetxController.isObscureSecond.value,
                      labelText: 'Confirm Password',
                      icon: Icons.lock,
                      textEditingController:
                          studentSignUpController.confirmPasswordController,
                      function: checkFieldPasswordIsValid,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.lock),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(hideGetxController.isObscureSecond.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          hideGetxController.toggleObscureSecond();
                        },
                      ),
                    ),
                  kHeight10,
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: GestureDetector(
                      onTap: () async {
                        if (studentSignUpController.passwordController.text !=
                            studentSignUpController
                                .confirmPasswordController.text) {
                          showToast(msg: "Password Missmatch".tr);
                          return;
                        }
                         if(studentSignUpController.formKey.currentState!.validate()){
                       if (UserCredentialsController
                                  .studentModel?.parentPhoneNumber !=
                              null) {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UserSentOTPScreen(
                                  userpageIndex: pageIndex,
                                  phoneNumber:
                                      "+91${UserCredentialsController.studentModel?.parentPhoneNumber}",
                                  userEmail: studentSignUpController
                                      .emailController.text,
                                  userPassword: studentSignUpController
                                      .passwordController.text,
                                );
                          },));
                     
                          } else {
                            showToast(msg: "Please select student detail.".tr);
                          }
                         }
                      },
                      child: loginButtonWidget(
                        height: 60,
                        width: 180,
                        text: 'Submit'.tr,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?".tr,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return StudentLoginScreen(
                                pageIndex: 3,
                              );
                          },));
                          // Get.off(() => StudentLoginScreen(
                          //       pageIndex: 3,
                          //     ));
                        },
                        child: Text(
                          "Login".tr,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontSize: 19,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
