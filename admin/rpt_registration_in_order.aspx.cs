﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class admin_rpt_registration_in_order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid("All");
        }

        //if (Session["user"] != null)
        //{
        //}
        //else
        //{
        //    Session.Abandon();
        //    Response.Redirect("Default.aspx");
        //}
    }
    private void ExportGridView()
    {
        string attachment = "attachment; filename=Registration_In_Sequence_Order.xls";

        Response.ClearContent();

        Response.AddHeader("content-disposition", attachment);

        Response.ContentType = "application/ms-excel";

        StringWriter sw = new StringWriter();

        HtmlTextWriter htw = new HtmlTextWriter(sw);

        // Create a form to contain the grid

        HtmlForm frm = new HtmlForm();

        GridView1.Parent.Controls.Add(frm);

        frm.Attributes["runat"] = "server";

        frm.Controls.Add(GridView1);

        frm.RenderControl(htw);

        //GridView1.RenderControl(htw);

        Response.Write(sw.ToString());

        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
    }
    private void PrepareGridViewForExport(Control gv)
    {
        LinkButton lb = new LinkButton();

        Literal l = new Literal();

        string name = String.Empty;

        for (int i = 0; i < gv.Controls.Count; i++)
        {
            if (gv.Controls[i].GetType() == typeof(LinkButton))
            {
                l.Text = (gv.Controls[i] as LinkButton).Text;

                gv.Controls.Remove(gv.Controls[i]);

                gv.Controls.AddAt(i, l);
            }

            else if (gv.Controls[i].GetType() == typeof(DropDownList))
            {
                l.Text = (gv.Controls[i] as DropDownList).SelectedItem.Text;

                gv.Controls.Remove(gv.Controls[i]);

                gv.Controls.AddAt(i, l);
            }
            else if (gv.Controls[i].GetType() == typeof(CheckBox))
            {
                l.Text = (gv.Controls[i] as CheckBox).Checked ? "True" : "False";

                gv.Controls.Remove(gv.Controls[i]);

                gv.Controls.AddAt(i, l);
            }

            if (gv.Controls[i].HasControls())
            {
                PrepareGridViewForExport(gv.Controls[i]);
            }

        }

    }
    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
        PrepareGridViewForExport(GridView1);
        ExportGridView();
    }

    private void BindGrid(string type)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        if (type == "All")
        {
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY id asc) AS Sr, * from View_RegistrationForm";
        }
        if (type == "Boys")
        {
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY id asc) AS Sr, * from View_RegistrationForm where gender='Male' ";
        }

        if (type == "Girls")
            
        {           
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY Name asc) AS Sr, * from View_RegistrationForm where gender='Female' ";
        }

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            GridView1.Visible = false;
        }

    }
    protected void rbtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strType = rbtnType.SelectedItem.Text;
        BindGrid(strType);
    }
}

