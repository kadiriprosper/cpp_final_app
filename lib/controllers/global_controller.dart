import 'package:cpp_final_app/data/data_pool.dart';
import 'package:cpp_final_app/helpers/helper_functions.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  Map<String, Map<String, Map<String, String>>> programList = {};
  Map<int, Map<String, Object>> tutorialList = {};
  Map<String, dynamic> allProgramList = {};
  Map<String, dynamic> allTutorialList = {};
  String selectedProgrammingLanguage = 'cpp';

  ///This function returns the project data
  ///corresponding to the [programset] supplied as a parameter.
  ///[programset] can either be 'C' or 'Cpp'
  Map<String, String> getProjectData(String programSet) {
    if (programSet == 'c' || programSet == 'C') {
      return DataPool.cProjectLinks;
    }
    return DataPool.cppProjectLinks;
  }

  get userCertificate {
    return HelperFunctions.certificatePic;
  }

  Map<int, Map<String, Object>> get helpCenterData {
    return DataPool.fAQPool;
  }

  Map<int, Map<String, Object>> get privacyPolicyData {
    return DataPool.policyPool;
  }

  Map<int, Map<String, String>> getQaQuestions() {
    String questionSet = selectedProgrammingLanguage;
    if (questionSet == 'c' || questionSet == 'C') {
      return DataPool.cQA;
    }
    return DataPool.cppQA;
  }

  Map<String, Map<String, Map<String, String>>> getProgramList(
      String programSet) {
    if (programSet == 'c' || programSet == 'C') {
      // programList = DataPool.cProgram;
      //getAllProgramData();
      // return
    }
    programList = DataPool.cppProgram;
    getAllProgramData();
    return DataPool.cppProgram;
  }

  Map<int, Map<String, Object>> getTutorialList(bool isC) {
    if (isC) {
      tutorialList = DataPool.cTutorial;
      getAllTutorialData();
      return DataPool.cTutorial;
    }
    tutorialList = DataPool.cppTutorial;
    getAllTutorialData();
    return DataPool.cppTutorial;
  }

  getAllProgramData() {
    for (int i = 0; i < programList.length; i++) {
      allProgramList.update(
        programList.entries.elementAt(i).key,
        (value) => programList.entries.elementAt(i).value,
        ifAbsent: () => programList.entries.elementAt(i).value,
      );
    }
  }

  getAllTutorialData() {
    for (int i = 0; i < tutorialList.length; i++) {
      if (tutorialList[i]?['type'] as String == 'branch') {
        final tutorialContent =
            tutorialList[i]!['content']! as Map<String, String>;
        for (int j = 0; j < tutorialContent.length; j++) {
          allTutorialList.update(
            tutorialContent.entries.elementAt(j).key,
            (value) => tutorialContent.entries.elementAt(j).value,
            ifAbsent: () => tutorialContent.entries.elementAt(j).value,
          );
        }
      } else {
        allTutorialList.update(
          tutorialList[i]?['title'] as String,
          (value) => tutorialList[i]?['content'],
          ifAbsent: () => tutorialList[i]?['content'],
        );
      }
    }
  }
}
