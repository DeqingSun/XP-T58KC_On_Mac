final byte[] XPrinter_Reset = new byte[] {   
  0x1b, 0x40
};

final byte[] XPrinter_Bold_True = new byte[] {   
  0x1b, 0x45, 0x01
};

final byte[] XPrinter_Bold_False = new byte[] {   
  0x1b, 0x45, 0x00
};


//final String XPrinter_Font_Regular = "\u001BM\u0000";
//final String XPrinter_Font_Compact = "\u001BM\u0001";

final byte[] XPrinter_Cut_Paper = new byte[] {   
  0x1D, 0x56, 0x01
};

byte[] XPrinter_feedRows(int rows) {
  byte[] bytesArr=new byte[] {
    0x1b, 0x64, 0
  };
  bytesArr[2]=(byte)rows;
  return bytesArr;
}

byte[] XPrinter_Settings(int rows) {
  byte[] bytesArr=new byte[] {
    0x1b, 0x21, 0
  };
  bytesArr[2]=(byte)rows;
  return bytesArr;
}

void appendBuffer(ByteArrayOutputStream buf, byte[] arr) {
  buf.write(arr, 0, arr.length);
}
void appendBuffer(ByteArrayOutputStream buf, String str) {
  appendBuffer(buf, str.getBytes());
}

