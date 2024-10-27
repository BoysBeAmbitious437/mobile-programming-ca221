import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/screens/calls_screen.dart';
import 'package:tugaspertemuan03/screens/chats_screen.dart';
import 'package:tugaspertemuan03/screens/communities_screen.dart';
import 'package:tugaspertemuan03/screens/updates_screen.dart';

class NavigationSection extends StatefulWidget {
  const NavigationSection({super.key});

  @override
  State<NavigationSection> createState() => _NavigationSectionState();
}

class _NavigationSectionState extends State<NavigationSection> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.green.shade100,
        destinations: const[
          NavigationDestination(
            icon: Icon(Icons.message), 
            selectedIcon: Icon(Icons.message, color: Colors.green,),
            label: "Chats", 
          ),
          NavigationDestination(
            icon: Icon(Icons.circle_outlined), 
            selectedIcon: Icon(Icons.circle_outlined, color: Colors.green,),
            label: "Updates", 
          ),
          NavigationDestination(
            icon: Icon(Icons.people), 
            selectedIcon: Icon(Icons.people, color: Colors.green,),
            label: "Communities", 
          ),
          NavigationDestination(
            icon: Icon(Icons.call), 
            selectedIcon: Icon(Icons.call, color: Colors.green,),
            label: "Calls",
          ),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (int index){
          setState(() {
            currentIndex = index;

          });
        },
      ),
      body: _buildBody(),
    );
  }
  Widget _buildBody(){
    switch (currentIndex){
      case 0:
        return ChatsScreen();
      case 1:
        return UpdatesScreen();
      case 2:
        return CommunitiesScreen();
      case 3:
        return CallsScreen();
      default:
        return ChatsScreen();
    }
  }
}

