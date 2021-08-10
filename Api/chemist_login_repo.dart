import 'dart:convert';

import 'package:flutter_ayuvani/models/chemist_models/chemist_login_model.dart';
import 'package:http/http.dart';

class ChemistLoginRepo {
  Future<ChemistLoginModel> loginChemist(
      {String email, String password}) async {
    try {
      final map = {'user_name': email, 'password': password};

      print(jsonEncode(map));
      Response response = await post(
        "API removed",
        headers: {
          'content-type': 'application/json',
        },
        body: jsonEncode(map),
      );

      if (response.statusCode == 200) {
        ChemistLoginModel chemistLoginModel =
            chemistLoginModelFromJson(response.body);
        if (chemistLoginModel.code == 200) {
          return chemistLoginModel;
        }
      }
    } catch (error) {}
  }
}

// class ChemistLoginRepoDio {
//   Future<ChemistLoginModel> loginChemist(
//       {String email, String password}) async {
//     try {
//       Response response = await Dio().post(
//         "http://ayuvani.uplosse.com/api/chemist/login",
//         options: Options(
//           headers: {'content-type': 'application/json'},
//         ),
//         data: {'user_name': email, 'password': password},
//       );
//
//       if (response.statusCode == 200) {
//         ChemistLoginModel chemistLoginModel =
//             chemistLoginModelFromJson(response.data);
//         if (chemistLoginModel.code == 200) {
//           return chemistLoginModel;
//         } else {
//           return ChemistLoginModel(
//               message: chemistLoginModel.message, code: chemistLoginModel.code);
//         }
//       }
//     } catch (error) {}
//   }
// }
