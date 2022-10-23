part of 'pages.dart';

 class emailForm extends StatefulWidget {
   const emailForm({super.key});
 
   @override
   State<emailForm> createState() => _emailFormState();
 }
 
 class _emailFormState extends State<emailForm> {
  final ctrlEmail = TextEditingController();

   @override

  void dispose(){
    ctrlEmail.dispose();
  }

   Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Email Sender'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(children: [
            SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              controller: ctrlEmail,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if(!EmailValidator.validate(value.toString())){
                  return 'Email tidak valid!';
                } else {
                  return null;
                }
              },
            ),

          ]),
        ), 
        ),

     );
   }
 }

