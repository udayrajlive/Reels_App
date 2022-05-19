import 'package:cloneapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../controllers/ProfileController.dart';

class ProfileScreen extends StatefulWidget {
  final String uid;

  const ProfileScreen({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          if (controller.user.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.black12,
                  leading: const Icon(
                    Icons.person_add_alt_1_outlined,
                  ),
                  title: Center(
                      child: Text(controller.user['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                  actions: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.more_horiz),
                    ),
                  ]),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: controller.user['profilePhoto'],
                                  height: 100,
                                  width: 100,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                    Icons.error,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(children: [
                                  Text(controller.user['following'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'WorkSans')),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Following',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 18,
                                      ))
                                ]),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(children: [
                                  Text(controller.user['followers'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'WorkSans')),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Followers',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 18,
                                      ))
                                ]),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(children: [
                                  Text(controller.user['likes'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'WorkSans')),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text('Likes',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        fontSize: 18,
                                      )),
                                ])
                              ])
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              if (widget.uid == authController.user.uid) {
                                authController.signOut();
                              } else {
                                controller.followUser();
                              }
                            },
                            child: Text(
                              widget.uid == authController.user.uid
                                  ? 'Sign Out'
                                  : controller.user['isfollowing']
                                      ? 'Unfollow'
                                      : 'follow',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'WorkSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        width: 140,
                        height: 35,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.grey,
                        ),
                      ),
                      //videoLIst

                      SizedBox(
                        height: 20,
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.user['thumbnails'].length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 5),
                          itemBuilder: (context, index) {
                            String thumbnail =
                                controller.user['thumbnails'][index];
                            return CachedNetworkImage(
                              imageUrl: thumbnail,
                              fit: BoxFit.cover,
                            );
                          })
                    ],
                  ),
                ),
              ));
        });
  }
}
