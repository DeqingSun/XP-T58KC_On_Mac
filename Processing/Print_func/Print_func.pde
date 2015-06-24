
void setup() {
  String printerName="Prolific_Technology_Inc._IEEE-1284_Controller";
  String printStr=XPrinter_Reset;
  printStr=printStr+XPrinter_Bold_True;
  printStr=printStr+"Bold";
  printStr=printStr+XPrinter_Bold_False;
  printStr=printStr+"no Bold\n";
  printStr=printStr+XPrinter_feedRows(2);
  printStr=printStr+"OK Over\n";
  
  printStr=printStr+XPrinter_feedRows(3);  //prevent cutting content
  printStr=printStr+XPrinter_Cut_Paper;
  

  
  
  rawprint(printerName, printStr);
  println("OK");
}

