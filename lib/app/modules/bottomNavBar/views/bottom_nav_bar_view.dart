import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() =>controller.pages[controller.selectedIndex.value] ) ,
      bottomNavigationBar:Obx(() => BottomNavigationBar(
        backgroundColor:  const Color(0xFF24243E),
        
        currentIndex: controller.selectedIndex.value,
        onTap: (index)=>controller.barNavigation(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_outlined),
            activeIcon: Icon(Icons.data_usage),
            label: 'Storage Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.person),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed, // or shifting
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        iconSize: 30,
        showUnselectedLabels: true,
      ))
    );
  }
}
