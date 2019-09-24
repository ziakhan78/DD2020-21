using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_attendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                lblMsg.Visible = false;
                RadGrid1.Visible = false;                
                MonthBind();

                string month = DateTime.Now.ToString("MMMM");
                BindGrid(month);
                permission();
            }
            catch { }
        }       
    }
    private void MonthBind()
    {
        try
        {
            for (int i = 1; i <= 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, i, 1).ToString("MMMM");
                item.Value = new DateTime(1900, i, 1).ToString("MMMM");
                DDLMonth.Items.Add(item);
            }
            DDLMonth.Items.Insert(0, DateTime.Now.ToString("MMMM"));
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteAttendane";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //RadGrid1.DataBind();
                string month = DDLMonth.SelectedItem.Text.Trim().ToString();
                BindGrid(month);
            }
        }
    }
    protected void DDLMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string month = DDLMonth.SelectedItem.Text.Trim().ToString();
            BindGrid(month);
        }
        catch { }
    }

    private void BindGrid(string month)
    {       
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_Clubs_Attendance] where month='" + month + "' and year(added_date)=year(getdate()) ORDER BY [club_name]";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [Users]";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }
}


