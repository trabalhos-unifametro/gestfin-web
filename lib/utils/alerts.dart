import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeAlert {
  info,
  error,
  warning,
  success
}

const Map<TypeAlert, Color> colors = {
  TypeAlert.info: Colors.lightBlue,
  TypeAlert.error: Colors.redAccent,
  TypeAlert.warning: Colors.yellow,
  TypeAlert.success: Colors.greenAccent,
};

class Alert {
  static void show(BuildContext context, String message, { TypeAlert type = TypeAlert.info, Color textColor = Colors.white }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.topCenter,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          backgroundColor: colors[type],
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(message, style: TextStyle(color: textColor)),
              ],
            ),
          ),
        );
      },
    );
  }
}