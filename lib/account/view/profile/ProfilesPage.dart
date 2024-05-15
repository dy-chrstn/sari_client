import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sari/utils/theme/colors.dart';

import '../../../utils/theme/typography.dart';

class ProfilesPage extends StatefulWidget {
  final String userId;
  const ProfilesPage({super.key, required this.userId});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  List<Object> data = ['1', '2', '3'];

  void displayProfiles () {
    Logger().d('User Id: ${widget.userId}');
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
                padding: const EdgeInsets.all(24.0),
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
                            color: AppColors.textColor),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    const Text('Choose your profile',
                        style: AppTypography.bodyText),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemCount: data.length + 1, 
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          if (index == data.length) {
                            return ListTile(
                              title: const Text('Create Profile'),
                              leading: const Icon(Icons.add),
                              onTap: () {
                                // GoRouter.of(context).push('/profile/create/name');
                                displayProfiles();
                              },
                              tileColor: AppColors.dirtyWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                            );
                          } else {
                            return ListTile(
                              title: Text('Profile ${index + 1}'),
                              onTap: () {
                              },
                              leading: const Icon(Icons.person),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                   PopupMenuItem(
                                    onTap: () {},
                                    child: Text('Edit'),
                                  ),
                                   PopupMenuItem(
                                    onTap: () {},
                                    child: Text('Delete'),
                                  ),
                                ],
                              ),
                              tileColor: AppColors.dirtyWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                            );
                          }
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 8.0,
                          );
                        },
                      ),
                    ),
                  ],
                ))));
  }
}
