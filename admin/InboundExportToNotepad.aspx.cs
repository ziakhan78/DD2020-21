using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_InboundExportToNotepad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ExportTextFile(object sender, EventArgs e)
    {
        string txt = "";
        string strName = "";
        string strEmail = "";

        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT distinct name, emailId from View_Inbound group by name, emailId order by name";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if(dt.Rows.Count>0)
        {
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 10 || i == 20 || i == 30 || i == 40 || i == 50)
                {
                    txt = txt.Remove(txt.Length - 2);
                    txt = txt + "\r\n\r\n******************************************************\r\n\r\n";
                }
                txt = txt+ dt.Rows[i]["Name"].ToString()+" <" + dt.Rows[i]["emailId"].ToString() + ">, ";
               
            }

        }

        txt = txt.Remove(txt.Length - 2);

        //Download the Text file.
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=InboundNotepadExport.txt");
        Response.Charset = "";
        Response.ContentType = "application/text";
        Response.Output.Write(txt);
        Response.Flush();
        Response.End();
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}