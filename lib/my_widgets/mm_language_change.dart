String languageChange(String str){
  str = str.replaceAll('0', '၀').replaceAll('1', '၁').replaceAll('2', '၂').replaceAll('3', '၃').replaceAll('4', '၄').replaceAll('5', '၅').replaceAll('6', '၆').replaceAll('7', '၇').replaceAll('8', '၈').replaceAll('9', '၉');
return str;
}