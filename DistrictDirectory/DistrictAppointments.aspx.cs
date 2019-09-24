using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DistrictDirectory_DistrictAppointments : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            BindYears(1920);

            if (!IsPostBack)
            {                
                DDLMember.Items.Insert(0, "Select");
               // DDLAvenue.Items.Insert(0, "Select");
              

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetPositionHeld(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void BindMembers(int clubId)
    {
        DBconnection obj = new DBconnection();
        //int distID = int.Parse(DDLClubName.SelectedValue.ToString());
        //obj.SetCommandQry = "select sr, (fname+' ' + lname) as name from member where Status='True' order by name asc";
        obj.SetCommandQry = "select MemberId, (fname+' ' + lname) as name from ViewMembers where DistrictClubID='" + clubId + "' and Status='True' order by name asc";

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLMember.DataTextField = "name";
        DDLMember.DataValueField = "MemberId";

        DDLMember.DataSource = dt;
        DDLMember.DataBind();

        DDLMember.Items.Insert(0, "Select");

    }
    private void GetDistAvenue(string year)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='" + year + "' ORDER BY [designation] ";

        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLAvenue.Items.Clear();
            DDLAvenue.DataTextField = "designation";
            DDLAvenue.DataValueField = "id";
            DDLAvenue.DataSource = dt;
            DDLAvenue.DataBind();
            DDLAvenue.Items.Insert(0, "Select");
        }

        else
        {
            DDLAvenue.Items.Clear();
            DDLAvenue.Items.Insert(0, "Select");
        }
    }
    private void GetDistDesignation(int avenueId)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_SubDesignations] where desig_id='" + avenueId + "' ORDER BY [sub_designation] ";

        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLPosition.Items.Clear();
            DDLPosition.DataTextField = "sub_designation";
            DDLPosition.DataValueField = "id";
            DDLPosition.DataSource = dt;
            DDLPosition.DataBind();
            DDLPosition.Items.Insert(0, "Select");
        }

        else
        {
            DDLPosition.Items.Clear();
            DDLPosition.Items.Insert(0, "Select");
        }
    }
    private void BindYears(int year)
    {
       
        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt); i >= 1920; i--)
            {
                string dtt = i + " - " + (i + 1);              
                DDLPHYear.Items.Add(dtt.ToString());
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetPositionHeld(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetPositionHeld";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.DataSourceID = "DSDistClubName";
            DDLClubName.DataBind();

            int clubId = int.Parse(dt.Rows[0]["club_id"].ToString());
            BindMembers(clubId);           

            DDLClubName.SelectedValue = dt.Rows[0]["club_id"].ToString();
            DDLMember.SelectedValue = dt.Rows[0]["member_id"].ToString();           
            DDLPHYear.SelectedItem.Text = dt.Rows[0]["years"].ToString();
            DDLPHeld.SelectedValue = dt.Rows[0]["position_held_on"].ToString();

            GetDistAvenue(DDLPHYear.SelectedItem.Text.Trim());
            DDLAvenue.SelectedItem.Text = dt.Rows[0]["avenue"].ToString();
          //  GetDistDesignation(int.Parse(DDLAvenue.SelectedValue.ToString()));
           
            DDLPosition.SelectedItem.Text = dt.Rows[0]["position"].ToString();
        }
    }
    private void AddPositionHeld()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddPositionHeld";
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@member_id", int.Parse(DDLMember.SelectedValue.ToString()));
            obj.AddParam("@years", DDLPHYear.SelectedItem.Text.Trim());
            obj.AddParam("@position_held_on", DDLPHeld.SelectedItem.Text.Trim());
            obj.AddParam("@avenue", DDLAvenue.SelectedItem.Text.ToString().Trim());
            obj.AddParam("@position", DDLPosition.SelectedItem.Text.ToString().Trim());

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
    private void UpdatePositionHeld(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdatePositionHeld";

            obj.AddParam("@id", id);
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@member_id", int.Parse(DDLMember.SelectedValue.ToString()));
            obj.AddParam("@years", DDLPHYear.SelectedItem.Text.Trim());
            obj.AddParam("@position_held_on", DDLPHeld.SelectedItem.Text.Trim());
            obj.AddParam("@avenue", DDLAvenue.SelectedItem.Text.ToString().Trim());
            obj.AddParam("@position", DDLPosition.SelectedItem.Text.ToString().Trim());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_dist_appointment.aspx");
            }
        }
        catch { }
    }
    private void clear()
    {
        DDLClubName.SelectedIndex = 0;  
        DDLPHYear.SelectedIndex = 0;
        DDLMember.SelectedIndex = 0;
        DDLAvenue.SelectedIndex = 0;
        DDLPosition.SelectedIndex = 0;
        DDLPHeld.SelectedIndex = 0;
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
        int clubId= int.Parse(DDLClubName.SelectedValue.ToString());
        BindMembers(clubId);
        //BindAwards(clubId);
    }
    protected void btnAward_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdatePositionHeld(id);
            }
            else
            {
                AddPositionHeld();
            }
        }
    }
    protected void DDLAvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        int avenueId = int.Parse(DDLAvenue.SelectedValue.ToString());
        GetDistDesignation(avenueId);
    }
    protected void DDLPHeld_SelectedIndexChanged(object sender, EventArgs e)
    {
       // DDLPHYear.SelectedIndex = 0;
        DDLPosition.Items.Clear();
        DDLPosition.Items.Insert(0, "Select");
        // DDLPosition.SelectedIndex = 0;
        string strP = DDLPHeld.SelectedItem.Text.Trim().ToString();
       // if (strP == "RI")
            //GetRiDesignation();
       // if (strP == "Club")
            //GetClubDesignation(int.Parse(DDLClubName.SelectedValue.ToString()));
    }
    protected void DDLPHYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strYr = DDLPHYear.SelectedItem.Text.Trim();

        string phin = DDLPHeld.SelectedItem.Text.Trim();
        //if (phin == "Club")
        //{
        //    GetClubDesignation(int.Parse(DDLClubName.SelectedValue.ToString()));
        //}
        if (phin == "District")
        {
            GetDistAvenue(DDLPHYear.SelectedItem.Text.Trim());
        }
        //if (phin == "RI")
        //{
        //    GetRiDesignation();
        //}

    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CustomValidator1.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select position from positions_held_tbl where position='" + DDLPosition.SelectedItem.Text.Trim().ToString() + "' and member_id='" + DDLMember.SelectedValue.ToString() + "' ";
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
