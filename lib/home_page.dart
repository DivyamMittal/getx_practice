import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Screens/SecondScreen/View/second_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var data;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx Practice"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    "title", "message",
                    snackPosition: SnackPosition.BOTTOM,
                    // backgroundColor: Colors.amber,
                    isDismissible: true,
                    // dismissDirection: DismissDirection.horizontal,
                    mainButton: TextButton(
                        onPressed: () {}, child: const Text("Retry")),
                    overlayBlur: 2,
                    snackbarStatus: (status) {
                      print(status);
                    },
                    icon: const Icon(Icons.message),
                  );
                },
                child: const Text("Show SnackBar")),

            // dialog button
            ElevatedButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Dialog title",
                    titleStyle: const TextStyle(fontSize: 20),
                    middleText: "Dialog content",
                    middleTextStyle: const TextStyle(fontSize: 16),
                    content: const Column(
                      children: [Text("Override the middle text")],
                    ),

                    // default cancel and sve button
                    textCancel: "Cancel",
                    textConfirm: "Confirm",
                    // cancelTextColor: Colors.white,
                    // confirmTextColor: Colors.white,
                    onCancel: () {},
                    onConfirm: () {},

                    // customised buttons - it will override the default button
                    // cancel: ElevatedButton(
                    //     onPressed: () {}, child: Text("Cancell")),
                    // confirm:
                    //     ElevatedButton(onPressed: () {}, child: Text("Confim")),

                    // customised action buttons
                    actions: [
                      // TextButton(onPressed: () {}, child: Text("Retry"))
                    ],
                    barrierDismissible: true,
                  );
                },
                child: const Text("Show Dialog")),

            // Model Sheet
            ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                      // backgroundColor: Colors.white,

                      isScrollControlled: true,
                      enableDrag: false,
                      Container(
                        child: Wrap(
                          children: [
                            ListTile(
                              onTap: () {
                                Get.changeTheme(
                                    ThemeData.light(useMaterial3: true));
                              },
                              leading: Icon(Icons.wb_sunny_outlined),
                              title: Text("Light theme"),
                            ),
                            ListTile(
                              leading: Icon(Icons.wb_sunny),
                              onTap: () {
                                Get.changeTheme(
                                    ThemeData.dark(useMaterial3: true));
                              },
                              title: Text("Dark theme"),
                            ),
                          ],
                        ),
                      ));
                },
                child: const Text("Model Sheet")),

            // button to navigate to second page using getx unnamed route
            ElevatedButton(
              onPressed: () async {
                data = await Get.to(SecondPage(),
                    arguments: "Message send from 1st to 2nd");
                // Get.off(SecondPage());
                // Get.offAll(SecondPage());
                log("$data");
              },
              child: Text("Navigate using unnamed route"),
            ),
            Text("$data"),

            // button to navigate to second page using getx named route
            ElevatedButton(
              onPressed: () async {
                Get.toNamed('/secondPage');
                // Get.off(SecondPage());
                // Get.offAll(SecondPage());
              },
              child: Text("Navigate using Named route"),
            ),
          ],
        ),
      ),
    );
  }
}
