using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_add_roll_of_honour : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                trPresi.Visible = false;
                trSec.Visible = false;
                //BindMembers();
                //BindYears();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetRollHonour(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }       
    }
    private void BindMembers(int distID)
    {
        DBconnection obj = new DBconnection();
        //int distID = int.Parse(Session["DistrictClubID"].ToString());
        //obj.SetCommandQry = "select sr, (fname+' ' + lname) as name from member where Status='True' order by name asc";
        obj.SetCommandQry = "select MemberId, (fname+' ' + lname) as name from district3140_members_tbl where DistrictClubID='" + distID + "' and Status='True' order by name asc";
        
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLMember.DataTextField = "name";
        DDLMember.DataValueField = "MemberId";

        DDLMember.DataSource = dt;
        DDLMember.DataBind();

       // DDLMember.Items.Insert(0, "Select");


        DDLMember0.DataTextField = "name";
        DDLMember0.DataValueField = "MemberId";

        DDLMember0.DataSource = dt;
        DDLMember0.DataBind();

        //DDLMember0.Items.Insert(0, "Select");

    }
    //private void BindYears()
    //{
    //    try
    //    {
    //        for (Int32 i = 1992; i <= Convert.ToInt32(DateTime.Now.Year); i++)
    //        {
    //            string dt = i + " - " + (i + 1);
    //            DDLYear.Items.Add(dt.ToString());              

    //        }
    //        DDLYear.Items.Insert(0, "Year");
         

    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}
    private void GetRollHonour(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetRollHonour";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.DataSourceID = "DSDistClubNo";
            DDLClubName.DataBind();

            DDLClubName.SelectedItem.Text = dt.Rows[0]["clubname"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubID"].ToString();

            DDLYear.SelectedItem.Text = dt.Rows[0]["years"].ToString();
            DDLMember.SelectedItem.Text = dt.Rows[0]["president"].ToString();
            DDLMember0.SelectedItem.Text = dt.Rows[0]["secretary"].ToString();           
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateRollHonour(id);
            }
            else
            {
                AddRollHonour();
            }
        }
    }

    private void AddRollHonour()
    {
        try
        {

           // int distID = int.Parse(Session["DistrictClubID"].ToString());
            int distID = int.Parse(DDLClubName.SelectedValue.ToString());

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddRollHonour";
            obj.AddParam("@years", DDLYear.SelectedItem.Text.Trim());            
            if (DDLMember.SelectedItem.Text == "Select" && chkIfOther.Checked == true)
            {
                trPresi.Visible = true;
                obj.AddParam("@president", txtPresidOther.Text.Trim());
            }
            else
            {
                obj.AddParam("@president", DDLMember.SelectedItem.Text.Trim());
            }


            if (DDLMember0.SelectedItem.Text == "Select" && chkIfOtherSec.Checked == true)
            {
                trSec.Visible = true;
                obj.AddParam("@secretary", txtOtherSec.Text.Trim());
            }
            else
            {
                obj.AddParam("@secretary", DDLMember0.SelectedItem.Text.Trim());
            }

            obj.AddParam("@DistrictClubID", distID);

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateRollHonour(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateRollHonour";

            obj.AddParam("@id", id);
            obj.AddParam("@years", DDLYear.SelectedItem.Text.Trim());
            //obj.AddParam("@president", DDLMember.SelectedItem.Text.Trim());
            //obj.AddParam("@secretary", DDLMember0.SelectedItem.Text.Trim()); 

            if (DDLMember.SelectedItem.Text == "Select" && chkIfOther.Checked == true)
            {
                trPresi.Visible = true;
                obj.AddParam("@president", txtPresidOther.Text.Trim());
            }
            else
            {
                obj.AddParam("@president", DDLMember.SelectedItem.Text.Trim());
            }


            if (DDLMember0.SelectedItem.Text == "Select" && chkIfOtherSec.Checked == true)
            {
                trSec.Visible = true;
                obj.AddParam("@secretary", txtOtherSec.Text.Trim());
            }
            else
            {
                obj.AddParam("@secretary", DDLMember0.SelectedItem.Text.Trim());
            }

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_roll_of_honour.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        trPresi.Visible = false;
        trSec.Visible = false;
        chkIfOtherSec.Checked = false;
        chkIfOther.Checked = false;
        DDLYear.ClearSelection();
        DDLMember.ClearSelection();
        DDLMember0.ClearSelection();
        DDLClubName.ClearSelection();

    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
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
    protected void chkIfOther_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIfOther.Checked == true)
        {
            trPresi.Visible = true;
        }
        else
        {
            trPresi.Visible = false;
        }
    }
    protected void chkIfOtherSec_CheckedChanged(object sender, EventArgs e)
    {
        if (chkIfOtherSec.Checked == true)
        {
            trSec.Visible = true;
        }
        else
        {
            trSec.Visible = false;
        }
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        if (clubid != null)
        {
            DDLYear.Items.Clear();       
            BindMembers(clubid);
            int yrs = GetCharterDate(clubid);
            BindYears(int.Parse(yrs.ToString()));
        }
    }
    private void BindYears(int yers)
    {
        try
        {
            for (Int32 i = yers; i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                string dt = i + " - " + (i + 1);
                DDLYear.Items.Add(dt.ToString());

            }
            DDLYear.Items.Insert(0, "Select");

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }

    private int GetCharterDate(int clubid)
    {
        int yrs = 0;
        DBconnection obj = new DBconnection();
        DateTime dtt = new DateTime();
        obj.SetCommandQry = "select charter_date from clubs_tbl where id='" + clubid + "'";
        //obj.AddParam("@id", award_id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            string ch_dt = dt.Rows[0]["charter_date"].ToString();            
            dtt = DateTime.Parse(ch_dt.ToString());
            yrs = int.Parse(dtt.Year.ToString());
            
        }
        return yrs;
    }
}
