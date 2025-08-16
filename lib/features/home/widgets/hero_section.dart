// features/home/widgets/hero_section.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_tech_website/features/home/providers/control.dart';
import 'package:world_tech_website/features/home/widgets/empty_page.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(
      builder: (context, value, child) {
        return value.getbanner == null
            ? Center(child: CircularProgressIndicator())
            : value.employees['data'] == null || value.employees['data'].isEmpty
            ? Center(child: EmptyPage())
            : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: value.getbanner['data'].length,
              itemBuilder: (context, index) {
                return Image.network(
                  '${value.baseurl}/${value.getbanner['data'][index]['image']}',
                  width: MediaQuery.of(context).size.width,
                );
              },
            );
      },
    );
    // Image.asset(
    //   Assets.imagesHeroSectionBannerTest,
    //   width: MediaQuery.of(context).size.width,
    // );
  }
}
