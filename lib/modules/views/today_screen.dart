import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Updated import
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routine/core/strings.dart';

import '../controllers/today_controller.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodayController controller = Get.put(TodayController());

    return Scaffold(
      body: Obx(() {
        RxString name = controller.username;
        final theme = Theme.of(context);
        final isDarkMode = theme.brightness == Brightness.dark;
        final String logoPath =
        isDarkMode ? 'assets/svgs/5.svg' : 'assets/svgs/5_dark.svg';

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 54, left: 16, right: 16),
              child: SizedBox(
                child: Row(
                  children: <Widget>[
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.colorScheme.onBackground,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.all(4),
                          child: ClipOval(
                            child: SvgPicture.asset(
                              logoPath,
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$name\'s Routine',
                              style: GoogleFonts.inter(
                                color: theme.colorScheme.onBackground,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              AppStrings.today,
                              style: GoogleFonts.inter(
                                color: theme.colorScheme.onSecondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}