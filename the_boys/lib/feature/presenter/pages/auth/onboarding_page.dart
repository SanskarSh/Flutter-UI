import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_boys/constants/widgets/group_form.dart';
import 'package:the_boys/feature/presenter/bloc/connectivity/bloc/internet_bloc.dart';
import 'package:the_boys/feature/presenter/bloc/navigate_to/cubit/navigate_cubit.dart';
import 'package:the_boys/feature/presenter/pages/home/entry_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    PageController pageCon = PageController();
    return SafeArea(
      child: PageView(
        controller: pageCon,
        scrollDirection: Axis.vertical,
        children: [
          Scaffold(
            body: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if (state is InternetGainedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Internet connected!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Internet not connected!'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is InternetGainedState) {
                  return BlocBuilder<NavigateCubit, NavigateState>(
                    builder: (context, state) {
                      return buildAuthForm(screenSize, context);
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            floatingActionButton: IconButton(
              onPressed: () {
                pageCon.animateToPage(1,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 250));
              },
              icon: const Icon(
                Icons.keyboard_arrow_up_rounded,
                color: Colors.white38,
              ),
            ),
            bottomSheet: Container(
              color: const Color.fromRGBO(49, 49, 49, 1),
              padding: const EdgeInsets.only(bottom: 5),
              child: const Text(
                'Select Group',
                style: TextStyle(color: Colors.white30),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
          const Scaffold(
            body: Placeholder(
                //ToDo - GridView To Show History Of Groups
                ),
          )
        ],
      ),
    );
  }

  Center buildAuthForm(Size screenSize, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * .15,
          vertical: screenSize.height * .17,
        ),
        child: Card(
          elevation: 5,
          color: Colors.white30,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(50.0),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  bottom: const TabBar(
                    unselectedLabelColor: Colors.white38,
                    labelColor: Color.fromRGBO(49, 49, 49, 1),
                    dividerColor: Colors.transparent,
                    indicatorColor: Color.fromRGBO(49, 49, 49, 1),
                    tabs: [
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
                          NavigateCubit().navigateButtonClicked(
                            context,
                            const EntryScreen(),
                          );
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
                          NavigateCubit().navigateButtonClicked(
                            context,
                            const EntryScreen(),
                          );
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
}
