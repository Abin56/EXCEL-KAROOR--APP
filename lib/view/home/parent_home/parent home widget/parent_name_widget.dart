import 'package:flutter/material.dart';
import 'package:excel_karror/controllers/userCredentials/user_credentials.dart';
import 'package:excel_karror/view/constant/sizes/constant.dart';
import 'package:excel_karror/view/home/events/event_display_school_level.dart';
import 'package:excel_karror/view/home/parent_home/parent_profile_edit/parent_edit_profile.dart';

class ParentNameWidget extends StatelessWidget {
  const ParentNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 05,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CircleAvatar(backgroundImage:  NetworkImage(
                                      UserCredentialsController
                                              .parentModel!.profileImageURL ??
                                          netWorkImagePathPerson),
                  radius: 25,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 10),
                child: SizedBox(
                  width: 200,
                  child: GooglePoppinsEventsWidgets(
                    text: UserCredentialsController
                                 .parentModel!.parentName!,
                    fontsize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return 
                      ParentEditProfileScreen();
                      },));
                    }, icon: const Icon(Icons.now_widgets)))
          ],
        ),
      ),
    );
  }
}
