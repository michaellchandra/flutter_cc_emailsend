part of 'services.dart';

class sendingEmail {
  
  static Future<http.Response> sendMail (String email) {
    return http.post(
      Uri.https(Const.baseUrl, "/Week5/cirestapi/api/mahasiswa/sendmail"),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      
      body: jsonEncode(<String, dynamic>{
        'email': email
      }),
    );
  }
}