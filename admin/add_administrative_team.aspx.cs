using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_administrative_team : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            { 
                BindYears();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetAdminTeam(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }
    }
    private void BindYears()
    {
        try
        {
            for (Int32 i = Convert.ToInt32(DateTime.Now.Year); i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                string dt = i + " - " + (i + 1);
                DDLYears.Items.Add(dt.ToString());
            }
            //DDLYears.Items.Insert(0, "Year");
            string currentyears = Convert.ToInt32(DateTime.Now.Year - 1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year).ToString();
            DDLYears.Items.Insert(0, currentyears);

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetAdminTeam(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetAdminTeam";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLYears.SelectedItem.Text = dt.Rows[0]["years"].ToString();
            DDLMemName.SelectedItem.Text = dt.Rows[0]["Name"].ToString();
            DDLDesig.SelectedItem.Text = dt.Rows[0]["designation"].ToString();

        }
    }   
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateAdminTeam(id);
            }
            else
            {
                AddAdminTeam();
            }
        }
    }
    private void AddAdminTeam()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddAdminTeam";

            obj.AddParam("@Member_id", int.Parse(DDLMemName.SelectedValue.ToString()));
            obj.AddParam("@DistDesigID", int.Parse(DDLDesig.SelectedValue.ToString()));
            obj.AddParam("@years", DDLYears.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateAdminTeam(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateAdminTeam";

            obj.AddParam("@id", id);
            obj.AddParam("@Member_id", int.Parse(DDLMemName.SelectedValue.ToString()));
            obj.AddParam("@DistDesigID", int.Parse(DDLDesig.SelectedValue.ToString()));
            obj.AddParam("@years", DDLYears.SelectedItem.Text.Trim().ToString());

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                Clear();
                showmsg("Record has been updated successfully !", "view_dist_officers.aspx");
            }
        }
        catch { }
    }

    private void Clear()
    {
        DDLYears.SelectedIndex = 0;
        DDLMemName.SelectedIndex = 0;
        DDLDesig.SelectedIndex = 0;
        lblClubName.Text = "";       
    }
    protected void DDLMemName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = int.Parse(DDLMemName.SelectedValue.ToString());//int.Parse(Request.QueryString["id"].ToString());
        GetProfile(id);
    }
    private void GetProfile(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetDistMemberforAdminTeams";
            obj.AddParam("@MemberId", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            { 
                lblClubName.Text = dt.Rows[0]["club_name"].ToString();
            }
        }
        catch { }
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
    protected void CVMember_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVMember.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select Member_id from administrative_teams_tbl where Member_id='" + int.Parse(DDLMemName.SelectedValue.ToString()) + "'";

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
