import 'package:flutter/material.dart';
import 'package:excel_karror/view/colors/colors.dart';

class ParentViewAllCategories extends StatelessWidget {
 final Function onTap;
   const ParentViewAllCategories({
    super.key,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 230),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 213, 225, 252),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15)),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 100, right: 20, left: 20),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border.all(color: cblack.withOpacity(0.1)),
                    color: const Color.fromARGB(255, 218, 230, 247),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'QUICK ACTIONS',
                        style: TextStyle(
                            color:
                                Color.fromARGB(255, 82, 61, 203),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: onTap as void Function()?,
                        child: Text(
                          "View all",
                          style:
                              TextStyle(color: cblack.withOpacity(0.8)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 80, right: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'NOTIFICATIONS',
                        style: TextStyle(
                            color:adminePrimayColor,
                               // Color.fromARGB(255, 48, 88, 86),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 1,
                            color:adminePrimayColor
                            // const Color.fromARGB(255, 48, 88, 86)
                                .withOpacity(0.1),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 290,
                    child: ListView.separated(
                        // physics:
                        //     const NeverScrollableScrollPhysics(),
                        // shrinkWrap: false,
                        itemBuilder: (context, index) {
                          return const ListTile(
                            leading: CircleAvatar(
                              backgroundColor: cWhite,
                              radius: 25,
                              child: Center(
                                child: CircleAvatar(
                                  radius: 20,
                                ),
                              ),
                            ),
                            title: Text(
                              "Holiday",
                              style: TextStyle(
                                  color:adminePrimayColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Tommorow is Holiday",
                              style: TextStyle(
                                color: adminePrimayColor,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox();
                        },
                        itemCount: 10),
                  )
                ],
              ),
            ),
          ],
        ),
    
        // child: const Column(
        //   children: [],
        // ),
      ),
    );
  }
}