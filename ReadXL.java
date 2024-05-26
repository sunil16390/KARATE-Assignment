package support;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;

public class ReadXL {

    public static String read_And_Print_XL_AsPerTestData(String testcasename , String columnName){

        String data = null;

        try{

            String XLFilePath = System.getProperty("user.dir")+"/inputFile/PetDir.xlsx";
            FileInputStream myxlfile = new FileInputStream(XLFilePath);
            Workbook workbook = new XSSFWorkbook(myxlfile);
            Sheet sheet = workbook.getSheet("PetDir");
            int lastRow = sheet.getLastRowNum();
            // System.out.println("The last row which has data =="+lastRow);

            // Loop for Row Iteration...
            for(int i=0;i<=lastRow;i++){
                Row row = sheet.getRow(i);
                // Get the last Column which has data
                int lastCell = row.getLastCellNum();
                Cell cell = row.getCell(0);
                String runtimeTestCaseName = cell.getStringCellValue();
                //   System.out.println("The First Column Value is ==>"+runtimeTestCaseName);
                if(runtimeTestCaseName.equals(testcasename)) {
                    // Loop for Column Iteration ...
                    Row RowNew = sheet.getRow(0);
                    for(int j=0;j<lastCell;j++){
                        Cell cellnew = RowNew.getCell(j);
                        String RunTimeCallValue = cellnew.getStringCellValue();
                        if(RunTimeCallValue.equals(columnName)) {
                            data = sheet.getRow(i).getCell(j).toString();
                            // System.out.println("The XL value is ==>" + data);
                        }
                    }
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return data;
    }
}
