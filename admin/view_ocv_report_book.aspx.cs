using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_ocv_report_book : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            permission();

            lblMsg.Visible = false;
            DDLClubName.Visible = false;            
            rbtnSearch.SelectedIndex = 0;
            RadGrid1.CurrentPageIndex = 0;           

            bool b;
            if (b = true)
            {               
                Session["value"] = null;
                b = false;
            }

            ManageGrid();

        }
    }
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteOCVBook";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
               // RadGrid1.DataBind();
                ManageGrid();
            }
        }
    }

    private void ManageGrid()
    {
        try
        {
            if (Session["value"] != null)
            {
                SearchGrid(int.Parse(DDLClubName.SelectedValue.ToString()));
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }           

            else
            {
                try
                {
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

                    BindGrid();
                }
                catch { BindGrid(); }
            }
        }
        catch { }
    }

    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_OCV_Book] order by added_date desc";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void SearchGrid(int clubid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_OCV_Book] where DistrictClubID='" + clubid + "' order by added_date desc";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["value"] = null;
        RadGrid1.Visible = false;
        lblMsg.Visible = false;
        DDLClubName.Visible = false;
      
        int v = int.Parse(rbtnSearch.SelectedValue.ToString());

        if (v == 0)
        {
            RadGrid1.CurrentPageIndex = 0;
            BindGrid();
        }
        if (v == 1)
        {
            Session["value"] = "ClubID";
            DDLClubName.Visible = true;
        }
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchGrid(int.Parse(DDLClubName.SelectedValue.ToString()));
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
