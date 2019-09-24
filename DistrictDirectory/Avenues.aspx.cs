using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class DistrictDirectory_Avenues : System.Web.UI.Page
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
                    GetDesignation(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    //private void BindYears()
    //{
    //    try
    //    {
    //        for (Int32 i = Convert.ToInt32(DateTime.Now.Year - 1); i >= 2005; i--)
    //        {
    //            string dt = i + " - " + (i + 1);
    //            DDLYears.Items.Add(dt.ToString());
    //        }
    //        int month = DateTime.Now.Month;
    //        if (month > 6)
    //        {
    //            string currentyears = Convert.ToInt32(DateTime.Now.Year).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 1).ToString();
    //            DDLYears.Items.Insert(0, currentyears);
    //        }

    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}

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
            string nextyears = Convert.ToInt32(DateTime.Now.Year+1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 2).ToString();
            //DDLYears.Items.Insert(0, "Select");
            DDLYears.Items.Insert(1, nextyears);
            DDLYears.Items.Insert(2, currentyears);

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }

    private void GetDesignation(int id)
    {
        DistrictDesignations desig = new DistrictDesignations();
        desig.Id = id;
        DataTable dt = new DataTable();
        dt = desig.GetDesignation();
        if (dt.Rows.Count > 0)
        {
            DDLYears.SelectedItem.Text = dt.Rows[0]["years"].ToString();
            txtDesig.Text = dt.Rows[0]["designation"].ToString();           
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDistDesignation(id);
            }
            else
            {
                AddDistDesignation();
            }
        }
    }

    private void AddDistDesignation()
    {
        try
        {
            DistrictDesignations desig = new DistrictDesignations();
            desig.Years= DDLYears.SelectedItem.Text.Trim().ToString();
            desig.Designation= txtDesig.Text.Trim().ToString();
            int exe = desig.AddDesignation();

            //DBconnection obj = new DBconnection();
            //obj.SetCommandSP = "z_AddDisttDesignation";
            //obj.AddParam("@years", DDLYears.SelectedItem.Text.Trim().ToString());
            //obj.AddParam("@designation", txtDesig.Text.Trim().ToString());
            //int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateDistDesignation(int id)
    {
        try
        {
            //DBconnection obj = new DBconnection();
            //obj.SetCommandSP = "z_UpdateDisttDesignation";
            //obj.AddParam("@id", id);
            //obj.AddParam("@years", DDLYears.SelectedItem.Text.Trim().ToString());
            //obj.AddParam("@designation", txtDesig.Text.Trim().ToString());
            //int exe = obj.ExecuteNonQuery();

            DistrictDesignations desig = new DistrictDesignations();
            desig.Id = id;
            desig.Years = DDLYears.SelectedItem.Text.Trim().ToString();
            desig.Designation = txtDesig.Text.Trim().ToString();
            int exe = desig.UpdateDesignation();
           
            if (exe > 0)
            {
                clear();
                showmsg("Record has been updated successfully !", "view_distt_designations.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        txtDesig.Text = "";
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
                obj.SetCommandQry = "select designation from distt_designation_tbl where designation='" + txtDesig.Text.Trim().ToString() + "' and years='" + DDLYears.SelectedItem.Text.Trim().ToString() + "' ";
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