﻿using System;
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

public partial class admin_view_past_district_gove : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLRCof.Visible = false;
            txtName.Visible = true;
        }
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
            obj.SetCommandSP = "sp_DeletePDG";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();
            }
        }
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
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;
        Session["name"] = name;

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetPDG";
        obj.AddParam("@f_name", name);

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;

        string searchField = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "rotarian_name";
        }
        if (i == 1)
        {
            searchField = "club_name";
        }       
              

        string val = txtName.Text.Trim().ToString();
        Session["searchField"] = searchField.ToString();
        Session["value"] = val;
        SearchGrid(searchField, val);

    }
    private void SearchGrid(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        if (searchField == "club_name")
        {
            obj.SetCommandQry = "select ROW_NUMBER () OVER (ORDER BY rotarian_name asc ) AS RowNumber,* from past_district_gov_tbl where " + searchField + " = '" + pname + "'";
        }
        else
        {
            obj.SetCommandQry = "select ROW_NUMBER () OVER (ORDER BY rotarian_name asc ) AS RowNumber,* from past_district_gov_tbl where " + searchField + " like +'" + pname + "'+ '%' ";
        }
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
       // obj.SetCommandQry = "SELECT ROW_NUMBER () OVER (ORDER BY year) AS RowNumber,* FROM [past_district_gov_tbl] ORDER BY [year] desc";
        obj.SetCommandSP = "z_GetAllPastDistGove";
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
                SearchGrid(Session["searchField"].ToString(), Session["value"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["name"] != null)
            {
                SearchByAlphabet(Session["name"].ToString());
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
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnSearch.SelectedValue == "1")
        {
            DDLRCof.Visible = true;
            txtName.Visible = false;
        }
        else
        {
            DDLRCof.Visible = false;
            txtName.Visible = true;
        }
    }
    protected void DDLRCof_SelectedIndexChanged(object sender, EventArgs e)
    {
        string clubName = DDLRCof.SelectedItem.Text.Trim().ToString();
        SearchGrid("club_name", clubName);
    }

}
