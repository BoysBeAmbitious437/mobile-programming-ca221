import 'package:flutter/material.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Logo
            const Row(
              children: [
                Text('WhatsApp', style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                ),),
              ],
            ),
      
      
            //Icons
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined)),
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                PopupMenuButton(itemBuilder: (context){
                  return [
                    PopupMenuItem(child: SizedBox())
                  ];
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}