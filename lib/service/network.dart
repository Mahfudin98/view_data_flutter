import 'package:flutter/cupertino.dart';

class Network {
  final String imageURL = "https://app-r.lsskincare.id/storage/teams/";
  // auth
  var login = Uri.parse('https://app-r.lsskincare.id/api/login');
  var logout = Uri.parse('https://app-r.lsskincare.id/api/logout');
  var userAuth =
      Uri.parse('https://app-r.lsskincare.id/api/user-authenticated');

  // dashboard
  var omset = Uri.parse('https://app-r.lsskincare.id/api/omset');
  var chart = Uri.parse('https://app-r.lsskincare.id/api/chart');
  var persentaseCS = Uri.parse('https://app-r.lsskincare.id/api/persentase-cs');

  // report
  var indexReport = Uri.parse('https://app-r.lsskincare.id/api/cs-reports');

  // teams
  var indexTeams = Uri.parse('https://app-r.lsskincare.id/api/teams');

  // products
  var indexProducts = Uri.parse('https://app-r.lsskincare.id/api/all-product');
}
