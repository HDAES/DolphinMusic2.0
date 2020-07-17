
class FormateUtils{

  //格式化播放量
  static String formateCount(count){
    if(count>10000){
      return '${count~/10000}万';
    }else{
      return count;
    }
  }

  static String formateDuration(duration){
    int minute = duration~/60000;
    int second = duration~/1000%60;
    return '${minute<10?'0'+ minute.toString():minute}:${second<10?'0'+ second.toString():second}';
  }
}