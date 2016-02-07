
void setup() {
  size(400, 400);
  String printerName="Prolific Technology Inc. IEEE-1284 Controller";

  ByteArrayOutputStream outputBuf= new ByteArrayOutputStream(); 
  appendBuffer(outputBuf, XPrinter_Reset);
  appendBuffer(outputBuf, XPrinter_Bold_True);
  appendBuffer(outputBuf, "Bold ");
  appendBuffer(outputBuf, XPrinter_Bold_False);
  appendBuffer(outputBuf, "no Bold\n");

  PGraphics pg;
  pg = createGraphics(361, 361);
  pg.beginDraw();
  pg.background(255);
  pg.stroke(0);
  pg.noFill();
  pg.line(0, 0, pg.width, pg.height);
  pg.ellipse(pg.width/2, pg.height/2, pg.width-2, pg.height-2);
  pg.fill(0);
  pg.textSize(32);
  pg.text("Hello", pg.width/2-40+80, pg.height/2-16); 
  pg.text("world", pg.width/2-40-80, pg.height/2+26); 

  pg.endDraw();
  image(pg.get(), 0, 0); 

  appendBuffer(outputBuf, XPrinter_ProcessImage(0, pg.get()));
  appendBuffer(outputBuf, "OK Over\n");
  appendBuffer(outputBuf, XPrinter_feedRows(3));//prevent cutting content
  appendBuffer(outputBuf, XPrinter_Cut_Paper);

  rawprint(printerName, outputBuf.toByteArray());
  println("OK");
}