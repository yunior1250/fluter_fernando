import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAfOk4xprfcwqzO4mspNn1DyAJ_2j08Y_M';

  final storage = new FlutterSecureStorage();
//si retornamos algo es un erroe si no NO
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken':true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);

    if (decodeResp.containsKey('idToken')) {
      //token hay qu eguardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodeResp['idToken']);

      // return decodeResp['idToken'];
      return null;
    } else {
      return decodeResp['error']['message'];
    }

    //print(decodeRes);
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken':true
    };

    final url = Uri.https(
        _baseUrl, 'v1/accounts:signInWithPassword', {'key': _firebaseToken});
    final resp = await http.post(url, body: json.encode(authData));

    final Map<String, dynamic> decodeResp = json.decode(resp.body);
    // print(decodeResp);
    //return 'error en el login';

    if (decodeResp.containsKey('idToken')) {
      //token hay qu eguardarlo en un lugar seguro

      // return decodeResp['idToken'];
      await storage.write(key: 'token', value: decodeResp['idToken']);
      //return null;
    } else {
      return decodeResp['error']['message'];
    }

    //print(decodeRes);
  }

  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? ' ';
  }
}
