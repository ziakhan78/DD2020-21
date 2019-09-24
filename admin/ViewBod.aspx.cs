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

public partial class user_ViewBod : System.Web.UI.Page
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
                rbtnSort.SelectedIndex = 0;
                ddlYears.Visible = false;
                ddlClubName.Visible = false;
                ddlSearchYear.Visible = false;
                txtName.Visible = true;

                bool b = true; ;
                if (b ==true)
                {
                    Session["searchYear"] = null; 
                    Session["searchField"] = null; 
                    Session["name"] = null;
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
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteBod";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //RadGrid1.DataBind();
                ManageGrid();
            }
        }
    }
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    private void ManageGrid()
    {
        try
        {
            if (Session["value"] != null)
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

            else if (Session["searchYear"] != null)
            {
                SearchGrid(ddlSearchYear.SelectedItem.Text.Trim());
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
        Session["searchYear"] = null;
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;

        rbtnSearch.SelectedIndex = 0;
        txtName.Visible = true;
        ddlSearchYear.SelectedIndex = 0;
        ddlSearchYear.Visible = false;
     
        Session["name"] = name;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabetBod";
        obj.AddParam("@name", name);      

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
            lblMsg.Text = "No records to display.";
            RadGrid1.Visible = false;
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["searchYear"] = null;
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;

        string searchField = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "name";
        }
        if (i == 1)
        {
            searchField = "designation";
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
        obj.SetCommandQry = "select * from View_BodMembers where district_no='3141' and " + searchField + " like  '%'+'" + pname + "'+ '%' ";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //txtName.Text = "";
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "No records to display.";
            RadGrid1.Visible = false;
        }
    }
    private void SearchGrid(string strYear)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_BodMembers where district_no='3141' and year='" + strYear + "' ";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtName.Text = "";
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "No records to display.";
            RadGrid1.Visible = false;
        }
    }    

    private void BindGrid()
    {
        int distNo = 3141;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        //obj.SetCommandSP = "z_GetBodMembersList";    
        obj.SetCommandSP = "z_GetBodMembersList3141";
        obj.AddParam("@district_no", distNo);
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
            lblMsg.Text = "No records to display.";
            RadGrid1.Visible = false;
        }
    }
    protected void ddlSearchYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["searchYear"] = null;
        Session["searchField"] = null;
        Session["name"] = null;
        Session["value"] = null;

        SearchGrid(ddlSearchYear.SelectedItem.Text.Trim());
        Session["searchYear"] = "Year";
    }
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSearchYear.Visible = false;
        txtName.Visible = true;
        string value = rbtnSearch.SelectedValue.ToString();
        ddlSearchYear.SelectedIndex = 0;

        if (value == "0")
        {
            ddlSearchYear.Visible = false;
            txtName.Visible = true;
        }
        if (value == "1")
        {
            ddlSearchYear.Visible = false;
            txtName.Visible = true;
        }
        if (value == "2")
        {
            ddlSearchYear.Visible = true;
            txtName.Visible = false;            
        }
    }

    protected void ddlYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubId =int.Parse(ddlClubName.SelectedValue.ToString());
        string years = ddlYears.SelectedItem.Text.Trim().ToString();
       
        SearchGrid(clubId, years);
    }

    private void SearchGrid(int clubId, string years)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_BodMembers where district_no='3141' and DistrictClubID='" + clubId + "' and year='" + years + "' ";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtName.Text = "";
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "No records to display.";
            RadGrid1.Visible = false;
        }
    }

    protected void rbtnSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        

        if(rbtnSort.SelectedValue=="0")
        {
            rbtnSort.SelectedIndex = 0;
            ddlYears.Visible = false;
            ddlClubName.Visible = false;
            BindGrid();
        }
        else
        {
            rbtnSort.SelectedIndex = 1;
            ddlYears.Visible = true;
            ddlClubName.Visible = true;
        }
    }

    protected void ddlClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        RadGrid1.Visible = false;
        ddlYears.SelectedIndex = 0;
        rbtnSort.SelectedIndex = 1;
    }
}
