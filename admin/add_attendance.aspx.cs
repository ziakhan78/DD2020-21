using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_attendance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindMonth();
                BindYears();
               // dateCancelledMtng1.SelectedDate = DateTime.Parse(DateTime.Now.ToString("dd MM yy").ToString());

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetAttendance(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

    }

    private void BindYears()
    {
        try
        {
            for (Int32 i = 2012; i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                string dt = i + " - " + (i + 1);
                DDLYear.Items.Add(dt.ToString());

            }
            //DDLYear.Items.Insert(0, "Year");


        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void BindMonth()
    {
        try
        {
            for (int i = 1; i <= 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, i, 1).ToString("MMMM");
                item.Value = i.ToString();
                DDLMonth.Items.Add(item);
            }

            DDLMonth.Items.Insert(0, DateTime.Now.ToString("MMMM"));            
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }

    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            int id = int.Parse(DDLClubName.SelectedValue.ToString());
            GetClubDetails(id);
            GetMembers(id);
            GetPresident(id);
            GetNoOfMembers(id);
        }
        catch
        {
        }
    }

    private void GetAttendance(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetClubAttendance";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["club_id"].ToString();

            DDLMonth.SelectedItem.Text = dt.Rows[0]["month"].ToString();
            

            txtMemStrength.Text = dt.Rows[0]["Membership_Strength"].ToString();
            txtMeetingHeld.Text = dt.Rows[0]["No_of_Meetings_Held"].ToString();
            txtAvgAttendance.Text = dt.Rows[0]["Average_Attendance"].ToString();
            txtMeetingCancelled.Text = dt.Rows[0]["No_of_Meetings_Cancelled"].ToString();
            try
            {
                dateCancelledMtng1.SelectedDate = DateTime.Parse(dt.Rows[0]["Canceled_Meeting_Date_1"].ToString());
            }
            catch { }

            txtCancelledMtngRes1.Text = dt.Rows[0]["Reason_for_Cancelled_1"].ToString();
            try
            {
                dateCancelledMtng2.SelectedDate = DateTime.Parse(dt.Rows[0]["Canceled_Meeting_Date_2"].ToString());
            }
            catch { }
            txtCancelledMtngRes2.Text = dt.Rows[0]["Reason_for_Cancelled_2"].ToString();

            lblPresiName.Text = dt.Rows[0]["President"].ToString();
            lblSecName.Text = dt.Rows[0]["Secretary"].ToString();
            lblDS.Text = dt.Rows[0]["ds"].ToString();
            lblAG.Text = dt.Rows[0]["ag"].ToString();
            lblGC.Text = dt.Rows[0]["gc"].ToString();
        }
    }

    private void GetClubDetails(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetDistrictClubDetails";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        { 
            lblDS.Text = dt.Rows[0]["ds"].ToString();
            lblAG.Text = dt.Rows[0]["ag"].ToString();
            lblGC.Text = dt.Rows[0]["gc"].ToString();
            txtMemStrength.Text = dt.Rows[0]["no_of_members"].ToString();
        }
    }

    private void GetMembers(int clubid)
    {
        DBconnection obj = new DBconnection();

        // obj.SetCommandQry = "select * from View_BOD_Members where  DistrictClubID='76' and designation='President' or designation='President Elect' or designation='Secretary'";
        obj.SetCommandQry = "select * from View_BOD_Members where  DistrictClubID='" + clubid + "' and (designation='President Elect' or designation='Secretary')";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                try
                {
                    string desig = dt.Rows[i]["designation"].ToString();

                    if (desig == "Secretary")
                    {
                        lblSecName.Text = dt.Rows[i]["FName"].ToString() + " " + dt.Rows[i]["LName"].ToString();
                    }

                    if (desig == "President Elect")
                    {
                        lblPresiElectName.Text = dt.Rows[i]["FName"].ToString() + " " + dt.Rows[i]["LName"].ToString();
                    }
                }
                catch
                {
                }
            }
        }
    }

    private void GetPresident(int clubid)
    {
        DBconnection obj = new DBconnection();       

        obj.SetCommandQry = "select * from ViewMembers where  DistrictClubID='" + clubid + "' and designation='President'";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            try
            {
                lblPresiName.Text = dt.Rows[0]["FName"].ToString() + " " + dt.Rows[0]["LName"].ToString();
                //lblPresiEmail.Text = dt.Rows[0]["EmailId"].ToString();
            }
            catch
            {
            }
        }
    }

    private void GetNoOfMembers(int clubid)
    {
        DBconnection obj = new DBconnection();

        obj.SetCommandQry = "select count(*) as noofmembers from ViewMembers where  DistrictClubID='" + clubid + "' and status='True'";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            try
            {
                txtMemStrength.Text = dt.Rows[0]["noofmembers"].ToString();               
            }
            catch
            {
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateAttendance(id);
            }
            else
            {
                AddAttendance();
            }
        }
    }

    private void AddAttendance()
    {
        DateTime? dt1, dt2;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddClubAttendance";

            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString())); 

            obj.AddParam("@month", DDLMonth.SelectedItem.Text.ToString());
            obj.AddParam("@President", lblPresiName.Text.ToString());
            obj.AddParam("@Secretary", lblSecName.Text.Trim().ToString());
            obj.AddParam("@Membership_Strength", txtMemStrength.Text.Trim());
            obj.AddParam("@Average_Attendance", txtAvgAttendance.Text.Trim());

            obj.AddParam("@No_of_Meetings_Held", txtMeetingHeld.Text.Trim());
            obj.AddParam("@No_of_Meetings_Cancelled", txtMeetingCancelled.Text.Trim());
            try
            {
                dt1 = DateTime.Parse(dateCancelledMtng1.SelectedDate.ToString());
                obj.AddParam("@Canceled_Meeting_Date_1", dt1);
            }
            catch
            {               
                obj.AddParam("@Canceled_Meeting_Date_1", "");
            }
            obj.AddParam("@Reason_for_Cancelled_1", txtCancelledMtngRes1.Text.Trim());

            try
            {
                dt2 = DateTime.Parse(dateCancelledMtng2.SelectedDate.ToString());
                obj.AddParam("@Canceled_Meeting_Date_2", dt2);
            }
            catch
            {               
                obj.AddParam("@Canceled_Meeting_Date_2", "");
            }

            obj.AddParam("@Reason_for_Cancelled_2", txtCancelledMtngRes2.Text.Trim());

            obj.AddParam("@ds", lblDS.Text.ToString());
            obj.AddParam("@ag", lblAG.Text.ToString());
            obj.AddParam("@gc", lblGC.Text.ToString()); 

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch
        {
        }
    }

    private void UpdateAttendance(int id)
    {
        DateTime? dt1, dt2;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateClubAttendance";

            obj.AddParam("@id", id);
            obj.AddParam("@club_id", int.Parse(DDLClubName.SelectedValue.ToString()));

            obj.AddParam("@month", DDLMonth.SelectedItem.Text.ToString());
            obj.AddParam("@President", lblPresiName.Text.ToString());
            obj.AddParam("@Secretary", lblSecName.Text.Trim().ToString());
            obj.AddParam("@Membership_Strength", txtMemStrength.Text.Trim());
            obj.AddParam("@Average_Attendance", txtAvgAttendance.Text.Trim());

            obj.AddParam("@No_of_Meetings_Held", txtMeetingHeld.Text.Trim());
            obj.AddParam("@No_of_Meetings_Cancelled", txtMeetingCancelled.Text.Trim());
            try
            {
                dt1 = DateTime.Parse(dateCancelledMtng1.SelectedDate.ToString());
                obj.AddParam("@Canceled_Meeting_Date_1", dt1);
            }
            catch
            {
                obj.AddParam("@Canceled_Meeting_Date_1", "");
            }
            obj.AddParam("@Reason_for_Cancelled_1", txtCancelledMtngRes1.Text.Trim());

            try
            {
                dt2 = DateTime.Parse(dateCancelledMtng2.SelectedDate.ToString());
                obj.AddParam("@Canceled_Meeting_Date_2", dt2);
            }
            catch
            {
                obj.AddParam("@Canceled_Meeting_Date_2", "");
            }

            obj.AddParam("@Reason_for_Cancelled_2", txtCancelledMtngRes2.Text.Trim());

            obj.AddParam("@ds", lblDS.Text.ToString());
            obj.AddParam("@ag", lblAG.Text.ToString());
            obj.AddParam("@gc", lblGC.Text.ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
               // Clear();
                string jv = "<script>alert('Record has been updated successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch
        {
        }
    }

    private void Clear()
    {
        txtAvgAttendance.Text = "";
        txtCancelledMtngRes1.Text = "";
        txtCancelledMtngRes2.Text = "";
        txtMeetingCancelled.Text = "";
        txtMeetingHeld.Text = "";
        txtMemStrength.Text = "";
       
        DDLClubName.SelectedIndex = 0;
        DDLMonth.ClearSelection();

        dateCancelledMtng1.Clear();
        dateCancelledMtng2.Clear();
       
        lblAG.Text = "";
        lblDS.Text = "";
        lblGC.Text = "";
        lblPresiEmail.Text = "";
        lblPresiName.Text = "";
        lblSecEmail.Text = "";
        lblSecName.Text = "";
    }

    protected void CVAttendance_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVAttendance.Enabled = false;
        }
        else
        {
            try
            {
                string month = DDLMonth.SelectedItem.ToString();
                //int clubid = int.Parse(Session["DistrictClubID"].ToString());
                int clubid = int.Parse(DDLClubName.SelectedValue.ToString());

                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select * from clubs_attendance_tbl where club_id='" + clubid + "' and month='" + month + "' ";
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