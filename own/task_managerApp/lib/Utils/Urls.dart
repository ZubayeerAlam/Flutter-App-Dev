class Urls {
  static String baseURL = 'https://task-manager-api.ostad.live/api/v1';
  static String SignUpURL = '$baseURL/Registration';
  static String SignInURL = '$baseURL/Login';
  static String CreateTaskURL = '$baseURL/createTask';
  static String getTaskCountURL = '$baseURL/taskStatusCount';
  static String deleteTaskURL(String id) => '$baseURL/deleteTask/$id';
  static String getTaskURL(String status) => '$baseURL/listTaskByStatus/$status';

}