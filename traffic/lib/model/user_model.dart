import 'package:flutter/scheduler.dart';

class UserModel {
  String? uid;
  String? firstName;
  String? lastName;
  String? emailId;
  String? phoneNumber;
  String? vehicleNumber;
  String? licenseNumber;
  //String? password;
  UserModel(
      {this.uid,
      this.firstName,
      this.lastName,
      this.emailId,
      this.phoneNumber,
      this.vehicleNumber,
      this.licenseNumber});
  // Data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      emailId: map['emailId'],
      phoneNumber: map['phoneNumber'],
      vehicleNumber: map['vehicleNumber'],
      licenseNumber: map['licenseNumber'],
    );
  }

  // storing data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'emailId': emailId,
      'phoneNumber': phoneNumber,
      'vehicleNumber': vehicleNumber,
      'licenseNumber': licenseNumber,
    };
  }
}
