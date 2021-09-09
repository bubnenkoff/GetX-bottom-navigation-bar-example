import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';


void main() {
  Get.put(NavigationBarController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: HomeBinding(),
      home: Obx( () => Scaffold(
          appBar: AppBar(
            title: Text("Demo"),
          ),
          body: SafeArea(
            child: NavigationBarController.to.currentPage,

          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: Get.find<NavigationBarController>().tabIndex.value,
              onTap: Get.find<NavigationBarController>().changeTabIndex,
              items: [
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.home,
                  label: 'Button1',
                ),
                _bottomNavigationBarItem(
                  icon: CupertinoIcons.rocket_fill,
                  label: 'Button2',
                ),
              ])),


    ),
     
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
    
    );
  }
}

class NavigationBarController extends GetxController {
  static NavigationBarController get to => Get.find();
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }

  List<Widget> pages = [
    Widget1(),
    Widget2(),
    // Widget3(),
  ];

 Widget get currentPage => pages[tabIndex.value];


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class Controller1 extends GetxController {
  var _test2 = "test1".obs;
  get test1 => this._test2.value;
}

class Controller2 extends GetxController {
  var _test2 = "test2".obs;
  get test1 => this._test2.value;
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Widget1", style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 32) ),
    );
  }
}


// class HomeBinding extends Bindings {
//   @override
//   void dependencies() {
//      Get.lazyPut(() => NavigationBarController());
//   }
  
// }

class Widget1_Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller1());
  }
}

class Widget2_Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller2());
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Widget2", style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 32) ),
    );
  }
}

_bottomNavigationBarItem({required IconData icon, required String label}) {
  return BottomNavigationBarItem(
    icon: Icon(icon),
    label: label,
  );
}
