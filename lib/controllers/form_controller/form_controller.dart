import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class FormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
      // Form is valid, process data further
      // print("Form is valid");
      // Example: Authenticate user, send data to server, etc.
    } else {
      // Form is invalid
      // print("Form is invalid");
    }
  }
}


class EditResultFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class PasswordFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class GroupFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class ChapterUploadController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class AcheviementsFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class ExamResultFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class CreateExamFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class UploadStudyMaterialsFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class RecordedClassCntl extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}

class HomeWorkController extends GetxController {
  final formKey = GlobalKey<FormState>();

  void submitForm(Function function) {
    if (formKey.currentState!.validate()) {
      function;
    } else {
     
    }
  }
}