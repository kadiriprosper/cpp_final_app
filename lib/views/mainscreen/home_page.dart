import 'package:carousel_slider/carousel_slider.dart';
import 'package:cpp_final_app/colors/colors.dart';
import 'package:cpp_final_app/controllers/tab_controller.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:cpp_final_app/views/coming_soon_page.dart';
import 'package:cpp_final_app/views/course_page.dart';
import 'package:cpp_final_app/views/qapage.dart';
import 'package:cpp_final_app/views/settingscreens/certificates_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LandingPageController landingPageController =
      Get.put(LandingPageController());
  int currentIndex = 0;
  int carouselIndex = 0;
  FocusNode focusNode = FocusNode();
  CarouselController controller = CarouselController();
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    focusNode.unfocus();
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
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
                focusNode: focusNode,
                controller: textController,
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
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: HelperFunctions.sliderImages.length,
              options: CarouselOptions(
                height: 160,
                enlargeFactor: .2,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    carouselIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SliderWidget(
                    onPressed: () {},
                    buttonTitle:
                        'Get Started', //TODO: Connect to a list of button name
                    label:
                        'What do yo want to learn', //TODO: Connect to a list of slider titles
                    sliderColor: [
                      CustomColor.caroselColor1,
                      CustomColor.caroselColor2,
                      CustomColor.caroselColor3,
                    ][index],
                    photoPath: HelperFunctions.sliderImages[index],
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                HelperFunctions.sliderImages.length,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      controller.animateToPage(index);
                    });
                  },
                  child: Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: index == carouselIndex
                          ? CustomColor.buttonColor1
                          : const Color.fromARGB(255, 223, 223, 223),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CategoryWidget(
                      label: 'Practical',
                      onPressed: () {
                        focusNode.unfocus();
                        landingPageController.changeTabIndex(1);
                        //TODO: Change this to the project github link
                      },
                      photoPath: HelperFunctions.categoryImages[0],
                      isFirst: true,
                      isLast: false,
                      color: CustomColor.tileColor1,
                    ),
                    CategoryWidget(
                      label: 'Code',
                      onPressed: () {
                        //TODO: Find out what to put in here
                        focusNode.unfocus();
                      },
                      photoPath: HelperFunctions.categoryImages[1],
                      isFirst: true,
                      isLast: false,
                      color: CustomColor.tileColor2,
                    ),
                    CategoryWidget(
                      label: 'Certificate',
                      onPressed: () {
                        focusNode.unfocus();
                        Get.to(() => const CertificatePage());
                      },
                      photoPath: HelperFunctions.categoryImages[2],
                      isFirst: true,
                      isLast: false,
                      color: CustomColor.tileColor3,
                    ),
                    CategoryWidget(
                      label: 'Q/A',
                      onPressed: () {
                        focusNode.unfocus();
                        Get.to(() => const QaPage());
                      },
                      photoPath: HelperFunctions.categoryImages[3],
                      isFirst: true,
                      isLast: false,
                      color: CustomColor.caroselColor1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CategoryHeader(
                    buttonLabel: 'See All',
                    label: 'Courses',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 6 / 7,
                          crossAxisSpacing: 4,
                          crossAxisCount:
                              (MediaQuery.of(context).size.width / 150).floor(),
                        ),
                        children: [
                          TrendingCategoryWidgetFinal(
                            imagePath: HelperFunctions.trendingImages.first,
                            label: 'C++ Programming',
                            onBookMark: () {},
                            onPressed: () {
                              focusNode.unfocus();
                              Get.to(() => const CoursePage());
                            },
                          ),
                          TrendingCategoryWidgetFinal(
                            imagePath: HelperFunctions.trendingImages[1],
                            label: 'C Programming',
                            onBookMark: () {},
                            onPressed: () {
                              Get.to(() => const ComingSoonPage());
                            },
                          ),
                        ]),
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

class TrendingCategoryWidgetFinal extends StatelessWidget {
  const TrendingCategoryWidgetFinal({
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
        // margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black12, width: 1),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5).copyWith(
                bottom: 0,
              ),
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          // MaterialButton(
          //   onPressed: onPressed,
          //   textColor: CustomColor.buttonColor1,
          //   padding: EdgeInsets.zero,
          //   child: Text(
          //     buttonLabel,
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 14,
          //     ),
          //   ),
          // )
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
                  child: Text(
                    buttonTitle,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
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
            radius: 30,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
              radius: 29,
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
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
