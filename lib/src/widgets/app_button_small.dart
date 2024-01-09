import 'package:enlightenme/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AppButtonSmall extends StatelessWidget {
  const AppButtonSmall(
      {Key? key,
      required this.onClick,
      required this.title,
      this.enabled = true,
      this.colorVal})
      : super(key: key);

  final VoidCallback onClick;
  final String title;
  final bool enabled;
  final Color? colorVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: enabled
                ? colorVal != null
                    ? colorVal
                    : AppColors.dodgerblue
                : Colors.grey.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5.0,
          ),
          onPressed: () {
            if (enabled) {
              onClick();
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8,4,8,4),
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )),
    );
  }
}
