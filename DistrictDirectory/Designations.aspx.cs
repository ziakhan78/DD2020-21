using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DistrictDirectory_Designations : System.Web.UI.Page
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
                    GetSubDesignation(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    } 
    

    private void GetSubDesignation(int id)
    {
        DistrictDesignations desig = new DistrictDesignations();
        desig.Sub_desig_id = id;
        DataTable dt = new DataTable();
        dt = desig.GetSubDesignation();
        if (dt.Rows.Count > 0)
        {
           
            string years = dt.Rows[0]["years"].ToString();
            GetDistDesignation(years);

            DDLYears.SelectedItem.Text = years;

            DDLDesig.SelectedValue = dt.Rows[0]["desig_id"].ToString();
            txtSubDesig.Text = dt.Rows[0]["sub_designation"].ToString();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDistSubDesignation(id);
            }
            else
            {
                AddDistSubDesignation();
            }
        }
    }

    private void AddDistSubDesignation()
    {
        try
        {
            DistrictDesignations desig = new DistrictDesignations();
            desig.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            desig.Id = int.Parse(DDLDesig.SelectedValue.ToString());
            desig.Designation = DDLDesig.SelectedItem.Text.Trim().ToString();          
            desig.Sub_designation = txtSubDesig.Text.Trim().ToString();
            int exe = desig.AddSubDesignation();      

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateDistSubDesignation(int id)
    {
        try
        {
           
            DistrictDesignations desig = new DistrictDesignations();
            desig.Sub_desig_id = id;
            desig.Id = int.Parse(DDLDesig.SelectedValue.ToString());
            desig.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            desig.Sub_designation = txtSubDesig.Text.Trim().ToString();

            int exe = desig.UpdateSubDesignation();

            if (exe > 0)
            {
                clear();
                showmsg("Record has been updated successfully !", "view_distt_designations_sub.aspx");
            }
        }
        catch { throw; }
    }

    private void clear()
    {
        txtSubDesig.Text = "";
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

    private void BindYears()
    {
        try
        {
            for (Int32 i = Convert.ToInt32(DateTime.Now.Year - 1); i >= 1995; i--)
            {
                string dt = i + " - " + (i + 1);
                DDLYears.Items.Add(dt.ToString());
            }
            string currentyears = Convert.ToInt32(DateTime.Now.Year).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 1).ToString();
            string nextyears = Convert.ToInt32(DateTime.Now.Year + 1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 2).ToString();
            //DDLYears.Items.Insert(0, "Select");
            DDLYears.Items.Insert(1, nextyears);
            DDLYears.Items.Insert(2, currentyears);

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
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
                obj.SetCommandQry = "select sub_designation from distt_sub_designation_tbl where sub_designation='" + txtSubDesig.Text.Trim().ToString() + "' and years='" + DDLYears.SelectedItem.Text.Trim().ToString() + "' and desig_id='" + DDLDesig.SelectedValue.ToString() + "'  ";
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

    private void GetDistDesignation(string year)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='" + year + "' ORDER BY [designation] ";
        //obj.AddParam("@id", id);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLDesig.DataTextField = "designation";
            DDLDesig.DataValueField = "id";
            DDLDesig.DataSource = dt;
            DDLDesig.DataBind();
            DDLDesig.Items.Insert(0, "Select");
        }
    }
    protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        string years = DDLYears.SelectedItem.Text.Trim().ToString();
        DDLDesig.Items.Clear();
        GetDistDesignation(years);
    }
}