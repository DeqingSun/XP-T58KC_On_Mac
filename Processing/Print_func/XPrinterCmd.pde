final String XPrinter_Reset = "\u001B@";

final String XPrinter_Bold_True = "\u001BE\u0001";
final String XPrinter_Bold_False = "\u001BE\u0000";

final String XPrinter_Cut_Paper = "\u001DV\u0001";


String XPrinter_feedRows(int rows) {
  byte[] bytesArr=new byte[] {
    0x1b, 0x64, 0
  };
  bytesArr[2]=(byte)rows;
  return new String(bytesArr);
}

