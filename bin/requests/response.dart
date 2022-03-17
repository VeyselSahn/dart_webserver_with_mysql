extension BasicResponse on bool {
  Map get response => {"succesful": this, "time": DateTime.now()};
}
