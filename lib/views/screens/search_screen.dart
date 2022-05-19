import 'package:cloneapp/models/user.dart';
import 'package:cloneapp/views/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import '../../controllers/search_controller.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            decoration: const InputDecoration(
                filled: false,
                hintText: 'search',
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                )),
            onFieldSubmitted: (values) => searchController.searchUser(values),
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text('Search for user!',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                     child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.profilePhoto),
                      ),
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
