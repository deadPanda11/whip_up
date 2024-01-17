import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whip_up/models/core/recipe.dart';
import 'package:whip_up/views/screens/recipe_detail_page.dart';
import 'package:whip_up/views/utils/AppColor.dart';

import '../../models/core/myRecipe.dart';

class PopularRecipeCard extends StatelessWidget {
  final MyRecipe data;

  PopularRecipeCard({required this.data});
  @override
  Widget build(BuildContext context) {
    String basePath = 'http://192.168.2.105:8000/recipe-image/';
    String imagePath = data.imageUrl;

    String imageUrl = basePath + imagePath;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipeDetailPage(data: data)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 160,
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.all(15),
        // Image
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular Now Tag Card
            Container(
              margin: EdgeInsets.only(bottom: 8),
              width: 95,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColor.primary),
              child: Text(
                'Popular Now!!!',
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
              ),
            ),
            // Recipe Info Wrapper
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                child: Container(
                  height: 80,
                  width: 165,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black.withOpacity(0.26),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Recipe Title
                      Text(
                        data.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white, fontSize: 14, height: 150 / 100, fontWeight: FontWeight.w600, fontFamily: 'inter'),
                      ),
                      // Recipe Calories and Time
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/fire-filled.svg',
                              color: Colors.white,
                              width: 12,
                              height: 12,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                data.difficulty,
                                style: TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                            SizedBox(width: 10),
                            Image.asset(
                              'assets/icons/serving-dish.png',
                              color: Colors.white,
                              width: 15,
                              height: 15,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text(
                                data.cuisine,
                                style: TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
