import 'dart:convert';
import 'package:crm_app/componnent/component.dart';
import 'package:crm_app/httpServices/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientsSearch extends SearchDelegate {
  ClientsSearch()
      : super(
            searchFieldLabel: 'البحث ',
            searchFieldStyle: TextStyle(
                color: Colors.grey, fontSize: 18, fontFamily: 'Cairo'));

  Future serachdb(String name) async {
    try {
      var response = await http.get(Uri.parse(EndPoints.BASE_URL +
          "/Units?project_id=None&city_id&governorate_id=$name&from_price&to_price&from_space&to_space"));
      var data = json.decode(response.body);
      return data['data'];
    } catch (error) {
      print("user data errror --------------- ${error.toString()}");
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: serachdb(query.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data['data'].toString()),
                      onTap: () {},
                    );
                  },
                );
              } else {
                return Container(
                    child: Center(
                        child: Text("لا يوجد بيانات للبحث",
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor("#AB0D03"),
                                fontWeight: FontWeight.w600))));
              }
            },
          );

    // FutureBuilder(
    //         future: getSearchData(keyword: query.toString()),
    //         builder: (context, AsyncSnapshot snapshot) {
    //           if (snapshot.hasData) {
    //             return ListView.builder(
    //               itemCount: snapshot.data["Books"].length,
    //               itemBuilder: (context, i) {
    //                 return ListTile(
    //                   title: Text("units"),
    //                   onTap: () {},
    //                 );
    //               },
    //             );
    //           } else {
    //             return Container(
    //               child: Center(
    //                 child: Text(
    //                   "لا يوجد بيانات للبحث",
    //                   style: TextStyle(
    //                       fontSize: 16,
    //                       color: HexColor("#AB0D03"),
    //                       fontWeight: FontWeight.w600),
    //                 ),
    //               ),
    //             );
    //           }
    //         });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? Container()
        : FutureBuilder(
            future: serachdb(query.toString()),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(
                        snapshot.data[i]['name'].toString(),
                      ),
                      onTap: () {},
                    );
                  },
                );
              } else {
                return Container(
                    child: Center(
                        child: Text("لا يوجد بيانات للبحث",
                            style: TextStyle(
                                fontSize: 16,
                                color: HexColor("#AB0D03"),
                                fontWeight: FontWeight.w600))));
              }
            },
          );
    // FutureBuilder(
    //         future: getSearchData(keyword: query.toString()),
    //         builder: (context, AsyncSnapshot snapshot) {
    //           if (snapshot.hasData) {
    //             return ListView.builder(
    //               itemCount: snapshot.data["Books"].length,
    //               itemBuilder: (context, i) {
    //                 return ListTile(
    //                   title: Text("${snapshot.data["Books"][i]["title"]}"),
    //                   onTap: () {
    //                     Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                             builder: (context) => BookDetail(
    //                                   bookSize:
    //                                       "${snapshot.data["Books"][i]["size"]}",
    //                                   bookID:
    //                                       "${snapshot.data["Books"][i]["id"]}",
    //                                   shareLink:
    //                                       "${snapshot.data["Books"][i]["sharingLink"]}",
    //                                   image:
    //                                       "${snapshot.data["Books"][i]["writer"]["photo"]}",
    //                                   writerId:
    //                                       "${snapshot.data["Books"][i]["writer"]["id"]}",
    //                                   bookTitle:
    //                                       "${snapshot.data["Books"][i]["title"]}",
    //                                   bbokimage:
    //                                       "${snapshot.data["Books"][i]["thumbnail"]}",
    //                                   linkPdf:
    //                                       "${snapshot.data["Books"][i]["BookPDF"]}",
    //                                   desc:
    //                                       "${snapshot.data["Books"][i]["details"]}",
    //                                   writerName:
    //                                       "${snapshot.data["Books"][i]["writer"]["name"]}",
    //                                 )));
    //                   },
    //                 );
    //               },
    //             );
    //           } else {
    //             return Container(
    //               child: Center(
    //                 child: Text(
    //                   "لا يوجد بيانات للبحث",
    //                   style: TextStyle(
    //                       fontSize: 16,
    //                       color: HexColor("#AB0D03"),
    //                       fontWeight: FontWeight.w600),
    //                 ),
    //               ),
    //             );
    //           }
    //         });
  }
}
