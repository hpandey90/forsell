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
		        String[] fieldName = new String[20];
		        String[] fieldValue = new String[20];
		        String[] fTitle = new String[5];
		        String[] fCat = new String[5];
		        String[] fDesc = new String[5];
		        String[] query = new String[5];
		        String[] prodID = new String[5];
		        String[] price = new String[5];
		        String phone;
		        String street;
		        String pin;
		        int flag = 1;
		        int counter = 1;
		        int i = 0,tCount = 0,cCount = 0,dCount = 0,pCount = 0,priceCount=0;
		        for (FileItem item : items) {		        	
		            if (item.isFormField()) {
		            	fieldName[i] = item.getFieldName();
		                fieldValue[i] = item.getString();
		                if (fieldName[i].contains("adTitle"))
		                	fTitle[tCount++] = fieldValue[i]; 		                		                
		                else if (fieldName[i].contains("adCategory"))
		                	fCat[cCount++] = fieldValue[i];		                			                
		                else if (fieldName[i].contains("adDesc"))
		                	fDesc[dCount++] = fieldValue[i];		 
		                flag = 1;
		            } else {
		            	if((tCount == cCount) && (cCount == dCount) && (flag == 1)){		        		
			        		prodID[pCount++] = UUID.randomUUID().toString();
			        		flag=0;
			        		counter = 1;
		            	}
		                fieldName[i] = item.getFieldName();		      
		                String fileName = FilenameUtils.getName(item.getName());
		                String[] ext = fileName.split("\\.");
		                String root = getServletContext().getRealPath("/");
		                File path = new File(root + "/uploads/" + prodID[pCount-1]);
		                if (!path.exists()) {
		                    boolean status = path.mkdirs();
		                }
		                File uploadedFile = new File(path + "/" + (counter++) + "." + ext[ext.length-1]);
		                System.out.println(uploadedFile.getAbsolutePath());
		                item.write(uploadedFile);
		            }
		            i++;
		        }
		        for(int j=0;j<tCount;j++){		           
		           query[j] = "INSERT INTO postads (prod_id,prod_title,prod_cat,prod_desc) values ('"+prodID[j]+"','"+fTitle[j]+"','"+fCat[j]+"','"+fDesc[j]+"');";		       
		           System.out.println (query[j]);
		        }
		        String db = "forsale";
				String user = "ashish";
				java.sql.Connection con;
			    Class.forName("com.mysql.jdbc.Driver");
			    con = DriverManager.getConnection("jdbc:mysql://192.168.0.16/"+db, user, "mypass");
			    System.out.println (db + " database successfully opened.");
			    Statement stmt = con.createStatement();
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