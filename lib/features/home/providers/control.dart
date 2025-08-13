// features/home/providers/control.dart
import 'package:flutter/widgets.dart';
import 'package:world_tech_website/features/home/providers/api.dart';

class Control extends ChangeNotifier {
  Api api = Api();
  String baseurl = "http://77.37.51.239/WorldTech/public";
  var check = null;
  
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

    var getbanner;
    
  Future GetBanner() async {
    check = null;
    setLoading(true);
    try {
      getbanner = await api.getapi('$baseurl/api/banners');
      print('getbanner is $getbanner');
      if (getbanner != null && getbanner['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }
  var employees;

  Future Employees() async {
    check = null;
    setLoading(true);
    try {
      employees = await api.getapi(
        "$baseurl/api/employees",

      );
      print('employees is $employees');
      if (employees != null && employees['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  var projects;

  Future Projects() async {
    check = null;
    setLoading(true);
    try {
      projects = await api.getapi(
        "$baseurl/api/projects",
      );
      print('projects is $projects');
      if (projects != null && projects['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }


}