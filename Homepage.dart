import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Chat_page.dart';
import 'auth_service.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth=FirebaseAuth.instance;

 void signOut(){
    final authService=Provider.of<AuthService>(context,listen:false);
    authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page'),
      actions: [
        IconButton(onPressed: signOut, icon: const Icon(Icons.logout)),
      ],
      ),
      body: _buildUserList(),

    );
  }
  Widget _buildUserList(){
   return StreamBuilder<QuerySnapshot>(
     stream: FirebaseFirestore.instance.collection('user').snapshots(),
    builder: (context,snapshot){
       if(snapshot.hasError){
      return const Text('error');

    }
       if(snapshot.connectionState==ConnectionState.waiting){
       return const Text('loading..');
       }
      return ListView(
        children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
      );
       },

   );
  }
  Widget _buildUserListItem(DocumentSnapshot document){
   Map<String,dynamic>data=document.data()! as Map<String,dynamic>;
 if(_auth.currentUser!.email!=data['email']) {
   return ListTile(
     title:Text (data['email']),
     onTap: () {
       Navigator.push(context, MaterialPageRoute(builder: (context) =>
           ChatPage(
             receiverUserEmail: data['email'],
             receiverUserID: data['uid'],
           ),
       ),
       );
     },
   );

 } else{
   return Container();

 }
 }


}
