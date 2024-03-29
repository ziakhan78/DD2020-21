﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_abbreviation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetAbbreviation(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetAbbreviation(int award_id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetAbbreviation";
        obj.AddParam("@id", award_id);
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            txtAbbri.Text = dt.Rows[0]["abbreviation"].ToString();          
            txtFullForm.Text = dt.Rows[0]["full_form"].ToString();
           
        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateAbbreviation(id);
            }
            else
            {
                AddAbbreviation();
            }
        }
    }

    private void AddAbbreviation()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddAbbreviation";
            obj.AddParam("@abbreviation", txtAbbri.Text.Trim().ToString());
            obj.AddParam("@full_form", txtFullForm.Text.Trim().ToString());
            
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

    private void UpdateAbbreviation(int award_id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateAbbreviation";

            obj.AddParam("@id", award_id);
            obj.AddParam("@abbreviation", txtAbbri.Text.Trim().ToString());
            obj.AddParam("@full_form", txtFullForm.Text.Trim().ToString());
            

            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record updated successfully !", "view_abbreviations.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        txtAbbri.Text = "";        
        txtFullForm.Text = "";
        
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
            obj.SetCommandQry = "select abbreviation from abbreviations_tbl where abbreviation='" + txtAbbri.Text.Trim().ToString() + "'";
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
