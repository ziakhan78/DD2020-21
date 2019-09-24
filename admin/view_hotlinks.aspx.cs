using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class view_hotlinks : System.Web.UI.Page
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
                // permission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
  
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteHotlink";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
    protected void rbtnFor_SelectedIndexChanged(object sender, EventArgs e)
    {
        int i = int.Parse(rbtnFor.SelectedValue.ToString());

        string type = rbtnFor.SelectedItem.Text.Trim().ToString();
        Session["value"] = type;

        if (i == 0)
        {
            BindGrid();
            DDLClubName.Visible = false;
        }
        if (i == 1)
        {
            BindHotLinksList(type);
            DDLClubName.Visible = false;
        }
        if (i == 2)
        {
            BindHotLinksList(type);
            DDLClubName.Visible = true;
        }
        if (i == 3)
        {
            BindHotLinksList(type);
            DDLClubName.Visible = false;
        }        
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubid=int.Parse(DDLClubName.SelectedValue.ToString());
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [hotlinks_tbl] where DistrictClubId='" + clubid + "' order by id desc";
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

    private void BindHotLinksList(string links_for)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetHotLinksList";
        obj.AddParam("@link_for", links_for);
        DataTable dt = new DataTable();
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
       // Session["value"] = null;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [hotlinks_tbl] order by id desc";
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
    private void ManageGrid()
    {
        try
        {
            if (Session["value"] != null)
            {
                string type = rbtnFor.SelectedItem.Text.Trim().ToString();
                BindHotLinksList(type);
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
}
