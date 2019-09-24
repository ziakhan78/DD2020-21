using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Data;

using Telerik.Web.UI;
using xi = Telerik.Web.UI.ExportInfrastructure;
using Telerik.Web.UI.GridExcelBuilder;

public partial class admin_view_tashkent_registrations_payment_report : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                btnExporttoExcel.Visible = false;
                lblMsg.Visible = false;
                BindGrid();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    protected void btnExporttoExcel_Click(object sender, EventArgs e)
    {
        string dt = DateTime.Now.ToString("dd_MM_yyyy");
        //string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Biff");
        RadGrid1.ExportSettings.FileName = "TashkentRegistrationsPaymentsReports_" + dt;
        // RadGrid1.ExportSettings.IgnorePaging = CheckBox1.Checked;
        RadGrid1.ExportSettings.ExportOnlyData = true;
        RadGrid1.ExportSettings.OpenInNewWindow = true;
        RadGrid1.MasterTableView.ExportToExcel();
    }

    #region [ EXCELML FORMAT ]
    protected void RadGrid1_ExcelMLWorkBookCreated(object sender, GridExcelMLWorkBookCreatedEventArgs e)
    {

        foreach (RowElement row in e.WorkBook.Worksheets[0].Table.Rows)
        {
            row.Cells[0].StyleValue = "Style1";
        }

        StyleElement style = new StyleElement("Style1");
        style.InteriorStyle.Pattern = InteriorPatternType.Solid;
        style.InteriorStyle.Color = System.Drawing.Color.LightGray;

        e.WorkBook.Styles.Add(style);

    }

    #endregion

   
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [View_TashkentRegistrations]";
        dt = obj.ExecuteTable();       
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            btnExporttoExcel.Visible = true;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            //rbtnType.Visible = false;
            btnExporttoExcel.Visible = false;
            RadGrid1.Visible = false;
        }
    }

    decimal total = 0; decimal actualTotal; decimal balTotal; decimal receivedTotal; decimal totalMem;
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        if (e.Item is GridDataItem)
        {
            GridDataItem dataItem = e.Item as GridDataItem;
            string payment1 = dataItem["actual_amt"].Text;
            if (payment1 != "&nbsp;")
            {
                decimal fieldValue1 = decimal.Parse(payment1);
                actualTotal += fieldValue1;
            }

            string payment2 = dataItem["amount"].Text;
            if (payment1 != "&nbsp;")
            {
                decimal fieldValue2 = decimal.Parse(payment2);
                balTotal += fieldValue2;
            }

            string payment3 = dataItem["balance_amt"].Text;
            if (payment1 != "&nbsp;")
            {
                decimal fieldValue3 = decimal.Parse(payment3);
                receivedTotal += fieldValue3;
            }

            string strRegFor = dataItem["registration_for"].Text;

            if (strRegFor == "Couple")
                totalMem = totalMem + 2;
            else
                totalMem = totalMem + 1;




            //Label lblSpouse = (Label)e.Item.FindControl("lblSpouse");
            //if (lblSpouse != null)
            //    Session["Spouse"] = lblSpouse.Text;

            //Label lblMember = (Label)e.Item.FindControl("lblMember");
            //if (lblMember != null)
            //    Session["Member"] = lblMember.Text;

            //Label lblTotal = (Label)e.Item.FindControl("lblTotal");
            //if (lblTotal != null)
            //    Session["Total"] = lblTotal.Text;
        }

        if (e.Item is GridFooterItem)
        {
            //Label lblTotalSpouse = e.Item.FindControl("lblTotalSpouse") as Label;
            //Label lblTotalMember = e.Item.FindControl("lblTotalMember") as Label;
            //Label lblTotals = e.Item.FindControl("lblTotals") as Label;

            //lblTotalMember.Text = "Members: " + Session["Member"].ToString();
            //lblTotalSpouse.Text = "Spouses: " + Session["Spouse"].ToString();
            //lblTotals.Text = "Total: " + Session["Total"].ToString();



            GridFooterItem footerItem = e.Item as GridFooterItem;
            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["actual_amt"].Text = actualTotal.ToString("n0");


            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["amount"].Text = balTotal.ToString("n0");


            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["balance_amt"].Text = receivedTotal.ToString("n0");

            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;
            footerItem["registration_for"].Text = totalMem.ToString("n0");
        }

        try
        {
            DropDownList chkStatus = (DropDownList)e.Item.FindControl("chkActive");
            Label lblStatus = (Label)e.Item.FindControl("lblStatus");

            if (lblStatus != null)
            {
                string strStatus = lblStatus.Text;

                if (strStatus == "Pending")
                    chkStatus.SelectedIndex = 0;
                if (strStatus == "Received")
                    chkStatus.SelectedIndex = 1;
            }
        }
        catch { }
    }

}
