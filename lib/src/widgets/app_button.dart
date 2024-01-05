import 'package:enlightenme/src/theme/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.onClick,
    required this.title,
    this.enabled = true,
  }) : super(key: key);

  final VoidCallback onClick;
  final String title;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                enabled ? AppColors.dodgerblue : Colors.grey.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            elevation: 15.0,
          ),
          onPressed: () {
            if (enabled) {
              onClick();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          )),
    );
  }
}
