import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/features/home/providers/animationbotton.dart';

class Animationclass extends StatelessWidget
{
  final double bottomstart;
    final double leftstart;
    final double bottomend;
    final double leftend;
    final String image;
    final double width;
    final double height;
    final double anglestart;
    final double angleend;
  const Animationclass({super.key, required this.bottomstart, required this.leftstart, required this.bottomend, required this.leftend, required this.image, required this.width, required this.height, required this.anglestart, required this.angleend});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Animationbotton>(
      builder:(context, value, child) {
        return AnimatedPositioned(
                              bottom: value.onhover ? bottomend : bottomstart,
                              left: value.onhover ? leftend : leftstart,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeOut,
                              child: AnimatedOpacity(
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                opacity: value.onhover ? 1 : 0,
                                child: Transform.rotate(
                                  angle: value.onhover ? angleend: anglestart,
                                  child: Container(
                                    width: width,
                                    height: height,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          '$image',
                                        )
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            );
      }
    );
  }
}