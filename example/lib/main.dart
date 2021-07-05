import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:example/targetScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Radial Speed Dial"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            RadialMenu(
              children: [
                RadialButton(
                    icon: Icon(Icons.ac_unit),
                    buttonColor: Colors.teal,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.camera_alt),
                    buttonColor: Colors.green,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.map),
                    buttonColor: Colors.orange,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.access_alarm),
                    buttonColor: Colors.indigo,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.watch),
                    buttonColor: Colors.pink,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.settings),
                    buttonColor: Colors.blue,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.mail_outline),
                    buttonColor: Colors.yellow,
                    onPress: () => Get.to(TargetScreen())),
                RadialButton(
                    icon: Icon(Icons.logout),
                    buttonColor: Colors.red,
                    onPress: () => Get.to(TargetScreen())),
              ],
            ),
            Positioned(
              top: 30,
              left: 10,
              child: ElevatedButton(
                  onPressed: () {
                    if (Get.isDarkMode) {
                      Get.changeTheme(ThemeData.light());
                    } else {
                      Get.changeTheme(ThemeData.dark());
                    }
                  },
                  child: Text("change Theme")),
            )
          ],
        ),
      ),
    );
  }
}
