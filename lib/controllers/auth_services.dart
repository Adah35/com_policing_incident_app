// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:convert';

import 'package:com_policing_incident_app/models/add_emergency_contacts_model.dart';
import 'package:com_policing_incident_app/models/report_crime_model.dart';
import 'package:com_policing_incident_app/models/user.dart';
import 'package:com_policing_incident_app/providers/user_provider.dart';
import 'package:com_policing_incident_app/screens/login_screen/models/login_model.dart';
import 'package:com_policing_incident_app/screens/onboard_screen/onboard.dart';
import 'package:com_policing_incident_app/screens/register_screen/models/register_model.dart';
import 'package:com_policing_incident_app/utilities/global_variables.dart';
import 'package:com_policing_incident_app/utilities/http_error_handling.dart';
import 'package:com_policing_incident_app/utilities/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Utils utils = Utils();
  http.Response? response;
  Future<void> Register(RegisterModel user, BuildContext context) async {
    try {
      response = await http
          .post(Uri.parse('$baseUrl/register'), body: user.toJson(), headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/json',
      });
      if (response!.statusCode == 200) {
        final responseData = json.decode(response!.body);
        print('Register  successful: $responseData');
      } else {
        print(response!.body);
        print(response!.statusCode);
        print(user.toJson());
        print('Server error: ${response}');
        throw Exception('Server error');
      }
    } catch (e) {
      final errorRespone = json.decode(response!.body)['msg'];
      utils.showErrorDialog(context, 'Error', errorRespone);
    }
  }

  Future<void> Login(LoginModel user, BuildContext context) async {
    try {
      response = await http
          .post(Uri.parse('$baseUrl/login'), body: user.toJson(), headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/json',
      });
      if (response!.statusCode == 200) {
        final responseData = json.decode(response!.body);
        print(' Login successful: $responseData');
      } else {
        print(response!.body);
        print(response!.statusCode);
        print(user.toJson());
        print('Server error: ${response}');
        throw Exception('Server error');
      }
    } catch (e) {
      final errorRespone = json.decode(response!.body)['msg'];
      utils.showErrorDialog(context, 'Error', errorRespone);
    }
  }

  //Report Crime Route

  Future<void> ReportCrime(
      ReportCrimeModel report, BuildContext context) async {
    try {
      response = await http.post(Uri.parse('$baseUrl/report-crime'),
          body: report.toJson(),
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $response'
          });
      if (response!.statusCode == 200) {
        final responseData = json.decode(response!.body);
        print(' Login successful: $responseData');
        //After Succesfull Request
        //Navigate to HomeWebView
        Navigator.pushNamed(context, routes.report_success);
      }
    } catch (e) {}
  }

  //Report Incident Route

  Future<void> ReportIncident(
      ReportCrimeModel report, BuildContext context) async {
    try {
      response = await http.post(Uri.parse('$baseUrl/report-incident'),
          body: report.toJson(),
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $response'
          });
      if (response!.statusCode == 200) {
        final responseData = json.decode(response!.body);
        print(' Login successful: $responseData');
        //After Succesfull Request
        //Navigate to HomeWebView
        Navigator.pushNamed(context, routes.report_success);
      }
    } catch (e) {}
  }

  Future<void> AddEmergencyContacts(
      AddEmergencyContactsModel addEmergencyContactsModel,
      BuildContext context) async {
    try {
      response = await http.post(Uri.parse('$baseUrl/report-incident'),
          body: addEmergencyContactsModel.toJson(),
          headers: {
            'Accept': 'application/vnd.api+json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $response'
          });
      if (response!.statusCode == 200) {
        final responseData = json.decode(response!.body);
        print(' Login successful: $responseData');
        //After Succesfull Request
        //Navigate to HomeWebView
        Navigator.pushNamed(context, routes.report_success);
      }
    } catch (e) {}
  }

  Future<void> getEmergencyContacts(BuildContext context) async {
    try {
      response =
          await http.get(Uri.parse('$baseUrl/report-incident'), headers: {
        'Accept': 'application/vnd.api+json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $response'
      });
      if (response!.statusCode == 200) {
        final responseData = json.decode(response!.body);
        print(' Login successful: $responseData');
        //After Succesfull Request
        //Navigate to HomeWebView
        Navigator.pushNamed(context, routes.report_success);
      }
    } catch (e) {}
  }
}
