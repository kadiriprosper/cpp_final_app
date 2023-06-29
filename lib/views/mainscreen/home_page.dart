import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            HomeHeaderWidget(
              //TODO: Change the image and name to the current user
              profilePic: HelperFunctions.profilePic,
              username: 'Kelvin',
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                //TODO: Put the controller
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: CustomColor.buttonColor1,
                  ),
                  suffixIcon: IconButton(
                    //TODO: change the icon
                    icon: Icon(
                      MdiIcons.filterSettings,
                      color: CustomColor.buttonColor1,
                    ),
                    onPressed: () {},
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            //TODO: Change the widget to a proper carousal
            SizedBox(
              height: 140,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    HelperFunctions.sliderImages.length,
                    (index) => SliderWidget(
                      onPressed: () {},
                      buttonTitle:
                          'Get Started', //TODO: Connect to a list of button name
                      label:
                          'What do yo want to learn', //TODO: Connect to a list of slider titles
                      sliderColor: [
                        CustomColor.color1,
                        CustomColor.color2,
                        CustomColor.color3
                      ][index],
                      photoPath: HelperFunctions.sliderImages[index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 130,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    HelperFunctions.categoryImages.length,
                    (index) => CategoryWidget(
                      label: 'Design',
                      onPressed: () {},
                      photoPath: HelperFunctions.categoryImages[index],
                      isFirst: index == 0,
                      isLast: index ==
                          HelperFunctions.categoryImages.indexOf(
                            HelperFunctions.categoryImages.last,
                          ),
                      color: [
                        CustomColor.color1,
                        CustomColor.color2,
                        CustomColor.color4,
                        CustomColor.color4,
                      ][index],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              // height: 230,
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.symmetric(horizontal: 10).copyWith(
              //   bottom: 10,
              // ),
              child: Column(
                children: [
                  CategoryHeader(
                    buttonLabel: 'See All',
                    label: 'Trending Course',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 5),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   // height: 200,
                  //   constraints:
                  //       const BoxConstraints(maxHeight: 210, minHeight: 200),
                  //   // color: Colors.black,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       TrendingCategoryCard(
                  //         imagePath: HelperFunctions.trendingImages.first,
                  //         label: 'UI/UX Design Master class and',
                  //         onBookMark: () {},
                  //         onPressed: () {},
                  //       ),
                  //       TrendingCategoryCard(
                  //         imagePath: HelperFunctions.trendingImages[1],
                  //         label: 'Office management master class',
                  //         onBookMark: () {},
                  //         onPressed: () {},
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            (MediaQuery.of(context).size.width / 150).floor(),
                      ),
                      itemBuilder: (context, index) {
                        return GridTile(
                          child: Column(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingCategoryCard extends StatelessWidget {
  const TrendingCategoryCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onBookMark,
    required this.onPressed,
  });

  final String imagePath;
  final String label;
  final VoidCallback onBookMark;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 16,
        margin: const EdgeInsets.all(8),
        // height: 200,
        decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              width: (MediaQuery.of(context).size.width / 2) - 6,
              height: 160,
              // decoration: BoxDecoration(
              //   // color: Colors.white,
              //   borderRadius: BorderRadius.circular(15),
              //   image: DecorationImage(
              //     image: AssetImage(imagePath),
              //     fit: BoxFit.contain,
              //   ),
              // ),
              child: Stack(
                children: [
                  Image.asset(imagePath),
                  Positioned(
                    top: 15,
                    left: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(3),
                      //TODO: Check to see if the course has been bookmmarked
                      //use the isBookmarked variable
                      child: Center(
                        child: IconButton(
                          padding: EdgeInsets.zero,

                          onPressed: onBookMark,
                          //TODO: Update icon on click
                          icon: const Icon(Icons.bookmark_outline_outlined),
                          iconSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 3,
                  right: 3,
                ),
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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

class TrendingCategoryWidget extends StatelessWidget {
  const TrendingCategoryWidget({
    super.key,
    required this.isBookmarked,
    required this.title,
    required this.onClicked,
    required this.imagePath,
  });

  final bool isBookmarked;
  final String title;
  final String imagePath;
  final VoidCallback onClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: 160,
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  image: AssetImage(
                    imagePath,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    left: 12,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(3),
                      //TODO: Check to see if the course has been bookmmarked
                      //use the isBookmarked variable
                      child: const Center(
                        child: Icon(
                          Icons.bookmark_outline_outlined,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 5),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    super.key,
    required this.label,
    required this.onPressed,
    required this.buttonLabel,
  });

  final String label;
  final VoidCallback onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          MaterialButton(
            onPressed: onPressed,
            textColor: CustomColor.buttonColor1,
            padding: EdgeInsets.zero,
            child: Text(
              buttonLabel,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.label,
    required this.onPressed,
    required this.photoPath,
    required this.isFirst,
    required this.isLast,
    required this.color,
  });

  final String label;
  final VoidCallback onPressed;
  final String photoPath;
  final bool isFirst;
  final bool isLast;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                photoPath,
                height: 40,
              ),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
    required this.label,
    required this.sliderColor,
    required this.photoPath,
  });

  final VoidCallback onPressed;
  final String buttonTitle;
  final String label;
  final Color sliderColor;
  final String photoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // width: MediaQuery.of(context).size.width / 1.2,
      width: 260,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15)
          .copyWith(right: 0),
      decoration: BoxDecoration(
        color: sliderColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                MaterialButton(
                  onPressed: onPressed,
                  textColor: CustomColor.buttonColor1,
                  child: Text(buttonTitle),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(photoPath),
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.high),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.profilePic,
    required this.username,
  });

  final String profilePic;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          //TODO: Is this profile pic clickable?
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 24,
              //TODO: Change the image to the profile pic
              backgroundImage: AssetImage(profilePic),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          //TODO: Fetch the username from backend
          Text(
            'Welcome, $username',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
