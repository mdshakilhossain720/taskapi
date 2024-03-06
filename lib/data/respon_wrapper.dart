class ResponseObject{
  final bool isusccess;
  final int statuscode;
  final dynamic responsebody;
  final String? errorMessage;

  ResponseObject( {required this.isusccess,required this.statuscode, required this.responsebody,  this.errorMessage=''});

}