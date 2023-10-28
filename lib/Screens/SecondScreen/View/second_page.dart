import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Screens/SecondScreen/Controller/second_page_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var secondPageController = Get.put(SecondPageController());
    // var count = "0".obs;

    // void increment() {
    //   count++;
    // }

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                // count.value = value;
              },
            ),
            GetBuilder(
              id: 'txtCount',
              init: SecondPageController(),
              builder: (controller) {
                return Text(
                  "count = ${controller.count}",
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            // Obx(() => Text(
            //       "count = ${secondPageController.count}",
            //       style: TextStyle(fontSize: 20),
            //     )),
            ElevatedButton(
                onPressed: () {
                  // increment();
                  secondPageController.increment();
                },
                child: Text("Increment")),
            Text("${Get.arguments}"),
            SizedBox(
              height: 30,
            ),
            OutlinedButton(
                onPressed: () {
                  Get.back(result: "Result from 2nd to 1st");
                },
                child: Text("Go back"))
          ],
        ),
      ),
    );
  }
}
