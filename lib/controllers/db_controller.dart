import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cpp_final_app/enums/status_enum.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

const source = Source.serverAndCache;

class DataController extends GetxController {
  FirebaseFirestore dbInstance = FirebaseFirestore.instance;
  Map<String, dynamic> elements = {};

  getDataElements(String dbPath) async {
    await dbInstance
        .collection('app_data')
        .doc(dbPath)
        .get(
          const GetOptions(source: source),
        )
        .then(
      (DocumentSnapshot doc) {
        elements = doc.data() as Map<String, dynamic>;
      },
      onError: (e) {
        //TODO: Put the handlers for errors here
      },
    );
  }

  getData(String dataKey) => elements[dataKey];

  Future<Map<AuthStatusEnum, String>> storeUserData(
      String userName, Map<String, dynamic> userData) async {
    Map<AuthStatusEnum, String> response = {AuthStatusEnum.success: 'success'};
    await dbInstance
        .collection('user_data')
        .doc(userName)
        .set(userData)
        .onError(
      (error, _) {
        response = {AuthStatusEnum.failed: error.toString()};
      },
    );
    return response;
  }
}
