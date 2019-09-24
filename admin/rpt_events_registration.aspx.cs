using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class admin_rpt_events_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            btnExporttoExcel.Visible = false;
            rbtnType.Visible = false;
            rbtnType.SelectedIndex = 0; 
            lblMsg.Visible = false;

           // BindGrid("All");
        }
        
    }

    private void ExportGridView()
    {
        string attachment = "attachment; filename=Event_Reg_Report.xls";

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
    //protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    //{

    //    Label lblDOB = (Label)e.Row.FindControl("lblDOB");
    //    if (lblDOB != null)
    //    {
    //        try
    //        {
    //            if (lblDOB.Text != "")
    //            {
    //                string[] dob = lblDOB.Text.ToString().Split('/');
    //                lblDOB.Text = dob[0] + ", " + dob[1];
    //            }
    //        }
    //        catch { }
    //    }
    //}
    protected void pe_SelectedIndexChanged(object sender, EventArgs e)
    {
        int eventId = int.Parse(DDLEventName.SelectedValue.ToString());
        string paymentType = rbtnType.SelectedValue.Trim();

        if (paymentType == "0")
        {
            BindGrid(eventId,"All");
        }        

        if (paymentType == "1")
        {
            BindGrid(eventId,"Received");
        }

        if (paymentType == "2")
        {
            BindGrid(eventId,"Pending");
        }

        if (paymentType == "3")
        {
            BindGrid(eventId,"Cheque");
        }

        if (paymentType == "4")
        {
            BindGrid(eventId, "Cash");
        }

        if (paymentType == "5")
        {
            BindGrid(eventId,"Invitee");
        }

        if (paymentType == "6")
        {
            BindGrid(eventId,"Co-Host");
        }       
       
    }

    private void BindGrid(int eventId, string type)
    {      

        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        if (type == "All")
        {
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY fname asc) AS Sr, fname +' '+lname as Name,* from dist_event_reg_form_tbl where event_id='" + eventId + "'";
        }

        else if (type == "Cheque" || type == "Cash")
        {
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY fname asc) AS Sr, fname +' '+lname as Name,* from dist_event_reg_form_tbl where event_id='" + eventId + "' and payment_type='" + type + "' ";
        }
        else
        {
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY fname asc) AS Sr, fname +' '+lname as Name,* from dist_event_reg_form_tbl where event_id='" + eventId + "' and payment_status='" + type + "' ";
        }

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            rbtnType.Visible = true;
            btnExporttoExcel.Visible = true;
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            //rbtnType.Visible = false;
            btnExporttoExcel.Visible = false;
            GridView1.Visible = false;
        }

    }

    protected void DDLEventName_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            btnExporttoExcel.Visible = false;
            rbtnType.Visible = false;
            rbtnType.SelectedIndex = 0;
            lblMsg.Visible = false;

            int eventId = int.Parse(DDLEventName.SelectedValue.ToString());
            BindGrid(eventId, "All");
        }
        catch { }
    }
}

