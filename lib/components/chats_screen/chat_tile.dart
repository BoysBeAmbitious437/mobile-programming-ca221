import 'package:flutter/material.dart';

class ChatTile extends StatefulWidget {

  String imageUrl;
  String chatTitle;
  String message;
  String time;  


  ChatTile(
    {required this.imageUrl, 
    required this.chatTitle, 
    required this.message, 
    required this.time,
    super.key});

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Profile Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    widget.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,), 
                ),

                // Chat Title and Message
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Chat Title
                      Text(
                        '${widget.chatTitle}', 
                        style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500
                        ),
                      ),
                  
                      // Message
                      Text(
                        '${widget.message}', 
                        style: TextStyle(
                          fontSize: 15, color: Colors.black54
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Time
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('${widget.time}'),
            ),
          ],
        ),
      ),
    );
  }
}