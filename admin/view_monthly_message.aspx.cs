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

public partial class admin_view_monthly_message : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {       
        try
        {
            if (Session["user"] != null)
            {
                if (!IsPostBack)
                {
                    bool b=true;
                    if (b == true)
                    {
                        Session["searchField"] = null;
                        Session["name"] = null;
                        Session["value"] = null;
                        b = false;
                    }
                    lblMsg.Visible = false;
                    permission();
                    ManageGrid();
                }
            }
            else
            {
                Session.Abandon();
                Response.Redirect("Default.aspx");
            }
        }
        catch
        {
        }      

    }
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteMonthlyMsg";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {               
                ManageGrid();
            }
        }
    }
      
    private void SearchGrid(string name)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        if (name == "All")
            obj.SetCommandSP = "z_GetMothlyMessageList";
        else
            obj.SetCommandQry = "select * from monthly_message_tbl where message_from= '" + name + "'";


        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }


    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
      
        obj.SetCommandSP = "z_GetMothlyMessageList";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }  

    private void ManageGrid()
    {
        try
        {

            if (Session["searchField"] != null)
            {
                SearchGrid(Session["value"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }
            
            else
            {
                BindGrid();
            }
        }
        catch { }
    }
    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }

    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
           // obj.SetCommandQry = "SELECT * FROM [Users]";
            obj.SetCommandSP = "z_GetPermission";

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

    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string type = rbtnType.SelectedItem.Text;
        SearchGrid(type);
    }
}
