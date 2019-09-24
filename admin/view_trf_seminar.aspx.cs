using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

public partial class admin_view_trf_seminar : System.Web.UI.Page
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
                txtName.Visible = true;
                btnSearch.Visible = true;
                bool b;
                if (b = true)
                {
                    Session["name"] = null;
                    Session["value"] = null;
                    Session["searchField"] = null;
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

    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["name"] = null;
        Session["searchField"] = null;

        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        Session["value"] = clubid.ToString();
        SearchGrid(clubid);
    }
   
    private void SearchGrid(int clubid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM View_TRF_Seminar where club_id='" + clubid + "' order by name ";
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
        obj.SetCommandQry = "SELECT * FROM View_TRF_Seminar order by name ";
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

            else if (Session["name"] != null)
            {
                SearchByAlphabet(Session["name"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }
            else if (Session["searchField"] != null)
            {
                SearchGrid(Session["searchField"].ToString());
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

    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            Label lblstatus = (Label)e.Item.FindControl("lblstatus");
            DropDownList DDLStatus = (DropDownList)e.Item.FindControl("DDLStatus");

            if (lblstatus != null)
            {
                if (lblstatus.Text == "Pending")
                {
                    DDLStatus.SelectedValue = "0";
                }
                else if (lblstatus.Text == "Received")
                {
                    DDLStatus.SelectedValue = "1";
                }
                else if (lblstatus.Text == "Invitee")
                {
                    DDLStatus.SelectedValue = "2";
                }
                else if (lblstatus.Text == "Co-Host")
                {
                    DDLStatus.SelectedValue = "3";
                }
            }
        }
    }

    protected void DDLStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
            {
                Label lblstatus = (Label)item.FindControl("lblstatus");
                Label lblId = (Label)item.FindControl("lblId");

                DropDownList DDLStatus = (DropDownList)item.FindControl("DDLStatus");

                if (lblId != null)
                {
                    int id = int.Parse(lblId.Text.Trim().ToString());
                    string status = DDLStatus.SelectedItem.Text.Trim();
                    UpdateStatus(id, status);
                }
            }
        }
        catch { }
    }

    private void UpdateStatus(int ID, string status)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_Peace_UpdateStatus";
        obj.AddParam("@id", ID);
        obj.AddParam("@status", status);
        try
        {
            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                string jv = "<script>alert('Status has been updated successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                ManageGrid();
            }
        }
        catch { }
    }

    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());

            DropDownList DDLStatus = (DropDownList)e.Item.FindControl("DDLStatus");
            string status = DDLStatus.SelectedItem.Text.Trim();
            if (status == "Invitee" || status == "Co-Host")
            {
                UpdateInviteeHost(id, status);
            }
            else
            {
                UpdateStatus(id, status);
            }
        }
    }

    private void UpdateInviteeHost(int ID, string status)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_Peace_UpdateInviteeCoHost";
        obj.AddParam("@id", ID);
        obj.AddParam("@status", status);
        try
        {
            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                string jv = "<script>alert('Status has been updated successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                ManageGrid();
            }
        }
        catch { }
    }


    #region Search Start

    protected void LnkA_Click(object sender, EventArgs e)
    {
        string val = "A";
        SearchByAlphabet(val);
    }
    protected void LnkB_Click(object sender, EventArgs e)
    {
        string val = "B";
        SearchByAlphabet(val);
    }
    protected void LnkC_Click(object sender, EventArgs e)
    {
        string val = "C";
        SearchByAlphabet(val);
    }
    protected void LnkD_Click(object sender, EventArgs e)
    {
        string val = "D";
        SearchByAlphabet(val);
    }
    protected void LnkE_Click(object sender, EventArgs e)
    {
        string val = "E";
        SearchByAlphabet(val);
    }
    protected void LnkF_Click(object sender, EventArgs e)
    {
        string val = "F";
        SearchByAlphabet(val);
    }
    protected void LnkG_Click(object sender, EventArgs e)
    {
        string val = "G";
        SearchByAlphabet(val);
    }
    protected void LnkH_Click(object sender, EventArgs e)
    {
        string val = "H";
        SearchByAlphabet(val);
    }
    protected void LnkI_Click(object sender, EventArgs e)
    {
        string val = "I";
        SearchByAlphabet(val);
    }
    protected void LnkJ_Click(object sender, EventArgs e)
    {
        string val = "J";
        SearchByAlphabet(val);
    }
    protected void LnkK_Click(object sender, EventArgs e)
    {
        string val = "K";
        SearchByAlphabet(val);
    }
    protected void LnkL_Click(object sender, EventArgs e)
    {
        string val = "L";
        SearchByAlphabet(val);
    }
    protected void LnkM_Click(object sender, EventArgs e)
    {
        string val = "M";
        SearchByAlphabet(val);
    }
    protected void LnkN_Click(object sender, EventArgs e)
    {
        string val = "N";
        SearchByAlphabet(val);
    }
    protected void LnkO_Click(object sender, EventArgs e)
    {
        string val = "O";
        SearchByAlphabet(val);
    }
    protected void LnkP_Click(object sender, EventArgs e)
    {
        string val = "P";
        SearchByAlphabet(val);
    }
    protected void LnkQ_Click(object sender, EventArgs e)
    {
        string val = "Q";
        SearchByAlphabet(val);
    }
    protected void LnkR_Click(object sender, EventArgs e)
    {
        string val = "R";
        SearchByAlphabet(val);
    }
    protected void LnkS_Click(object sender, EventArgs e)
    {
        string val = "S";
        SearchByAlphabet(val);
    }
    protected void LnkT_Click(object sender, EventArgs e)
    {
        string val = "T";
        SearchByAlphabet(val);
    }
    protected void LnkU_Click(object sender, EventArgs e)
    {
        string val = "U";
        SearchByAlphabet(val);
    }
    protected void LnkV_Click(object sender, EventArgs e)
    {
        string val = "V";
        SearchByAlphabet(val);
    }
    protected void LnkW_Click(object sender, EventArgs e)
    {
        string val = "W";
        SearchByAlphabet(val);
    }
    protected void LnkX_Click(object sender, EventArgs e)
    {
        string val = "X";
        SearchByAlphabet(val);
    }
    protected void LnkY_Click(object sender, EventArgs e)
    {
        string val = "Y";
        SearchByAlphabet(val);
    }
    protected void LnkZ_Click(object sender, EventArgs e)
    {
        string val = "Z";
        SearchByAlphabet(val);
    }
    protected void Linkbutton1_Click(object sender, EventArgs e)
    {
        string val = "ALL";
        SearchByAlphabet(val);
    }

    #endregion
    private void SearchByAlphabet(string name)
    {
        rbtnSearch.ClearSelection();
        txtName.Text = "";
        DDLClubName.Visible = false;
        txtName.Visible = true;
        btnSearch.Visible = true;

        Session["value"] = null;
        Session["searchField"] = null;

        Session["name"] = name;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetPeaceSeminar";
        obj.AddParam("@f_name", name);

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
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {

            string searchField = "";
            int i = int.Parse(rbtnSearch.SelectedValue.ToString());
            if (i == 0)
            {
                searchField = txtName.Text.Trim().ToString();
                Session["searchField"] = searchField.ToString();
                SearchGrid(searchField);
            }
        }
        catch { }

    }

    private void SearchGrid(string name)
    {
        Session["name"] = null;
        Session["value"] = null;
        Session["searchField"] = name;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandQry = "SELECT * FROM View_TRF_Seminar where name like +'" + name + "'+ '%' ";

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


    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (rbtnSearch.SelectedValue == "1")
            {
                DDLClubName.Visible = true;
                DDLClubName.SelectedIndex = 0;
                txtName.Visible = false;
                txtName.Text = "";
                btnSearch.Visible = false;
            }
            else
            {
                DDLClubName.SelectedIndex = 0;
                DDLClubName.Visible = false;
                txtName.Visible = true;
                btnSearch.Visible = true;
                txtName.Text = "";
            }
        }
        catch { }
    }
}
