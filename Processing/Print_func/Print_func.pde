
void setup() {
  String printerName="Prolific_Technology_Inc._IEEE-1284_Controller";

  ByteArrayOutputStream outputBuf= new ByteArrayOutputStream(); 
  appendBuffer(outputBuf, XPrinter_Reset);
  appendBuffer(outputBuf, XPrinter_Bold_True);
  appendBuffer(outputBuf, "Bold ");
  appendBuffer(outputBuf, XPrinter_Bold_False);
  appendBuffer(outputBuf, "no Bold\n");

  appendBuffer(outputBuf, "OK Over\n");

  appendBuffer(outputBuf, XPrinter_feedRows(3));//prevent cutting content
  appendBuffer(outputBuf, XPrinter_Cut_Paper);

  rawprint(printerName, outputBuf.toByteArray());
  println("OK");
}

