import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:the_boys/config/routes/app_routes_const.dart';
import 'package:the_boys/core/widgets/group_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isOnLoginPage = true;
  final PageController pageCon = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: buildPreviousGroupBtn(context),
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageCon,
          scrollDirection: Axis.vertical,
          children: [
            buildAuthForm(context),
            SingleChildScrollView(
              child: Center(
                child: Wrap(
                  children: List.generate(
                    100,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text('Group $index'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton buildPreviousGroupBtn(BuildContext context) {
    return FloatingActionButton.small(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(.5),
      onPressed: () {
        pageCon
            .animateToPage(
              isOnLoginPage ? 1 : 0,
              curve: Curves.easeIn,
              duration: Durations.medium1,
            )
            .then((value) => {
                  setState(() {
                    isOnLoginPage = !isOnLoginPage;
                  })
                });
      },
      child: AnimatedContainer(
        duration: Durations.short1,
        curve: Curves.easeInOut,
        child: Icon(
          isOnLoginPage
              ? Icons.keyboard_arrow_up_rounded
              : Icons.keyboard_arrow_down_rounded,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}

Center buildAuthForm(BuildContext context) {
  final Size screenSize = MediaQuery.of(context).size;
  return Center(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width * .15,
        vertical: screenSize.height * .17,
      ),
      child: Card(
        elevation: 5,
        color: Theme.of(context).colorScheme.background,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50.0),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                bottom: TabBar(
                  unselectedLabelColor: Colors.white38,
                  labelColor: Theme.of(context).colorScheme.primary,
                  dividerColor: Colors.transparent,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  tabs: const [
                    Tab(text: 'Join Group'),
                    Tab(text: 'Create Group'),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                GroupForm(
                  tapOperation: () {
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        context.goNamed(RouteNames.home);
                      },
                    );
                  },
                  hintTextF1: 'Group Id',
                  hintTextF2: 'Your Name',
                  btnText: 'J O I N',
                ),
                GroupForm(
                  tapOperation: () {
                    Future.delayed(
                      const Duration(milliseconds: 500),
                      () {
                        context.goNamed(RouteNames.home);
                      },
                    );
                  },
                  hintTextF1: 'Your Name',
                  hintTextF2: 'Group Name',
                  btnText: 'C R E A T E',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
