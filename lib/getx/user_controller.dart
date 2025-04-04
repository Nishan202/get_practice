import 'package:get/get.dart';
import 'package:getx_practice/api_helper.dart';
import 'package:getx_practice/app_exceptions.dart';
import '../model/user_list_response.dart';
import '../urls.dart';

class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var isUserCreated = false.obs;
  ApiHelper apiHelper;
  UserController({required this.apiHelper});

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading(true);
      final response = await apiHelper.getApi(url: Urls.userList2Url);

      if (response != null) {
        var responseData = UserListResponse.fromJson(response);
        users.assignAll(responseData.users);
      } else {
        errorMessage('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage('Error occurred: ${(e as AppExceptions).toErrorMessage()}');
    } finally {
      isLoading(false);
    }
  }

  Future<void> createUser({required String name, required String job}) async {
    try {
      if (name.isEmpty || job.isEmpty) {
        errorMessage('Please fill all fields');
        return;
      }

      isLoading(true);
      isUserCreated(false);
      final response = await apiHelper.postApi(url: Urls.userPostLinkUrl, bodyParams: {
        // "name" : name,
        // "mobile_number": phoneNo,
        // "email": email,
        // "password": password
        "name" : name,
        "job" : job
      });
      if(response.statusCode == 201){
        isUserCreated(true);
      } else{
        errorMessage('Failed to create user: ${response.statusCode}');
      }
    } catch (e){
      errorMessage('Error occurred: $e');
    } finally {
      isLoading(false);
    }
  }

}