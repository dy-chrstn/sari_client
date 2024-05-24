import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:sari/account/model/personalAcc.dart';
import 'package:sari/account/services/personalAcc.dart';
import 'package:sari/common/utils/theme/colors.dart';
import '../../../common/token/services/token.dart';
import '../../../common/utils/env.dart';
import '../../../common/utils/theme/typography.dart';
import 'package:http/http.dart' as http;


class ProfilesPage extends StatefulWidget {
  final String userId;
  const ProfilesPage({super.key, required this.userId});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  List<PersonalAccModel> profileList = [];
  List<String> profileNames = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    displayProfiles();
  }

  Future<void> displayProfiles() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 1500));

    List<dynamic> response = await getPersonalAccList(widget.userId);
    Logger().i('Profiles Page Response: $response');

    for (var profile in response) {
      profileNames.add(profile.name.toLowerCase().trimRight());
    }

    setState(() {
      profileList = response.cast<PersonalAccModel>();
      isLoading = false;
    });
  }

  Future<dynamic> deleteProfile(String id) async {
    String token = await getToken();
    Logger().d('token: $token');

    try {
      final url = Uri.parse('$baseUrl/profile/delete/$id');
      final response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      final data = jsonDecode(response.body);
      Logger().d('Delete Response: $data');

      if (data['messages']['code'] == 0) {
        return data;
      } else {
        return data;
      }
    } catch (e) {
      Logger().e(e);
      throw e.toString();
    }
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
                        ),
                      )
                    : ListView.separated(
                        itemCount: profileList.length + 1,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (index == profileList.length) {
                            return ListTile(
                              title: const Text('Create Profile'),
                              leading: const Icon(Icons.add),
                              onTap: () {
                                GoRouter.of(context).push(
                                  '/profile/create/name',
                                  extra: {
                                    'userId': widget.userId,
                                    'names': profileNames
                                  },
                                );
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
                              title: Text(profileList[index].name),
                              onTap: () {
                                GoRouter.of(context).push(
                                  '/profile/login/enterPin',
                                  extra: {
                                    'userId': widget.userId,
                                    'name': profileList[index].name,
                                    'pin': profileList[index].pin
                                  },
                                );
                              },
                              leading: const Icon(Icons.person),
                              trailing: PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      // Add edit functionality here
                                    },
                                    child: const Text('Edit'),
                                  ),
                                  PopupMenuItem(
                                    onTap: () async {
                                      dynamic response =
                                          await deleteProfile(profileList[index].id);
                                      if (response['messages']['code'] == 0) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                response['messages']['message']),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                        displayProfiles();
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                response['messages']['message']),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        displayProfiles();
                                      }
                                    },
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
