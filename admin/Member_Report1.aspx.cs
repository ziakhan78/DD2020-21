using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.IO;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class admin_Member_Report1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindGrid();
                ddlMonth.Visible = false;
                PanelDate.Visible = false;
                monthsbind();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    private void BindGrid()
    {
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "select * from View_MemSpOcca";
        obj.SetCommandSP = "z_GetMemberReportByMonthOcca";
        DataTable dt = obj.ExecuteTable();

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    private void ExportGridView()
    {
        string attachment = "attachment; filename=RCBP_Members_Data.xls";

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
    private void monthsbind()
    {
        try
        {
            for (int i = 1; i <= 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, i, 1).ToString("MMMM");
                item.Value = i.ToString();
                ddlMonth.Items.Add(item);
            }
            //ddlMonth.Items.Insert(0, DateTime.Now.ToString("MMMM"));
            ddlMonth.Items.Insert(0, "Select Month");
        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    protected void btnSortdateSubmit_Click(object sender, EventArgs e)
    {

    }
    protected void rbtnSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        string ss = rbtnSort.SelectedValue;
        if (ss == "0")
        {
            BindGrid();
            ddlMonth.Visible = false;           
            PanelDate.Visible = false;
        }
        if (ss == "1")
        {
            ddlMonth.Visible = true; 
            PanelDate.Visible = false;
        }
        if (ss == "2")
        {
            ddlMonth.Visible = false; 
            PanelDate.Visible = true;
        }        
    }

    protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
    {
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "select * from View_MemSpOcca";
        obj.SetCommandSP = "z_GetMemberReportByMonth";
        obj.AddParam("@month", ddlMonth.SelectedItem.Text);
        DataTable dt = obj.ExecuteTable();

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}

