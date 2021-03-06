package forsell;

import java.io.*;
//this store the client data
import java.net.*;
import java.util.*;

class client_data
{
	//this is all the client elements needed by the server
	private int client_no;
	public Socket clientSocket=null;
	public ObjectInputStream baseInputStream=null;
	public ObjectOutputStream baseOutputStream=null;
	client_data()
	{
	}
	public void setNum(int no)
	{
		client_no=no;
	}
	public int getNum()
	{
		return client_no;
	}
	public boolean delete_client()
	{
		try
		{
			if(clientSocket!=null)
			{
				baseInputStream.close();
				baseOutputStream.close();
				clientSocket.close();
				clientSocket=null;
				//close connections
			}
		}
		catch(IOException ioe)
		{
			ioe.printStackTrace();
		}
		return false;
	}
};
class server{
	private ServerSocket listener;
	private int port=8000;
	public client_data client_class[];
	public HashMap<String, Integer> hmap = new HashMap<String, Integer>();
	String message;
	ObjectOutputStream out;//stream write to the socket
	ObjectInputStream in;//stream read from the socket
	int client_no;
	//constructor
	public server()
	{
		client_class=new client_data[100];
		for(int i=0;i<100;i++)
		{
			client_class[i]=new client_data();
		}
		client_no=0;
	}
    public void run() throws Exception
    {
        listener = new ServerSocket(port);//creating a new listener socket
        System.out.println("2");
        while(true)
        {
        	try
        	{
        		System.out.println("3");
        		Socket temp=listener.accept();
        		System.out.println("1");
        		if(temp!=null)
        		{
        			System.out.println("01");
        			for(int i=0;i<100;i++)
        			{       //if the client socket is null then break
        				if(client_class[i].clientSocket==null)
        				{
        					System.out.println("17388");
        					client_no=i;
        					break;
        				}
        			} //if the client socket is not null
        			client_class[client_no].setNum(client_no); //set the client number 
        			client_class[client_no].clientSocket=temp;
        			System.out.println("karan");
        			System.out.println(client_no+"en");
        			//System.out.println(temp.getOutputStream().toString());
        			//System.out.println(temp.getInputStream().toString());
        			//System.out.println(client_class[new ObjectOutputStream(client_class[client_no].clientSocket.getOutputStream()).toString());
        			client_class[client_no].baseInputStream=new ObjectInputStream(client_class[client_no].clientSocket.getInputStream());
        			client_class[client_no].baseOutputStream=new ObjectOutputStream(client_class[client_no].clientSocket.getOutputStream());
        			message = (String)client_class[client_no].baseInputStream.readObject();
					hmap.put(message, client_no);
        			System.out.println(message);
        			new Handler(client_no).start();
        		}
        	}
        	catch(IOException ioe)
        	{
        		System.out.println("i m here");
        		ioe.printStackTrace();
        	}
        }
    }
	private class Handler extends Thread 
    {
        	private String message;    //message received from the client
        	private String no;
        	private int client_no_;
        	//The index number of the client
        	public Handler(int client_no)
        	{
            		this.client_no_=client_no;
            		no=client_class[this.client_no_].clientSocket.getInetAddress().getHostName();
        	}
            public void run()
            {
            	try{
            		//initialize Input and Output streams
            		try
            		{
            			//while(true)
            			//{
            				//receive the message sent from the client
            				//message = (String)client_class[client_no_].baseInputStream.readObject();
            				//System.out.println(message);
					//to get its own client number
            				/*if(message.toUpperCase().equals("MYUSER"))
            				{//calls the class sendMessgae
            					sendMessage("Your Client number is "+client_no_,client_class[client_no_].baseOutputStream);
            				}*/
								while(true)
								{
									
									message = (String)client_class[client_no_].baseInputStream.readObject();
									String[] lines = message.split(System.getProperty("line.separator"));
									if(lines[0].toUpperCase().equals("COMMAND"))
									{
										
										//this is to exit the client from the network
										//sendMessage("PERFECT",client_class[client_no_].baseOutputStream);
										if(lines[1].toUpperCase().equals("EXIT"))
										{
											client_class[client_no_].delete_client();
											hmap.remove(lines[2]);
										}
										if(lines[1].toUpperCase().equals("ACTIVEUSER"))
										{
											sendMessage("Active Users are:",client_class[client_no_].baseOutputStream);
											sendMessage("Client No. Client Name:",client_class[client_no_].baseOutputStream);
											for (int i=0;i<=client_no;i++) 
											{
												if(client_class[i].clientSocket!=null)
												sendMessage(i+" "+client_class[i].clientSocket.getInetAddress().getHostName(),client_class[client_no_].baseOutputStream);
											}	
										}
										
									}
									else
									{
										
										//System.out.println(lines[0].equals);
										int i = hmap.get(lines[0]);//Integer.parseInt(lines[0]);//lines[0].toString;//Integer.parseInt(message);//to get the client number
										System.out.println("Client"+i);
										if(i>client_no || client_class[i].clientSocket==null || hmap.get(lines[0])==null)
										{
											System.out.println(client_no_);
											sendMessage("INCORRECT CLIENT",client_class[client_no_].baseOutputStream);
										}
										else
										{
											//sendMessage("CORRECT",client_class[client_no_].baseOutputStream);
											//while(message=="")
											//{
												//message = (String)client_class[client_no_].baseInputStream.readObject();
											//}
											System.out.println(lines[1]);
											sendMessage("Client "+client_no_+" sent:"+lines[1],client_class[i].baseOutputStream);
											//message="";
										}
									}
								}
            				//}
					//to send the message to all clients
            				/*if(message.toUpperCase().startsWith("BROADCAST"))
            				{
            					while(message.toUpperCase().startsWith("BROADCAST"))
            					{
            						//#version 2.0 edit to send particular message to every client in the network
            						message = (String)client_class[client_no_].baseInputStream.readObject();
            					}
            					
            					//version 2.0 edit added new message with client number so to used by broadcast and block cast
            					for (int i=0;i<=client_no;i++) 
                                {
                    				//version 2.0 edit added to keep the information going in NULL clients
                    				if(client_class[i].clientSocket!=null && i!=client_no_)
                    					sendMessage("Client "+client_no_+" sent:"+message,client_class[i].baseOutputStream);
                                }
            				}
					//to send the message to all clients except one client
            				if(message.toUpperCase().startsWith("BLOCKCAST"))
            				{
            					while(message.toUpperCase().startsWith("BLOCKCAST"))
            						message = (String)client_class[client_no_].baseInputStream.readObject();
            					int i=Integer.parseInt(message);
            					if(i<=client_no && client_class[i].clientSocket!=null)
            					{
            						
            						sendMessage("CORRECT CLIENT",client_class[client_no_].baseOutputStream);
            						message = (String)client_class[client_no_].baseInputStream.readObject();
                					for (int i1=0;i1<=client_no;i1++) 
                                    {
                        				//version 2.0 edit added to keep the information going in NULL clients
                        				if(client_class[i1].clientSocket!=null && i1!=i && i1!=client_no_)
                        					sendMessage("Client "+client_no_+" sent:"+message,client_class[i1].baseOutputStream); 
                                    }
            					}
            					else
            					{
            						sendMessage("INCORRECT CLIENT",client_class[client_no_].baseOutputStream);
            					}
            					//this is to tell the client that needs to be blockcasted is incorrect
            					//to change the string into an integer
            					//need to check it version 3.0
            					
            				}
            				System.out.println("Receive message: " + message + " from client " + no);*/
            				//}
            		}
            		catch(ClassNotFoundException classnot)
            		{
            			System.err.println("Data received in unknown format");
            			client_class[client_no_].delete_client();
            			//close connection when data received in incorrect
            		}
            	}
            	catch(IOException ioException)
            	{
            		System.out.println("Disconnect with Client " + no);
            		client_class[client_no_].delete_client();
            		//close connection when error
            	}
            	finally
            	{
            		//client_class[client_no_].delete_client();
            		//Close connections
            	}
            }
        	public void sendMessage(String msg,ObjectOutputStream out)
        	{
        		try{
        			out.writeObject(msg);
        			out.flush();
        			System.out.println("Send message: " + msg + " to Client " + no);
        		}
        		catch(IOException ioException){
        			ioException.printStackTrace();
        		}
        	}
	}
	public static void main(String[] args) throws Exception
	{
		server s=new server();
		//initiating class to get run the other functions
		try{
			s.run();
		}
		catch(java.net.BindException ioe)
		{
			System.out.println("The Server is already running");
		}
		//running the other function
	}
}