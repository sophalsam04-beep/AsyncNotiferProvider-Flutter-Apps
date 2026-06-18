import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:self_learn8/model/user_model.dart';
import 'package:http/http.dart' as http;


class ApiService{
      
      // Future call from Model
      Future<List<UserModel>> fetchUser()async{
          final respone = await http.get(
            Uri.parse("https://jsonplaceholder.typicode.com/users")

          );

          // status code checked
          if(respone.statusCode == 200){

              // Json decoded
              final List data = jsonDecode(respone.body);

              // get data to json decoded
              return data.map((e)=> UserModel.fromJson(e)).toList();


          }

          throw Exception("Failure load the error...!");
      }
}