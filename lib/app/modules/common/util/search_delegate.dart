import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:leacc_pos/app/modules/customer/providers/customer_provider.dart';

import '../../http/dio.dart';

class FrappeSearchDelegate extends SearchDelegate{
  String docType;
  String? referenceDoctype;

  FrappeSearchDelegate({required this.docType,this.referenceDoctype}){

  }


  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Map<String,dynamic>>>(
      future: _search(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data?[index]['value']),
                subtitle: Text(snapshot.data?[index]['description']),
                onTap: () {
                  close(context, snapshot.data?[index]);
                },
              );
            },
            itemCount: snapshot.data?.length,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  Future<List<Map<String,dynamic>>> _search() async{
    var queryParameters = {
      "txt":query,
      "doctype":docType,
      "referenceDoctype":referenceDoctype??''
    };
    await CustomerProvider().getCustomerList(0, 10);
    Response? searchResult = await DioClient().get('/method/frappe.desk.search.search_link', queryParameters: queryParameters);
    return List.from(searchResult?.data['results']);
  }

}