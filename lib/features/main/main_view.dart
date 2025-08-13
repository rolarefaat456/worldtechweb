// features/main/main_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/core/utils/app_text_style.dart';
import 'package:world_tech_website/features/home/providers/control.dart';

import '../../constant.dart';
import '../../core/utils/app_colors.dart';
import '../home/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<Control>(context, listen: false).Projects();
      Provider.of<Control>(context, listen: false).Employees();
      Provider.of<Control>(context, listen: false).GetBanner();
      // print('getbanner is $getbanner');
    });
  }
  String activeItem = "الصفحة الرئيسية";

  final List<Map<String, dynamic>> navItems = [
    {'title': 'الصفحة الرئيسية', 'index': 0},
    {'title': 'الخدمات', 'index': 1},
    {'title': 'المشاريع', 'index': 2},
    {'title': 'من نحن', 'index': 3},
    {'title': 'اتصل بنا', 'index': 4},
  ];

  int currentIndex = 0;
  int homeScrollIndex = 0;
  bool projectView = false;

  void onNavItemTap(int tapIndex) {
    if (tapIndex <= 4) {
      setState(() {
        activeItem = navItems[tapIndex]['title'];
        currentIndex = 0;
        homeScrollIndex = tapIndex;
      });
    } else {
      setState(() {
        activeItem = navItems[tapIndex]['title'];
        currentIndex = tapIndex;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: direction,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E1E1E), Color(0xFF2C2C2C)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: IndexedStack(
                index: currentIndex,
                children: [
                  HomeView(
                    scrollToSectionIndex: homeScrollIndex,
                    projectView: projectView,
                    onProjectChanged: (bool value) {
                      setState(() {
                        projectView = value;
                      });
                    },
                    onSectionChanged: (int index) {
                      setState(() {
                        homeScrollIndex == index
                            ? activeItem = navItems[index]['title']
                            : activeItem = navItems[index]['title'];
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top:
                    MediaQuery.of(context).size.width < 440
                        ? 44
                        : MediaQuery.of(context).size.width < 1200
                        ? 24
                        : 44,
              ),
              child: Container(
                height:
                    MediaQuery.of(context).size.width < 440
                        ? 40
                        : MediaQuery.of(context).size.width < 1200
                        ? 64
                        : 80,

                width:
                    MediaQuery.of(context).size.width < 440
                        ? 380
                        : MediaQuery.of(context).size.width < 1200
                        ? 680
                        : 800,
                decoration: BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        MediaQuery.of(context).size.width < 440
                            ? 8
                            : MediaQuery.of(context).size.width < 1200
                            ? 20
                            : 60,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        navItems.asMap().entries.map((entry) {
                          int idx = entry.key;
                          String title = entry.value['title'];
                          final bool isActive = title == activeItem;
                          return InkWell(
                            onTap: () {
                              if (projectView) {
                                setState(() {
                                  projectView = false;
                                });
                                Future.delayed(Duration(seconds: 2)).then((_) {
                                  onNavItemTap(idx);
                                });
                              } else {
                                onNavItemTap(idx);
                              }
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              padding:  EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal:MediaQuery.of(context).size.width < 440
                            ?6
                            : MediaQuery.of(context).size.width < 1200
                            ? 8
                            : 16,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width > 1200
                                            ? 4
                                            : MediaQuery.of(
                                                  context,
                                                ).size.width >
                                                800
                                            ? 3
                                            : MediaQuery.of(
                                                  context,
                                                ).size.width >
                                                480
                                            ? 2
                                            : 1,
                                  ),
                                  Text(
                                     title,
                                    style: AppTextStyles.style14w500(
                                      context,
                                    ).copyWith(color: AppColors.white),
                                  ),
                                  const Spacer(),
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    height:
                                        MediaQuery.of(context).size.width > 1200
                                            ? 4
                                            : MediaQuery.of(
                                                  context,
                                                ).size.width >
                                                800
                                            ? 3
                                            : MediaQuery.of(
                                                  context,
                                                ).size.width >
                                                480
                                            ? 2
                                            : 1,
                                    width:
                                        isActive
                                            ? MediaQuery.of(
                                                  context,
                                                ).size.width /
                                                30
                                            : 0,
                                    decoration: BoxDecoration(
                                      color: AppColors.yellow,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
