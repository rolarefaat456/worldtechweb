// features/home/widgets/projects_section.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/features/home/providers/animationbotton.dart';
import 'package:world_tech_website/features/home/providers/animationclass.dart';
import 'package:world_tech_website/features/home/providers/control.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../generated/assets.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key, required this.projectView});

  final VoidCallback projectView;

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with TickerProviderStateMixin {
      
  final ScrollController _controller = ScrollController();
  // static const int loopingFactor = 50;
  // static const int projectsCount = 5;
  // late final int _middleIndex;

  late final AnimationController _controllerlottie;

  @override
  void initState() {
    super.initState();

    _controllerlottie = AnimationController(vsync: this);

    // _middleIndex = (loopingFactor * projectsCount) ~/ 2;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final screenWidth = MediaQuery.of(context).size.width;
      // final itemWidth = screenWidth * 0.75 + 40; // عرض العنصر + الهوامش
      // final centerOffset = (itemWidth - screenWidth) / 2;

      // _controller.jumpTo(_middleIndex * itemWidth - centerOffset);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth * 0.75;

    return ChangeNotifierProvider(
      create: (context) => Animationbotton(),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 30,
                ),
                child: Image.asset(
                  Assets.imagesProgectsTitleimage,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width / 30,
                ),
                child: Text(
                  "قصص نجاحنا مع عملائنا\n تصفح اخر أعمالنا ",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.style22w500(context),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: MediaQuery.of(context).size.width / 2.5,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(
                dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
              ),
              child: Consumer<Control>(
                builder: (context, value, child) {
                  return value.projects == null
                      ? Center(child: CircularProgressIndicator())
                      : value.projects['data'] == null ||
                          value.projects['data'].isEmpty
                      ? Center(child: Text('no projects'))
                      : ListView.builder(
                        controller: _controller,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.projects['data'].length,
                        itemBuilder: (context, index) {
                          // final realIndex = index % projectsCount;
                          return Container(
                            width: itemWidth,
                            margin: EdgeInsets.symmetric(horizontal: 24),
                            decoration: BoxDecoration(
                              color: AppColors.whiteGrey,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 30,
                                ),
                                Image.asset(
                                  Assets.imagesProgetTest,
                                  height:
                                      MediaQuery.of(context).size.width / 2.5,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 30,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top:
                                          MediaQuery.of(context).size.width /
                                          30,
                                      bottom:
                                          MediaQuery.of(context).size.width /
                                          20,
                                      right:
                                          MediaQuery.of(context).size.width /
                                          40,
                                      left:
                                          MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          value
                                              .projects['data'][index]['title'],
                                          // "Gas Home App",
                                          style:
                                              MediaQuery.of(
                                                        context,
                                                      ).size.width <
                                                      850
                                                  ? AppTextStyles.style26w500(
                                                    context,
                                                  ).copyWith(
                                                    fontFamily: "FingerPaint",
                                                    color: AppColors.darkerGrey,
                                                  )
                                                  : AppTextStyles.style40w500(
                                                    context,
                                                  ).copyWith(
                                                    fontFamily: "FingerPaint",
                                                    color: AppColors.darkerGrey,
                                                  ),
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(
                                                        context,
                                                      ).size.width <
                                                      850
                                                  ? 8
                                                  : 24,
                                        ),
                                        Text(
                                          value
                                              .projects['data'][index]['description'],
                                          // "نقدم حلول برمجية متكاملة لأنظمة الحاسوب (Windows, macOS, Linux) مصممة خصيصًا لتناسب متطلبات عملك، سواء كانت تطبيقات إدارية، برامج محاسبة، أو أدوات إنتاجية متقدمة...",
                                          maxLines:
                                              MediaQuery.of(
                                                        context,
                                                      ).size.width <
                                                      850
                                                  ? 6
                                                  : 8,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              MediaQuery.of(
                                                        context,
                                                      ).size.width <
                                                      850
                                                  ? AppTextStyles.style16w500(
                                                    context,
                                                  )
                                                  : AppTextStyles.style20w500(
                                                    context,
                                                  ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        // itemCount: loopingFactor * projectsCount,
                        
                      );
                },
              ),
            ),
          ),
          Consumer<Animationbotton>(
            builder: (context, value, child) {
              return MouseRegion(
                onEnter: (event) {
                  value.sethover(true);
                  _controllerlottie
                    ..reset()
                    ..repeat();
                },
                onExit: (event) {
                  value.sethover(false);
                  _controllerlottie.stop();
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: value.onhover ? 1 : 0,
                        child: Container(
                          width: 200,
                          height: 200,
                          // color: Colors.transparent,
                          child: Transform.scale(
                            scale: 1.0,
                            child: Lottie.asset(
                              'assets/animations/celebrate.json',
                              //       width: 300,
                              // height: 300,
                              // repeat: true,
                              // animate: true,
                              controller: _controllerlottie,
                              onLoaded: (composition) {
                                _controllerlottie.duration =
                                    composition.duration;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: MaterialButton(
                        onPressed: widget.projectView,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width < 600
                                ? 12
                                : MediaQuery.of(context).size.width < 1200
                                ? 16
                                : 24,
                          ),
                        ),
                        height:
                            MediaQuery.of(context).size.width < 600
                                ? 48
                                : MediaQuery.of(context).size.width < 1200
                                ? 56
                                : 72,
                        minWidth:
                            MediaQuery.of(context).size.width < 600
                                ? 150
                                : MediaQuery.of(context).size.width < 1200
                                ? 200
                                : 300,
                        color: value.color,
                        child: Text(
                          "عرض جميع المشاريع",
                          style:
                              MediaQuery.of(context).size.width < 600
                                  ? AppTextStyles.style16w500(
                                    context,
                                  ).copyWith(color: value.textcolor)
                                  : MediaQuery.of(context).size.width < 1200
                                  ? AppTextStyles.style22w500(
                                    context,
                                  ).copyWith(color: value.textcolor)
                                  : AppTextStyles.style24w500(
                                    context,
                                  ).copyWith(color: value.textcolor),
                        ),
                      ),
                    ),
                    Animationclass(
                      bottomstart: 30,
                      leftstart:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.2 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width /50
                              // *
                                  // 0.15 // tablet
                              : MediaQuery.of(context).size.width *
                                  0.09, // desktop
                      //130,
                      bottomend: -60,
                      leftend:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.05 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  -0.001 // tablet
                              : MediaQuery.of(context).size.width *
                                  -0.02, // desktop
                      // MediaQuery.of(context).size.width*-0.02 ,// -20,
                      image:
                          'assets/images/a61f9390f579555c7d9491b74b8e250f6c5ba32e.png',
                      width: MediaQuery.of(context).size.width * 0.03,
                      height: MediaQuery.of(context).size.width * 0.03,
                      anglestart: -2.5,
                      angleend: -2.5,
                    ),
                    Animationclass(
                      bottomstart: 30,
                      leftstart:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.2 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width /20
                              // *
                                  // 0.12 // tablet
                              : MediaQuery.of(context).size.width *
                                  0.09, // desktop
                      //130,
                      bottomend: -40,
                      leftend:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.12 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.07 // tablet
                              : MediaQuery.of(context).size.width * 0.045, //50,
                      image:
                          'assets/images/a669bb818abf638d4b14347baf79d8c45d671cfe.png',
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.width * 0.02,
                      anglestart: -2,
                      angleend: -2,
                    ),
                    Animationclass(
                      bottomstart: 30,
                      leftstart:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.2 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.12 // tablet
                              : MediaQuery.of(context).size.width *
                                  0.09, // desktop
                      // 130,
                      bottomend: -70,
                      leftend:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.2 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.12 // tablet
                              : MediaQuery.of(context).size.width * 0.09, //130,
                      image:
                          'assets/images/a1e238861c91ea2c748b3326a64a12802fad5b32.png',
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.width * 0.02,
                      anglestart: 0,
                      angleend: 0,
                    ),
                    Animationclass(
                      bottomstart: 30,
                      leftstart:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.2 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.12 // tablet
                              : MediaQuery.of(context).size.width *
                                  0.09, // desktop
                      bottomend: -40,
                      leftend:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.27 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.17 // tablet
                              : MediaQuery.of(context).size.width * 0.14, //210,
                      image:
                          'assets/images/79274d7340564342ac777eccb705d2c2dcf37a0f.png',
                      width: MediaQuery.of(context).size.width * 0.02,
                      height: MediaQuery.of(context).size.width * 0.02,
                      anglestart: 2,
                      angleend: 2,
                    ),
                    Animationclass(
                      bottomstart: 30,
                      leftstart:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.2 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.12 // tablet
                              : MediaQuery.of(context).size.width *
                                  0.09, // desktop
                      bottomend: -60,
                      leftend:
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width *
                                  0.35 // mobile
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width *
                                  0.23 // tablet
                              // : MediaQuery.of(context).size.width*0.09, // desktop
                              : MediaQuery.of(context).size.width *
                                  0.19, // 280,
                      image:
                          'assets/images/f03b41358f94dc514751583f4ed0162bff36b8cf.png',
                      width: MediaQuery.of(context).size.width * 0.03,
                      height: MediaQuery.of(context).size.width * 0.03,
                      anglestart: 2.5,
                      angleend: 2.5,
                    ),
                  ],
                ),
              );
            },
          ),

          // SizedBox(height: MediaQuery.of(context).size.width < 850 ? 16 : 32),
        ],
      ),
    );
  }
}


