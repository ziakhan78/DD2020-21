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

public partial class view_bulletin : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    if (Session["user"] != null)
    {
        if (!IsPostBack)
        {
            DDLClubName.Visible = false;
            bool b;
            if (b = true)
            {               
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
    protected void RadGrid1_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
    {
        //if (e.CommandName == "Delete")
        //{
        //    string i = e.CommandArgument.ToString();
        //    int id = int.Parse(i.ToString());
        //    DBconnection obj = new DBconnection();
        //    obj.SetCommandSP = "z_DeleteBulletins";
        //    obj.AddParam("@id", id);
        //    if (obj.ExecuteNonQuery() > 0)
        //    {
        //        RadGrid1.DataBind();
        //    }
        //}
    }
    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["value"] = null;

        if (rbtnType.SelectedValue == "0")
        {
            DDLClubName.Visible = false;
            DDLClubName.SelectedIndex = 0;

            ManageGrid();
        }
        else
        {
            DDLClubName.Visible = true;
        }
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        SearchGrid(clubid);
    }

    private void SearchGrid(int clubid)
    {
        Session["value"] = "value";

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [bulletin_tbl] where DistrictClubId='" + clubid + "' order by id desc ";
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
        Session["value"] = null;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [bulletin_tbl] order by id desc ";
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

            if (Session["value"] != null)
            {
                int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
                SearchGrid(clubid);

                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }
           
            else
            {

                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
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
