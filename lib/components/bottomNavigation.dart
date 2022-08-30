import 'package:flutter/material.dart';
    
Widget createBottomBar(){
  return  BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Shop',
          ),
        ],
      selectedItemColor: Colors.grey, // seçili olan items
      unselectedItemColor: Colors.grey, // seçili olmayan items
      showSelectedLabels: true, // seçili olanların etiketinin durumu
      showUnselectedLabels: true, // seçili olmayanların etiketinin durumu true o zaman ekranda gözükür kapatmak için false yapabilirsiniz


      );
}