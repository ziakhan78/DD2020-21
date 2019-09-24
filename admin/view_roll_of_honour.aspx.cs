using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_view_roll_of_honour : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DDLClubName.Visible = false;
            //txtName.Visible = true;
            //btnSearch.Visible = true;

            DDLClubName.Visible = true;
            //txtName.Visible = false;
            //btnSearch.Visible = false;
            rbtnSearch.SelectedIndex = 2;

            DDLClubName.DataSourceID = "DSDistClubNo";
            DDLClubName.DataBind();
            

            bool b;
            if (b = true)
            {
                Session["searchField"] = null;
                Session["name"] = null;
                Session["value"] = null;
                b = false;
            }

            ManageGrid();
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
        txtName.Text = "";
        rbtnSearch.ClearSelection();

        Session["name"] = name;
        Session["searchField"] = null;
        Session["value"] = null;

       // DDLClubName.Visible = false;
        txtName.Visible = true;
        btnSearch.Visible = true;

        // int clubid = int.Parse(Session["DistrictClubID"].ToString()); 
        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_SearchByAlphabet_roll_honour";
        obj.AddParam("@f_name", name);
        obj.AddParam("@DistrictClubID", clubid);

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

        try
        {
            int i = int.Parse(rbtnSearch.SelectedValue.ToString());

            if (txtName.Text == "")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Please Enter Text For Search";
                RadGrid1.Visible = false;
            }
            else
            {
                Session["name"] = null;
                string searchField = "";

                if (i == 0)
                {
                    searchField = "president";
                }
                if (i == 1)
                {
                    searchField = "secretary";
                }

                string val = txtName.Text.Trim().ToString();
                Session["searchField"] = searchField.ToString();
                Session["value"] = val;
                SearchGrid(searchField, val);
            }
        }
        catch
        {
            lblMsg.Visible = true;
            lblMsg.Text = "Please Select Any Option For Search";
            RadGrid1.Visible = false;
        }
    }
    private void SearchGrid(string searchField, string pname)
    {
        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "Select ROW_NUMBER () OVER ( ORDER BY years asc ) AS RowNumber,* from roll_of_honour_tbl where DistrictClubID='" + clubid + "' and  " + searchField + " like  '%'+'" + pname + "'+ '%' ";
        //obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY years asc ) AS RowNumber,* from roll_of_honour_tbl where  " + searchField + " like  '%'+'" + pname + "'+ '%' ";
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

            else
            {
                try
                {
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

                    int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
                    BindGrid(clubid);

                    //BindGrid();
                }
                catch {
                    int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
                    BindGrid(clubid);                
                }
            }
        }
        catch { }
    }

    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "SELECT * FROM [roll_of_honour_tbl] where DistrictClubID='" + Session["DistrictClubID"].ToString() + "' order by id asc";
        obj.SetCommandQry = "SELECT * FROM [roll_of_honour_tbl] order by years desc, president asc";
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

    private void BindGrid(int clubid)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "SELECT * FROM [roll_of_honour_tbl] where DistrictClubID='" + Session["DistrictClubID"].ToString() + "' order by id asc";
        obj.SetCommandQry = "SELECT * FROM [roll_of_honour_tbl] where DistrictClubID='" + clubid + "' order by years desc";
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

    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_DeleteRollofHonr";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                ManageGrid();
            }
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
    protected void rbtnSearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        string searchfor = rbtnSearch.SelectedValue.ToString();
        if (searchfor == "0")
        {
           // DDLClubName.Visible = false;
            txtName.Visible = true;
            btnSearch.Visible = true;
        }

        if (searchfor == "1")
        {
           // DDLClubName.Visible = false;
            txtName.Visible = true;
            btnSearch.Visible = true;
        }

        //if (searchfor == "2")
        //{
        //   // DDLClubName.SelectedIndex = 0;
        //    Session["searchField"] = "club";
        //    DDLClubName.Visible = true;
        //    txtName.Visible = false;
        //    btnSearch.Visible = false;
        //}
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtName.Text = "";
        rbtnSearch.ClearSelection();

        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        BindGrid(clubid);
    }
}
