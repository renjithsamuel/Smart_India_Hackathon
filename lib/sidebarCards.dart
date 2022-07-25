import 'package:flutter/material.dart';

Card getsideCards(String picname2, String title2, BuildContext context) {
  return Card(
    child: Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(10.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            child: Image(
              image: AssetImage(picname2),
              width: 20,
              height: 20,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(title2),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    ),
  );
}
