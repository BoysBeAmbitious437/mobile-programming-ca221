import 'package:flutter/material.dart';
import 'package:tugaspertemuan03/components/chats_screen/chat_tile.dart';
import 'package:tugaspertemuan03/components/chats_screen/header_section.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  // Chat Tile Data List
  final List<Map<String, String>> chatData = [
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2015/11/15/21/31/lego-1044891_640.jpg',
      'chatTitle': 'Dustin',
      'message': 'Tugas Mobile Programming',
      'time': '01:30',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2020/01/24/08/43/redhead-4789668_1280.jpg',
      'chatTitle': 'Mary Scott',
      'message': 'Where are you?',
      'time': '10:12',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2017/08/05/14/21/love-2583943_640.jpg',
      'chatTitle': 'Professor Dean',
      'message': 'Your welcome!',
      'time': '08:30',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2024/05/19/08/39/work-8772016_640.jpg',
      'chatTitle': 'Mr. Luminee',
      'message': 'Huh?',
      'time': '14:50',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2023/12/05/15/26/exhibition-8431913_640.jpg',
      'chatTitle': 'Steve',
      'message': 'Wanna hit the pub later?',
      'time': '14:11',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2014/07/24/05/25/pedestrians-400811_640.jpg',
      'chatTitle': 'Mona',
      'message': 'Status?',
      'time': '13:38',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2020/01/23/16/42/embrace-4788167_640.jpg',
      'chatTitle': 'Geoff',
      'message': 'Cheese?',
      'time': '11:10',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2022/12/16/01/41/balloons-7658766_640.jpg',
      'chatTitle': 'Stranger 1',
      'message': 'Ping',
      'time': '03:30',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2019/01/27/22/32/mountains-3959204_640.jpg',
      'chatTitle': 'Bung Cokro',
      'message': 'Gimana?',
      'time': '21:30',
    },
    {
      'imageUrl': 'https://cdn.pixabay.com/photo/2023/01/28/12/18/fog-7750811_640.jpg',
      'chatTitle': 'Jeff',
      'message': 'My name is Jeff',
      'time': '23:50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatData.length+1,
        itemBuilder: (context, index){
          if(index == 0){
            return const HeaderSection();
          }else{
            final chat = chatData[index - 1];
            return ChatTile(
              imageUrl: chat['imageUrl']!, 
              chatTitle: chat['chatTitle']!, 
              message: chat['message']!, 
              time: chat['time']!, 
            );
          }
        },
      ),
    );
  }
}