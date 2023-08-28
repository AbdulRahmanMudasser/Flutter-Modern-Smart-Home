import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modern_smart_home_app/config/app_size_config.dart';

class SmartDeviceBox extends StatelessWidget {
  const SmartDeviceBox({
    super.key,
    required this.name,
    required this.icon,
    required this.powerOn,
    required this.onChanged,
  });

  final String name;
  final String icon;
  final bool powerOn;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding:  EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // icon
            Image.asset(
              icon,
              height: 65,
              color: powerOn ? Colors.white : Colors.black,
            ),

            // smart device name, switch
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: getProportionateScreenWidth(20)),
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.bold,
                        color: powerOn ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerOn,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
