// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:crm_app/httpServices/endpoints.dart';
// import 'package:crm_app/screens/layout/crm_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class DataSearch extends SearchDelegate<Future<Widget>> {
//
//   //     var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/addUnit"), body: body);
//
// // var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/addUnit"), body: body);
// //     var data = json.decode(response.body);
//   Future serachdb(searchData) async {
//     // var response  = await http.post(Uri.parse(EndPoints.BASE_URL+"/addUnit"), body: body);
//     var data = json.decode(response.body);
//     if (data.body != '') {
//       var data = json.decode(response.body);
//     }
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     serachdb(query);  // it doesn't wait untill this completes
//     return resultContent();
//   }
//
//   Widget resultContent(){
//     return new Scaffold(
//       /*
//       some code
//       */
//     );
//   }
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     throw UnimplementedError();
//   }
// }