import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.surface.withOpacity(0.8),
                Theme.of(context).colorScheme.surface.withOpacity(0.5),
                Theme.of(context).colorScheme.surface.withOpacity(0.3),
                Theme.of(context).colorScheme.surface.withOpacity(0.2),
                Theme.of(context).colorScheme.surface.withOpacity(0.1),
                Theme.of(context).colorScheme.surface.withOpacity(0.05),
                Theme.of(context).colorScheme.surface.withOpacity(0.025),
                Theme.of(context).colorScheme.surface.withOpacity(0.0125),
              ],
            ),
          ),
        ),
        Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.4),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.onPrimary.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Ionicons.menu_outline,
                    color:
                        Theme.of(context).colorScheme.onPrimary.withOpacity(.5),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.search_outline,
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(.5),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Search",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary
                                .withOpacity(.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Trending right now",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildTrendingCard(
                        context,
                        "https://www.musewiki.org/images/thumb/TDarksideArt.jpg/600px-TDarksideArt.jpg",
                        "The Dark Side",
                        "Pink Floyd",
                      ),
                      buildTrendingCard(
                        context,
                        "https://i.pinimg.com/1200x/1e/73/96/1e7396df87da442dbc4ab783c01c6022.jpg",
                        "I'm Good (Blue)",
                        "David Guetta & Bebe Rexha",
                      ),
                      buildTrendingCard(
                        context,
                        "https://i.pinimg.com/736x/b6/95/3d/b6953d773e4749f086d17517a169f237.jpg",
                        "Under The Influence",
                        "Chris Brown",
                      ),
                      buildTrendingCard(
                        context,
                        "https://i.ytimg.com/vi/KchY6ctHZvY/mqdefault.jpg",
                        "Forget Me",
                        "Lewis Capaldi",
                      ),
                      buildTrendingCard(
                        context,
                        "https://www.musewiki.org/images/thumb/TDarksideArt.jpg/600px-TDarksideArt.jpg",
                        "The Dark Side",
                        "Pink Floyd",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Chip(
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        label: Text(
                          "Treanding",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        backgroundColor: Colors.black,
                        label: Text(
                          "Rock",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        backgroundColor: Colors.black,
                        label: Text(
                          "Hip Hop",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        backgroundColor: Colors.black,
                        label: Text(
                          "Rock",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        backgroundColor: Colors.black,
                        label: Text(
                          "Electron",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        backgroundColor: Colors.black,
                        label: Text(
                          "Rock",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildListTile(
                          context,
                          "https://i.pinimg.com/1200x/1e/73/96/1e7396df87da442dbc4ab783c01c6022.jpg",
                          "I'm Good (Blue)",
                          "David Guetta & Bebe Rexha",
                        ),
                        buildListTile(
                          context,
                          "https://i.pinimg.com/736x/b6/95/3d/b6953d773e4749f086d17517a169f237.jpg",
                          "Under The Influence",
                          "Chris Brown",
                        ),
                        buildListTile(
                          context,
                          "https://i.ytimg.com/vi/KchY6ctHZvY/mqdefault.jpg",
                          "Forget Me",
                          "Lewis Capaldi",
                        ),
                        buildListTile(
                          context,
                          "https://www.musewiki.org/images/thumb/TDarksideArt.jpg/600px-TDarksideArt.jpg",
                          "The Dark Side",
                          "Pink Floyd",
                        ),
                        buildListTile(
                          context,
                          "https://www.musewiki.org/images/thumb/TDarksideArt.jpg/600px-TDarksideArt.jpg",
                          "The Dark Side",
                          "Pink Floyd",
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildListTile(
    BuildContext context,
    String image,
    String title,
    String author,
  ) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Ionicons.person,
                    color:
                        Theme.of(context).colorScheme.onPrimary.withOpacity(.5),
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    author,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ],
          )),
          Icon(
            Ionicons.heart_outline,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 32,
          ),
        ],
      ),
    );
  }

  Container buildTrendingCard(
    BuildContext context,
    String image,
    String title,
    String author,
  ) {
    return Container(
      width: 270,
      height: 250,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(
            Ionicons.ellipsis_horizontal,
            color: Theme.of(context).colorScheme.primary,
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface.withOpacity(.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 160,
                        child: Text(
                          "♫ Music - $author",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              overflow: TextOverflow.ellipsis),
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Ionicons.play_circle,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 64,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
