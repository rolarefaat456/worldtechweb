// features/home/widgets/team_item.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/features/home/providers/animationcontaines.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({
    super.key,
    required this.firstName,
    required this.imagePath,
    required this.color,
    required this.text,
  });

  final String firstName;
  final String imagePath;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Animationcontaines(),

      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<Animationcontaines>(
          builder: (context, value, child) {
            return Column(
              children: [
                MouseRegion(
                  onEnter: (event) {
                    value.sethover(true);
                  },
                  onExit: (event) {
                    value.sethover(false);
                  },
                  child: Container(
                    width: 200,
                    height: 380,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(600),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(600),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                firstName,
                                style: AppTextStyles.style26w500(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                              
                              const SizedBox(height: 24),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(600),
                                child: Image.network(
                                  imagePath,
                                  width: 200,
                                  height: 246,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          AnimatedPositioned(
                            curve: Curves.ease,
                            duration: Duration(milliseconds: 300),
                            bottom: value.onhover ? 0 : -300,
                            child: Container(
                              width: 200,
                              height: 380,
                              decoration: BoxDecoration(
                                color: Color(0xffE9FE00),
                                borderRadius: BorderRadius.circular(600),
                              ),
                              child: Center(
                                child: Text(
                                  text,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                    fontFamily: 'assets/fonts/Tajawal-Bold.ttf',
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
