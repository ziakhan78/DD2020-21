using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CreateRdmPass
/// </summary>
public class CreateRdmPass
{
	public CreateRdmPass()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string MakePassword(int length)
    {
        Random ran = new Random(DateTime.Now.Second);
        char[] password = new char[length];

        for (int i = 0; i < length; i++)
        {
            int[] n = { ran.Next(48, 57), ran.Next(65, 90), ran.Next(97, 122) };
            //int[] n = {ran.Next(33, 57), ran.Next(65, 90), ran.Next(97, 122)}; 
            int picker = ran.Next(0, 3);

            if (picker == 3)//if i make the maxvalue 2 it "never" appears... dunno whats going on there 
                picker = 2;
            password[i] = (char)n[picker];
        }

        return new string(password);
    }
}
