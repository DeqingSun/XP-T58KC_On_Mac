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

//scale: 0:200DPI Vertical 200DPI Horizontal. 1:200 100 2:100:200 3:100:100
byte[] XPrinter_ProcessImage(int scale, PImage img) {
  int _width=img.width;
  int _height=img.height;
  img.loadPixels();
  int[] imgpixels=img.pixels;

  int _width_byte=(_width+7)>>3;
  byte[] bytesArr=new byte[8+(_width_byte*_height)];
  byte[] bytesArrHeader=new byte[] {
    0x1d, 0x76, 0x30, (byte)scale, (byte)(_width_byte&0xFF), (byte)((_width_byte>>8)&0xFF), (byte)(_height&0xFF), (byte)((_height>>8)&0xFF)
    };
    System.arraycopy( bytesArrHeader, 0, bytesArr, 0, 8 );

  int imgptr=0;
  int dataptr=8;
  int bitptr=0;
  for (int j=0; j<_height; j++) {
    for (int i=0; i<(_width); i++) {
      if ((imgpixels[imgptr++]&0xFF)<128) {
        bytesArr[dataptr]|=(1<<(7-bitptr));
      }
      bitptr++;
      if (bitptr>=8) {
        bitptr=0;
        dataptr++;
      }
    }
    if (bitptr>0) {
      bitptr=0;
      dataptr++;
    }
  }

  return bytesArr;
}


void appendBuffer(ByteArrayOutputStream buf, byte[] arr) {
  buf.write(arr, 0, arr.length);
}
void appendBuffer(ByteArrayOutputStream buf, String str) {
  appendBuffer(buf, str.getBytes());
}