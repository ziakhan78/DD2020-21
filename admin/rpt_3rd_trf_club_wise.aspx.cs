using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Data;

public partial class admin_rpt_3rd_trf_club_wise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid("All");
            DDLClubName.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = false;
            lblMsg.Visible = false;            
        }
    }

    private void ExportGridView()
    {
        string attachment = "attachment; filename=TRF_Seminar_Reg_Club_Wise_Report.xls";

        Response.ClearContent();

        Response.AddHeader("content-disposition", attachment);

        Response.ContentType = "application/ms-excel";

        StringWriter sw = new StringWriter();

        HtmlTextWriter htw = new HtmlTextWriter(sw);

        // Create a form to contain the grid

        HtmlForm frm = new HtmlForm();

        GridView1.Parent.Controls.Add(frm);

        frm.Attributes["runat"] = "server";


        string paymentType = rbtnType.SelectedValue.ToString();
        if (paymentType == "0")
        {
            frm.Controls.Add(GridView1);
        }

        if (paymentType == "1")
        {
            frm.Controls.Add(GridView2);
        }

        if (paymentType == "2")
        {
            frm.Controls.Add(GridView3);
        }


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
        string paymentType = rbtnType.SelectedValue.ToString();
        if (paymentType == "0")
        {
            PrepareGridViewForExport(GridView1);
            ExportGridView();
        }

        if (paymentType == "1")
        {
            PrepareGridViewForExport(GridView2);
            ExportGridView();
        }

        if (paymentType == "2")
        {
            PrepareGridViewForExport(GridView3);
            ExportGridView();
        }
       
    }

    protected void pe_SelectedIndexChanged(object sender, EventArgs e)
    {
        string paymentType = rbtnType.SelectedValue.ToString();       

        GridView1.Visible = false;
        GridView2.Visible = false;
        GridView3.Visible = false;

        DDLClubName.SelectedIndex = 0;

        if (paymentType == "0")
        {
            BindGrid("All");
            DDLClubName.Visible = false;
            GridView1.Visible = true;
            GridView2.Visible = false;
        }
        if (paymentType == "1")
        {
            DDLClubName.Visible = true;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }

        if (paymentType == "2")
        {
            DDLClubName.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = false;
            BindGrid3();
        }
    }

    private void BindGrid(string type)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        if (type == "All")
        {
            obj.SetCommandQry = "SELECT  ROW_NUMBER () OVER (ORDER BY maxnoofclub desc) AS Sr,club_name, * FROM  dbo.View_TRF_SeminarMaxNoClub where club_name !=' '";
        }
        else
        {
            obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY Name asc) AS Sr, * from View_TRF_Seminar where club_name='" + type + "' ";
        }

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            GridView1.Visible = true;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            GridView1.Visible = false;
        }
    }

    private void BindGrid2(string clubname, string type)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY Name asc) AS Sr, * from View_TRF_Seminar where club_name='" + clubname + "' ";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
           
            lblMsg.Visible = false;
            GridView2.Visible = true;
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        else
        {

            lblMsg.Visible = true;
            GridView2.Visible = false;
        }
    }

    private void BindGrid3()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandQry = "Select ROW_NUMBER () OVER (ORDER BY club_name asc) AS Sr, id, club_name from clubs_tbl where club_name not in ( select distinct club_name from View_TRF_Seminar where club_name !=' ')";


        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
            GridView3.DataSource = dt;
            GridView3.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            GridView3.Visible = false;
            GridView1.Visible = false;
            GridView2.Visible = false;
        }
    }
   
   
    int total = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "maxnoofclub"));
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblamount = (Label)e.Row.FindControl("lblTotal");
            lblamount.Text = total.ToString();
        }
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        BindGrid2(DDLClubName.SelectedItem.Text.Trim(), "All");
    }
}