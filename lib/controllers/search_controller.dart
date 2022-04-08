import 'package:cloneapp/constants.dart';
import 'package:cloneapp/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchUsers = Rx<List<User>>([]);

  List<User> get searchedUsers => _searchUsers.value;

  searchUser(String typeUser) async {
    _searchUsers.bindStream(firestore
        .collection('users')
        .where('name', isGreaterThanOrEqualTo: typeUser)
        .snapshots()
        .map((QuerySnapshot query) {
          List<User>  retVal = [];
          for(var elem in query.docs){
            retVal.add(User.fromSnap(elem));

          }
        return retVal;

        }));
  }
}
