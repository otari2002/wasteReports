import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.name,
    required this.isOnline, // New parameter indicating online status
    this.onTap,
  }) : super(key: key);

  final String name;
  final bool isOnline; // Indicates if the user is online
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black, // Change this to your avatar background color
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                isOnline? // Conditionally display the green circle
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.green,
                    ),
                  ):Container(),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: TextStyle(color: const Color.fromARGB(255, 2, 1, 1)),
            ),
          ],
        ),
      ),
    );
  }
}
