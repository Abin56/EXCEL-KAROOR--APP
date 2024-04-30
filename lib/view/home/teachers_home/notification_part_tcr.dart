import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:excel_karror/utils/utils.dart';
import 'package:excel_karror/view/colors/colors.dart';

class NotificationPartTcr extends StatelessWidget {
  const NotificationPartTcr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: cWhite,
        title: const Text("Notices"),
        backgroundColor: adminePrimayColor,
      ),
      body: StreamBuilder(
          stream: server
              .collection('AllUsersDeviceID')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("Notification_Message")
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  // physics:
                  //     const NeverScrollableScrollPhysics(),
                  // shrinkWrap: false,
                  itemBuilder: (context, index) {
                    final data = snapshot.data!.docs[index].data();
                    return InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          shape: const BeveledRectangleBorder(),
                          context: context,
                          builder: (context) {
                            return Container(
                              color: Color(data['whiteshadeColor']),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    color: Color(data['containerColor']),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 18),
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconData(
                                            data['icon'],
                                            fontFamily: 'MaterialIcons',
                                          ),
                                          size: 25,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          data['headerText'],
                                          // "Holiday",
                                          style: const TextStyle(
                                              color: cWhite,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Text(
                                      data['messageText'],
                                      // " Tommorow is Holiday Tommorow is Holiday Tommorow is Holiday Tommorow is Holiday",
                                      textAlign: TextAlign.justify,
                                      style: const TextStyle(
                                        fontSize: 17,
                                        color: cWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 9),
                        child: ListTile(
                          tileColor: Color(data['whiteshadeColor']),
                          leading: CircleAvatar(
                            backgroundColor: Color(data['containerColor']),
                            radius: 25,
                            child: Center(
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(data['whiteshadeColor']),
                                child: Center(
                                  child: Icon(
                                    IconData(data['icon'],
                                        fontFamily: 'MaterialIcons'),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            data['headerText'],
                            // "Holiday",
                            style: const TextStyle(
                                color: cWhite,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            data['messageText'],
                            // "Tommorow is Holiday",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: cWhite,
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                    "Do you want to remove the notification ?",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "No",
                                        style: TextStyle(color: cblack),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "yes",
                                        style: TextStyle(color: cblack),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.close,
                              size: 20,
                              color: cWhite,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                  itemCount: snapshot.data!.docs.length);
            } else if (snapshot.data == null) {
              return circularProgressIndicatotWidget;
            } else {
              return Center(
                child: Text(
                  "NO Notifications",
                  style: TextStyle(
                    fontSize: 20,
                    color: cblack.withOpacity(0.5),
                  ),
                ),
              );
            }
          }),
    );
  }
}
