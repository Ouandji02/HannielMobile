void search(listElement, copyListElement, String wordKey){

  List<Map<String,dynamic>> result = [];

  if(wordKey == null){
    result = listElement;
  }else{
    result = listElement.where((element) =>
      element["nom"].toLowerCase().contains(wordKey)
    ).toList();
  }
  copyListElement = result;
  print('cccccccccccccccccccccccccccccccccccccccccccccccccccccccccc $result',);
}