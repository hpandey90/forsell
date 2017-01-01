package forsell;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.List;
import java.io.File;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.*;
import java.util.UUID;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;

public class AddAd extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
				int check=0,valid=0,err=0;
				String[] prodID = new String[5];
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
		        String[] pricee = new String[5];
		        String[][] imgExt = new String[5][5];
		        for(int ii=0;ii<5;ii++)
		        	for(int jj=0;jj<5;jj++)
		        		imgExt[ii][jj] = "";
		        String phone = "";
		        String sstreet = "";
		        String rroute = "";
		        String city = "";
		        String sstate = "";
		        String ccountry = "";
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
		                else if (fieldName[i].contains("street_number"))
		                	sstreet = fieldValue[i]; 
		                else if (fieldName[i].contains("route"))
		                	rroute = fieldValue[i]; 
		                else if (fieldName[i].contains("locality"))	
		                	city = fieldValue[i];
		                else if (fieldName[i].contains("administrative_area_level_1"))
		                	sstate = fieldValue[i];
		                else if (fieldName[i].contains("postal_code"))
		                	pin = fieldValue[i];
		                else if (fieldName[i].contains("country"))
		                	ccountry = fieldValue[i];
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
		                if(ext[ext.length-1].toLowerCase().contains("jpg") || ext[ext.length-1].toLowerCase().contains("jpeg")){
		                File uploadedFile = new File(path + "/temp-" + (counter) + "." + ext[ext.length-1]);
		                System.out.println(uploadedFile.getAbsolutePath());
		                item.write(uploadedFile);
		                
		                //image compression starts
		                System.out.println("compression starts");
		                File imageFile = new File(root + "/temp-" + (counter) + "." + ext[ext.length-1]);
		        		File compressedImageFile = new File(root + "/" + (counter++) + "." + ext[ext.length-1]);
		        		//System.out.println("new file = "+root + "/" + (counter++) + "." + ext[ext.length-1])
		        		InputStream inputStream = new FileInputStream(imageFile);
		        		OutputStream outputStream = new FileOutputStream(compressedImageFile);

		        		float imageQuality = 0.3f; //specify value between 0-1 for image quality

		        		//Create the buffered image
		        		BufferedImage bufferedImage = ImageIO.read(inputStream);

		        		//Get image writers
		        		Iterator<ImageWriter> imageWriters = ImageIO.getImageWritersByFormatName(ext[ext.length-1]);

		        		if (!imageWriters.hasNext())
		        			throw new IllegalStateException("Writers Not Found!!");

		        		ImageWriter imageWriter = (ImageWriter) imageWriters.next();
		        		ImageOutputStream imageOutputStream = ImageIO.createImageOutputStream(outputStream);
		        		imageWriter.setOutput(imageOutputStream);

		        		ImageWriteParam imageWriteParam = imageWriter.getDefaultWriteParam();

		        		//Set the compress quality metrics
		        		imageWriteParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
		        		imageWriteParam.setCompressionQuality(imageQuality);

		        		//Created image
		        		imageWriter.write(null, new IIOImage(bufferedImage, null, null), imageWriteParam);

		        		// close all streams
		        		inputStream.close();
		        		outputStream.close();
		        		imageOutputStream.close();
		        		imageWriter.dispose();
		        		uploadedFile.delete();
		                }else{
		                	File uploadedFile = new File(path + "/" + (counter) + "." + ext[ext.length-1]);
			                System.out.println(uploadedFile.getAbsolutePath());
			                item.write(uploadedFile);
		                }
		                }
		            }
		            i++;
		        }
		        check = tCount;
		        for(int j=0;j<tCount;j++){		           
		           query[j] = "INSERT INTO postads (prod_id,prod_title,prod_sub_cat,prod_desc,price,street_number,route,locality,state,postal_code,country,phone_number,img_ext1,img_ext2,img_ext3,img_ext4,img_ext5) values ('"+prodID[j]+"','"+fTitle[j]+"','"+fCat[j]+"','"+fDesc[j]+"','"+pricee[j]+"','"+sstreet+"','"+rroute+"','"+city+"','"+sstate+"','"+pin+"','"+ccountry+"','"+phone+"','"+imgExt[j][0]+"','"+imgExt[j][1]+"','"+imgExt[j][2]+"','"+imgExt[j][3]+"','"+imgExt[j][4]+"');";		       
		           System.out.println (query[j]);
		        }
		        DbConnect db = new DbConnect();
			    Statement stmt = db.conn();
			    for(int j=0;j<tCount;j++){
  				    	stmt.executeUpdate(query[j]);
  				    	valid++;
			    }
			    System.out.println ("Query Executed");
			    response.sendRedirect("index.jsp");
	            }
		 } catch(Exception e) {
			    err = valid;
			 	while(valid<=check){
			 		File index = new File("\\\\192.168.0.19/uploads/"+prodID[valid]);
			 		String[]entries = index.list();
			 		if(index.exists()){
			 		for(String s: entries){
			 		    File currentFile = new File(index.getPath(),s);			 		    
			 		    currentFile.delete();			 	
			 		}
			 		index.delete();
			 		}
			 		valid++;
			 	}
			    System.out.println(e.getMessage());
			    if(err < check)
			      response.sendRedirect("postAd.jsp?error="+(check-err));
			    //out.println(e.printStackTrace());
			    
			  }
	}	  
}