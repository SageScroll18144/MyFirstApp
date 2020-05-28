void main(){

  var b  = [1,2,3,4,5,4,6];

  num count = 0;

  for (var i = 0; i < b.length; i++) {
    count+=b[i];
  }

  print('this is the sum.:\t');
  print(count);
}