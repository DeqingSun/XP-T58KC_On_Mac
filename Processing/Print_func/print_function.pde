import java.io.*;
import javax.print.DocFlavor;
import javax.print.SimpleDoc;
import javax.print.Doc;
import javax.print.attribute.HashPrintServiceAttributeSet;
import javax.print.attribute.standard.PrinterName;
import javax.print.*;
import javax.print.attribute.PrintServiceAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;

public String rawprint(String printerName, byte[] conte) {
  String res = "";
  PrintService service = null;
  PrintService services[] = PrintServiceLookup.lookupPrintServices(null, null);
  for (int index = 0; service == null && index < services.length; index++) {
    println("Printer "+index+" is "+services[index].getName());
    if (services[index].getName().equalsIgnoreCase(printerName)) {
      service = services[index];
      println("Printer index: "+index);
    }
  }
  if (service == null) {
    return "Can't  select printer :" + printerName;
  }

  //println(conte);
  //println(printServiceAttributeSet);
  //println(printdata);
  //println(PrintServiceLookup.lookupPrintServices(null, null));

  PrintService pservice = service;
  DocPrintJob job = pservice.createPrintJob();
  DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
  Doc doc = new SimpleDoc(conte, flavor, null);
  PrintRequestAttributeSet aset = new HashPrintRequestAttributeSet();
  try {
    job.print(doc, aset);
  } 
  catch(Exception e) {
    res = e.getMessage();
  }

  return res;
}