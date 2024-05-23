import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:sari/account/services/personalAcc.dart';
import 'package:sari/utils/theme/colors.dart';

import '../../../utils/theme/typography.dart';
import '../../model/personalAcc.dart';

class ProfilesPage extends StatefulWidget {
  final String userId;
  const ProfilesPage({super.key, required this.userId});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  List<PersonalAccModel> profileList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    displayProfiles();
  }

  void displayProfiles() async {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(milliseconds: 1500));

    List<PersonalAccModel> response = await getPersonalAccList(widget.userId);

    setState(() {
      profileList = response;
      isLoading = false;
      // Logger().d('Profile List: $profileList');
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Center(
                  child: Text(
                    'Sari',
                    style: TextStyle(
                      fontSize: screenSize.height * 0.06,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                const Text(
                  'Choose your profile',
                  style: AppTypography.bodyText,
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                isLoading
                    ? Center(
                        child: LoadingAnimationWidget.hexagonDots(
                        color: AppColors.primaryColor,
                        size: 64,
                      ))
                    : ListView.separated(
                        itemCount: profileList.length + 1,
                        scrollDirection: Axis.vertical,
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                        shrinkWrap:
                            true, // Make ListView take only as much space as needed
                        itemBuilder: (context, index) {
                          if (index == profileList.length) {
                            return ListTile(
                              title: const Text('Create Profile'),
                              leading: const Icon(Icons.add),
                              onTap: () {
                                GoRouter.of(context).go('/profile/create');
                                displayProfiles();
                              },
                              tileColor: AppColors.dirtyWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                            );
                          } else {
                            return ListTile(
                              title: Text(profileList[index].name ??
                                  'Profile ${index + 1}'),
                              onTap: () {
                                GoRouter.of(context)
                                    .push('/profile/login/enterPin', extra: {
                                  'userId': widget.userId,
                                  'name': profileList[index].name,
                                  'pin': profileList[index].pin
                                });
                              },
                              leading: const Icon(Icons.person),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {},
                                    child: const Text('Edit'),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {},
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                              tileColor: AppColors.dirtyWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                            );
                          }
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8.0,
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
