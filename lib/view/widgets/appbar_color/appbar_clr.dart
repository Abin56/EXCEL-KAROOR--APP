import 'package:excel_karror/view/colors/colors.dart';
import 'package:flutter/material.dart';

class AppBarColorWidget extends StatelessWidget {
  const AppBarColorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: adminePrimayColor,
        // Color.fromARGB(255, 88, 167, 123),
        // color: cgraident.withOpacity(0.5),
      ),
    );
  }
}
