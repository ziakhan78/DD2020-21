using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_phsm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetPHSM(id);
            }
        }
    }

    private void GetPHSM(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetPHSM";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubID"].ToString();
            drtitle.SelectedItem.Text = dt.Rows[0]["title"].ToString();
            txtfname.Text = dt.Rows[0]["fname"].ToString();
            txtmname.Text = dt.Rows[0]["mname"].ToString();
            txtlname.Text = dt.Rows[0]["lname"].ToString();           

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdatePHSM(id);
            }
            else
            {
                AddPHSM();
            }
        }
    }
    private void AddPHSM()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddPHSM";            
            obj.AddParam("@title", drtitle.SelectedItem.Text.ToString());
            obj.AddParam("@fname", txtfname.Text.ToString());
            obj.AddParam("@mname", txtmname.Text.ToString());
            obj.AddParam("@lname", txtlname.Text.ToString());
            obj.AddParam("@DistrictClubID", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdatePHSM(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdatePHSM";
            obj.AddParam("@id", id);
           
            obj.AddParam("@title", drtitle.SelectedItem.Text.ToString());
            obj.AddParam("@fname", txtfname.Text.ToString());
            obj.AddParam("@mname", txtmname.Text.ToString());
            obj.AddParam("@lname", txtlname.Text.ToString());
            obj.AddParam("@DistrictClubID", int.Parse(DDLClubName.SelectedValue.ToString()));
            obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.ToString());

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                //string jv = "<script>alert('Record Has Been Updated Successfully');</script>";
                //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
                showmsg("Record Has Been Updated Successfully", "view_phsm.aspx");
            }
        }
        catch { }
    }
    private void clear()
    {
        txtfname.Text = "";
        txtmname.Text = "";
        txtlname.Text = "";       
        DDLClubName.SelectedIndex = 0;
        drtitle.SelectedIndex = 0;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void CVClubname_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CV.Enabled = false;
        }
        else
        {

            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select club_name from phsm_tbl where fname='" + txtfname.Text.Trim().ToString() + "' and lname='" + txtlname.Text.Trim().ToString() + "' and club_name='" + DDLClubName.SelectedItem.Text.Trim().ToString() + "'";
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
}