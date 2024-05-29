import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UserProfileMobile extends StatelessWidget {
  const UserProfileMobile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Map<String, IconData> tabData = {
      'Math': Ionicons.calculator_outline,
      'Science': Ionicons.flask_outline,
      'Social': Ionicons.people_outline,
      'Design': Ionicons.color_palette_outline,
      'Programming': Ionicons.code_slash_outline,
      'Language': Ionicons.language_outline,
      'Music': Ionicons.musical_notes_outline,
      'Art': Ionicons.color_palette_outline,
      'Sport': Ionicons.football_outline,
    };
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Scaffold(
              backgroundColor: Theme.of(context).colorScheme.surface,
              body: buildAppBar(size, context, tabData),
              bottomNavigationBar: buildNavBar(size, context),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: FloatingActionButton.large(
                  elevation: 0.0,
                  onPressed: () {},
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  hoverColor: Colors.transparent,
                  shape: CircleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.surface,
                      width: 14,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * .34,
              bottom: size.height * .2,
            ),
            child: Swiper(
              itemCount: 3,
              viewportFraction: 0.85,
              autoplay: true,
              scale: 1,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  buildBottomSheet(context, size);
                },
                child: buildCarouselTile(context),
              ),
            ),
          )
        ],
      ),
    );
  }

  PersistentBottomSheetController buildBottomSheet(
      BuildContext context, Size size) {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .6,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.all(64),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(.3),
                          Colors.black.withOpacity(.7),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Image.asset(
                      'asset/images/Blonde_lady.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * .57,
                width: size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width * .6,
                        child: FittedBox(
                          child: Text(
                            "Stella Russell",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      buildTags(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "4.3",
                            style: TextStyle(
                              fontSize: 28,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Ionicons.star,
                                size: 24,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Icon(
                                Ionicons.star,
                                size: 24,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Icon(
                                Ionicons.star,
                                size: 24,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Icon(
                                Ionicons.star,
                                size: 24,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Icon(
                                Ionicons.star_half,
                                size: 24,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                          Text(
                            "23 Reviews",
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .tertiary
                                  .withOpacity(.7),
                            ),
                          ),
                          const SizedBox(),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(height: 20),
                      Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.3),
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            buildListTile(context),
                            buildListTile(context),
                            buildListTile(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: IconButton(
                icon: Icon(
                  size: 40,
                  Ionicons.chevron_back_circle_outline,
                  color: Theme.of(context).colorScheme.surface.withOpacity(.8),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Align(
              alignment: const Alignment(.65, -.15),
              child: IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                        width: 3,
                      ),
                      shape: BoxShape.circle),
                  child: Icon(
                    size: 40,
                    Ionicons.heart_outline,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }

  ListTile buildListTile(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.tertiary.withOpacity(.6),
        child: Icon(
          size: 20,
          Ionicons.person_outline,
          color: Theme.of(context).colorScheme.surface,
        ),
      ),
      title: Text(
        "Jane Robertson",
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: const Column(
        children: [
          Row(
            children: [
              Icon(Ionicons.star, color: Colors.amber),
              Icon(Ionicons.star, color: Colors.amber),
              Icon(Ionicons.star, color: Colors.amber),
              Icon(Ionicons.star, color: Colors.amber),
            ],
          ),
          SizedBox(height: 5),
          Text(
            "Eiusmod eiusmod dolor commodo quis dolor enim aute adipisicing",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container buildCarouselTile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(bottom: 100, top: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(.1),
                      Colors.black.withOpacity(.5),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 100),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('asset/images/Blonde_lady.png'),
              fit: BoxFit.fitHeight,
            )),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: SizedBox(
              height: 140,
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: FittedBox(
                              child: Text(
                                "Stella Russell",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Ionicons.heart_outline,
                            size: 30,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                      buildTags(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Text(
                              "4.3",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            size: 22,
                            Ionicons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Icon(
                            size: 22,
                            Ionicons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Icon(
                            size: 22,
                            Ionicons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Icon(
                            size: 22,
                            Ionicons.star,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          Icon(
                            size: 22,
                            Ionicons.star_half,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row buildTags() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300,
          ),
          child: const Text("Math"),
        ),
        Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300,
          ),
          child: const Text("Programming"),
        ),
        Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.shade300,
          ),
          child: const Text("Science"),
        )
      ],
    );
  }

  Container buildAppBar(
      Size size, BuildContext context, Map<String, IconData> tabData) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: size.height * .4,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Locations',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Semarang',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ],
            ),
            const Spacer(),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                ),
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white.withOpacity(.3),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 150,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabData.length,
                itemBuilder: (context, index) => buildTabIcon(
                  context,
                  tabData.keys.elementAt(index),
                  tabData.values.elementAt(index),
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Container buildNavBar(Size size, BuildContext context) {
    return Container(
      height: size.height * .1,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Ionicons.home,
                color: Theme.of(context).colorScheme.surface,
                size: 35,
              ),
              const SizedBox(height: 5),
              Container(
                height: 5,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            ],
          ),
          Icon(
            Ionicons.cog_outline,
            size: 35,
            color: Theme.of(context).colorScheme.surface,
          ),
        ],
      ),
    );
  }

  Column buildTabIcon(BuildContext context, String title, IconData icon) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(8),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.surface,
              width: 3,
            ),
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 217, 208, 106),
                Theme.of(context).colorScheme.secondary,
                Colors.amber.shade800,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
        )
      ],
    );
  }
}
