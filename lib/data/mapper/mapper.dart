import 'package:avanced_course/app/constants.dart';
import 'package:avanced_course/app/extentions.dart';
import 'package:avanced_course/data/response/responses.dart';
import 'package:avanced_course/domain/models/models.dart';

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
    return Customer(this?.id.orEmpty() ?? Constants.empty, this?.name.orEmpty() ?? Constants.empty, this?.numOfNotifications.orZero() ?? Constants.zero);
  }
}

extension ContactsResponseMapper on ContactsResponse?{
  Contacts toDomain(){
    return Contacts(this?.phone.orEmpty() ?? Constants.empty, this?.email.orEmpty() ?? Constants.empty, this?.link.orEmpty() ?? Constants.empty);
  }
}


extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}