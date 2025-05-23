import 'package:get/get.dart';

valed(String val ,int min ,int max,String type){
if(val.isEmpty){
  return "لايمكن أن يكون فارغاً";
}

if(val.length<min){
  return " لايمكن أن يكون أصغر من  ${min}";
}
if(val.length>max){
  return "لايمكن أن يكون أكبر من  ${max}";
}



}