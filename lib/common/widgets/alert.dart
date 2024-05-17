import 'package:flutter/material.dart';

Future<bool> alert(BuildContext context, String message,
    ) async {
  bool result=  await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0)
        ),
        title: Text('Are you sure ?'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop(false);
            },
            child: Text(
                'No',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                )
            ),
          ),
          TextButton(
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop(true);
            },
            child: Text(
                'Yes',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                )
            ),
          )
        ],
      )
  );
  return result;
}
