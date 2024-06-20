class EValidator{

  String? passwordValidation(String passowrd){
    if(passowrd.isEmpty || passowrd == null){

      return 'Password is required';
    }
    else if(passowrd.length<6){

    return 'Password must be 6 latter';
    }else if(!passowrd.contains(RegExp(r'[!@#$%^&*(),.?":{}\<>]'))){
      return 'Password must be contains at least one special character';
    }
    return null;
  }
  String? emailValidation(String email){
    final emailRegEx = RegExp(r'^[\w-\.]+@([\w-]\.)+[\w-]{2,4}$');
    if(email.isEmpty || email == null){

      return 'Email is required';
    }
    else if(!emailRegEx.hasMatch(email)){

      return 'Invalid email address';
    }
   return null;
  }
  String? nameValidation(String name){
    if(name.isEmpty){
      return 'Name is required';
    }else{
      return null;
    }
  }
  String? phoneValidation(String phone){
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(patttern);
    if(phone.isEmpty || phone == null ){
      return 'Phone number is required';
    }
    else if(!regExp.hasMatch(phone)){
      return 'Please enter valid phone number';
    }
    else{
      return null;
    }
  }
}