import 'package:flutter/material.dart';
import 'package:flutter_modern_smart_home_app/components/widgets/smart_device_box.dart';
import 'package:flutter_modern_smart_home_app/config/app_assets.dart';
import 'package:flutter_modern_smart_home_app/config/app_constants.dart';
import 'package:flutter_modern_smart_home_app/config/app_size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of smart devices
  List smartDevices = [
    ["Smart Light", AppAssets.lightBulb, true],
    ["Smart AC", AppAssets.airConditioner, false],
    ["Smart TV", AppAssets.smartTv, false],
    ["Smart Fan", AppAssets.fan, false],
  ];

  // change the status of power on -> off
  changePowerStatus(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppSizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(AppConstants.horizontalPadding),
                vertical: AppConstants.verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    AppAssets.menu,
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // welcome home Abdul Rahman
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(AppConstants.horizontalPadding),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(28),
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    "ABDUL RAHMAN",
                    style: GoogleFonts.bebasNeue(
                      fontSize: getProportionateScreenWidth(50),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(AppConstants.horizontalPadding),
              ),
              child: Divider(
                color: Colors.grey[200],
                thickness: 1,
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // smart devices, grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(AppConstants.horizontalPadding),
              ),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: smartDevices.length,
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    name: smartDevices[index][0],
                    icon: smartDevices[index][1],
                    powerOn: smartDevices[index][2],
                    onChanged: (value) => changePowerStatus(value, index),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
