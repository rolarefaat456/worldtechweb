// features/projects/project_details_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/features/home/providers/control.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import '../../generated/assets.dart';
import '../home/widgets/footer_section.dart';

String getImageUrl(String originalUrl) {
  return 'https://cors-anywhere.herokuapp.com/$originalUrl';
}

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Consumer<Control>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width < 850 ? 16 : 32,
                    ),
                    Text(
                      value.projects['data'][index]['title'],
                      style: AppTextStyles.style40w500(context).copyWith(
                        fontFamily: "FingerPaint",
                        color: AppColors.darkerGrey,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width < 850 ? 16 : 32,
                    ),
                    Container(
                      width: double.infinity,
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
                            height: MediaQuery.of(context).size.width / 3,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(32),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.width < 850
                                        ? 300
                                        : 400,
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    Text(
                                      value
                                          .projects['data'][index]['description'],
                                      maxLines:
                                          MediaQuery.of(context).size.width <
                                                  850
                                              ? 6
                                              : 8,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          MediaQuery.of(context).size.width <
                                                  850
                                              ? AppTextStyles.style16w500(
                                                context,
                                              )
                                              : AppTextStyles.style20w500(
                                                context,
                                              ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          Assets.imagesIosButton,
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width /
                                              6,
                                        ),
                                        const SizedBox(width: 16),
                                        Image.asset(
                                          Assets.imagesAndroidButton,
                                          width:
                                              MediaQuery.of(
                                                context,
                                              ).size.width /
                                              6,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 20,
                          ),
                          child: Image.asset(
                            Assets.imagesBackgroundProjectDetails,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width / 7,
                          ),
                          child: Image.network(
                            '${value.baseurl}/${value.projects['data'][index]['image']}',
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 4,
                      ),
                      child: Image.asset(
                        Assets.imagesApplicationFeatures,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                        color: AppColors.whiteGrey,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: buildFeaturesList(context, value, index),
                    ),

                    SizedBox(height: 64),

                    FooterSection(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildFeaturesList(BuildContext context, Control value, int index) {
  final project = value.projects?['data']?[index];
  final features =
      project?['feature'] is List ? project['feature'] as List : [];

  if (value.projects == null) {
    return Center(child: CircularProgressIndicator());
  }

  if (features.isEmpty) {
    return Center(child: Text('no features'));
  }

  if (MediaQuery.of(context).size.width < 850) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: features.length,
      itemBuilder: (context, ind) {
        return FeatureItem(features[ind]?.toString() ?? '');
      },
    );
  }

  return Wrap(
    spacing: 16,
    runSpacing: 16,
    children:
        features.map<Widget>((f) {
          return SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: FeatureItem(f?.toString() ?? ''),
          );
        }).toList(),
  );
}

class FeatureItem extends StatelessWidget {
  final String text;
  FeatureItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Text(text, style: AppTextStyles.style20w500(context)),
    );
  }
}
