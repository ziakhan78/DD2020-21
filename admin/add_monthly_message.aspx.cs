using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.IO; // this is for the file upload
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Globalization;
using System.Data.SqlClient;

public partial class admin_add_monthly_message : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                lblTitle.Text = "Add Monthly Message";
                dtMonthYear.SelectedDate = DateTime.Now;
               // MonthsBind();
                if (Request.QueryString["id"] != null)
                {
                    lblTitle.Text = "Edit Monthly Message";
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetMessage(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    //private void MonthsBind()
    //{
    //    try
    //    {

    //        for (int i = 1; i <= 12; i++)
    //        {
    //            ListItem item = new ListItem();
    //            item.Text = new DateTime(1900, i, 1).ToString("MMMM");
    //            item.Value = i.ToString();
    //            DDLMonth.Items.Add(item);
    //        }           

    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}

    private void GetMessage(int id)
    {
      
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetMothlyMessage";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            dtMonthYear.DbSelectedDate= dt.Rows[0]["month"].ToString();
            ddlFor.SelectedItem.Text = dt.Rows[0]["message_from"].ToString();
            txtDescription.Content = dt.Rows[0]["message"].ToString();
        }
    }
  

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateMessage(id);
            }
            else
            {
                AddMessage();
            }
        }
    }

    private void AddMessage()
    {
        try
        {
            DBconnection obj = new DBconnection();           

            obj.SetCommandSP = "z_AddMothlyMessage";
            obj.AddParam("@month", dtMonthYear.SelectedDate);
            obj.AddParam("@message_from", ddlFor.SelectedItem.Text.Trim());
            obj.AddParam("@message", txtDescription.Content);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }

        catch { }
    }
    private void UpdateMessage(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateMothlyMessage";
            obj.AddParam("@id", id);
            obj.AddParam("@month", dtMonthYear.SelectedDate);
            obj.AddParam("@message_from", ddlFor.SelectedItem.Text.Trim());
            obj.AddParam("@message", txtDescription.Content);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                Clear();
                showmsg("Record has been updated successfully", "view_monthly_message.aspx");
            }
        }

        catch { }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    private void Clear()
    {
        txtDescription.Content = "";
       // DDLMonth.SelectedIndex = 0;
        ddlFor.SelectedIndex = 0;       
    }
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
}
