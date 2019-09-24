using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_add_upcoming_bod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                DDLClubName.DataSourceID = "DSDistClubNo";
                DDLClubName.DataBind();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetUpcomingBOD(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

    }
    private void GetUpcomingBOD(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_upcoming_bod where id='" + id + "'";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            try
            {
                int clubid = int.Parse(dt.Rows[0]["DistrictClubID"].ToString());
                BindMembers(clubid);
                BindDesignations(clubid);

                DDLClubName.SelectedValue = clubid.ToString();
            }
            catch { }
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLDesignation.SelectedItem.Text = dt.Rows[0]["designation"].ToString();
            try
            {
                int desi_id = int.Parse(dt.Rows[0]["designation_id"].ToString());
                DDLDesignation.SelectedValue = desi_id.ToString();
            }
            catch { }

            try
            {
                int mem_id = int.Parse(dt.Rows[0]["member_id"].ToString());
                DDLMember.SelectedValue = mem_id.ToString();
            }
            catch { }

            DDLMember.SelectedItem.Text = dt.Rows[0]["title"].ToString() + " " + dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
        }
    }
    private void BindMembers(int clubid)
    {
        DBconnection obj = new DBconnection();
       // int distID = int.Parse(Session["DistrictClubID"].ToString());
        //obj.SetCommandQry = "select sr, (fname+' ' + lname) as name from member where Status='True' order by name asc";
        obj.SetCommandQry = "select MemberId, (fname+' ' + lname) as name from district3140_members_tbl where DistrictClubID='" + clubid + "' and Status='True' order by name asc";

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLMember.DataTextField = "name";
        DDLMember.DataValueField = "MemberId";

        DDLMember.DataSource = dt;
        DDLMember.DataBind();

        //DDLMember.Items.Insert(0, "Select");
    }
    private void BindDesignations(int clubid)
    {
        DBconnection obj = new DBconnection();

        obj.SetCommandSP = "z_GetBODdesignation";
        obj.AddParam("@DistrictClubID", clubid);

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLDesignation.DataTextField = "designation";
        DDLDesignation.DataValueField = "id";

        DDLDesignation.DataSource = dt;
        DDLDesignation.DataBind();

        // DDLDesignation.Items.Insert(0, "Select");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateUpcomingBOD(id);
            }
            else
            {
                AddUpcomingBOD();
            }           
        }
    }

    private void AddUpcomingBOD()
    {
        try
        {            
            //int distID = int.Parse(Session["DistrictClubID"].ToString());
            int distID = int.Parse(DDLClubName.SelectedValue.ToString());

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_AddUpcomingBOD";

            int memid = int.Parse(DDLMember.SelectedValue.ToString());
            string name = DDLMember.SelectedItem.Text.ToString();
            string[] nameA = name.Split(' ');
            obj.AddParam("@fname", nameA[0]);
            obj.AddParam("@lname", nameA[1]);
            obj.AddParam("@designation", DDLDesignation.SelectedItem.Text.ToString());
            obj.AddParam("@designation_id", int.Parse(DDLDesignation.SelectedValue.ToString()));
            obj.AddParam("@member_id", memid);
            obj.AddParam("@DistrictClubID", distID);
            obj.AddParam("@added_by", "Club");

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
    private void UpdateUpcomingBOD(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_UpdateUpcomingBOD";
            string name = DDLMember.SelectedItem.Text.Trim().ToString();
            
            string[] nameA = name.Split(' ');
            obj.AddParam("@id", id);           
            obj.AddParam("@fname", nameA[0]);
            obj.AddParam("@lname", nameA[1]);
            obj.AddParam("@designation", DDLDesignation.SelectedItem.Text.ToString());
            try
            {
                obj.AddParam("@designation_id", int.Parse(DDLDesignation.SelectedValue.ToString()));
            }
            catch { obj.AddParam("@designation_id", 0); }

            try
            {
                obj.AddParam("@member_id", int.Parse(DDLMember.SelectedValue.ToString()));
            }
            catch { obj.AddParam("@member_id", 0); }

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                //clear();
                //string jv = "<script>alert('Record Added Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                showmsg("Record Updated Successfully", "view_upcoming_bod.aspx");
            }
        }
        catch { }
    }
    private void clear()
    {
        DDLClubName.SelectedIndex = 0;
        DDLMember.SelectedIndex = 0;
        DDLDesignation.SelectedIndex = 0;
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
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        if (clubid != null)
        {
            BindMembers(clubid);
            BindDesignations(clubid);
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int memId = int.Parse(DDLMember.SelectedValue.ToString());
        string desig = DDLDesignation.SelectedItem.ToString();

        //int distID = int.Parse(Session["DistrictClubID"].ToString());
        int distID = int.Parse(DDLClubName.SelectedValue.ToString());

        if (Request.QueryString["id"] != null)
        {
            CustomValidator1.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select * from View_upcoming_bod where DistrictClubId='" + distID + "' and member_Id='" + memId + "' and designation='" + desig + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
                    args.IsValid = false;
                else
                    args.IsValid = true;
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }
}