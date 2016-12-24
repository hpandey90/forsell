package forsell;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.*;
import java.util.UUID;

public class AddAd extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		 try {
			    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			    if (isMultipart) 
	            {  
		        List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
		        String[] fieldName = new String[100];
		        String[] fieldValue = new String[100];
		        String[] fTitle = new String[5];
		        String[] fCat = new String[5];
		        String[] fDesc = new String[5];
		        String[] query = new String[5];
		        String[] prodID = new String[5];
		        String[] pricee = new String[5];
		        String[][] imgExt = new String[5][5];
		        for(int ii=0;ii<5;ii++)
		        	for(int jj=0;jj<5;jj++)
		        		imgExt[ii][jj] = "";
		        String phone = "";
		        String sstreet = "";
		        String pin = "";
		        int flag = 1;
		        int counter = 1;
		        int i = 0,tCount = 0,cCount = 0,dCount = 0,pCount = 0,priceCount=0;
		        int k=0,l=0;
		        for (FileItem item : items) {		        	
		            if (item.isFormField()) {
		            	fieldName[i] = item.getFieldName();
		                fieldValue[i] = item.getString();
		                if (fieldName[i].contains("adTitle"))
		                	fTitle[tCount++] = fieldValue[i]; 		                		                
		                else if (fieldName[i].contains("adSubCategory"))
		                	fCat[cCount++] = fieldValue[i];		                			                
		                else if (fieldName[i].contains("adDesc"))
		                	fDesc[dCount++] = fieldValue[i];	
		                else if (fieldName[i].contains("productPrice"))
		                	pricee[priceCount++] = fieldValue[i];
		                else if (fieldName[i].contains("adUPhone"))
		                	phone = fieldValue[i];
		                else if (fieldName[i].contains("adUPin"))
		                	pin = fieldValue[i];
		                else if (fieldName[i].contains("adUAddress"))
		                	sstreet = fieldValue[i]; 
		                flag = 1;
		            } else {
		            	if((tCount == cCount) && (cCount == dCount) && (dCount == priceCount) && flag == 1){	
		            		flag = 0;
			        		prodID[pCount++] = UUID.randomUUID().toString();
			        		counter = 1;
			        		k++;
			        		l=0;
		            	}
		                fieldName[i] = item.getFieldName();		      
		                String fileName = FilenameUtils.getName(item.getName());
		                if(fileName != ""){
		                String[] ext = fileName.split("\\.");
		                String root = "\\\\192.168.0.19/uploads/"+prodID[pCount-1];
		                File path = new File(root);
		                if (!path.exists()) {
		                    boolean status = path.mkdirs();
		                }
		                imgExt[k-1][l++] = ext[ext.length-1];
		                File uploadedFile = new File(path + "/" + (counter++) + "." + ext[ext.length-1]);
		                System.out.println(uploadedFile.getAbsolutePath());
		                item.write(uploadedFile);
		                }
		            }
		            i++;
		        }
		       
		        for(int j=0;j<tCount;j++){		           
		           query[j] = "INSERT INTO postads (prod_id,prod_title,prod_sub_cat,prod_desc,price,zip_code,street,phone_number,img_ext1,img_ext2,img_ext3,img_ext4,img_ext5) values ('"+prodID[j]+"','"+fTitle[j]+"','"+fCat[j]+"','"+fDesc[j]+"','"+pricee[j]+"','"+pin+"','"+sstreet+"','"+phone+"','"+imgExt[j][0]+"','"+imgExt[j][1]+"','"+imgExt[j][2]+"','"+imgExt[j][3]+"','"+imgExt[j][4]+"');";		       
		           System.out.println (query[j]);
		        }
		        DbConnect db = new DbConnect();
			    Statement stmt = db.conn();
			    for(int j=0;j<tCount;j++)
  				    	stmt.executeUpdate(query[j]);			       
			    System.out.println ("Query Executed");
			    response.sendRedirect("index.jsp");
	            }
		 } catch(Exception e) {
			 
			    System.out.println(e.getMessage());
			    //out.println(e.printStackTrace());
			    
			  }
	}	  
}