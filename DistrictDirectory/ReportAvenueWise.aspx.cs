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

public partial class DistrictDirectory_ReportAvenueWise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                ddlAvenue.Visible = false;               
                RadGrid1.Visible = true;
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
        //string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat) Enum.Parse(typeof(GridExcelExportFormat), "Biff");
        RadGrid1.ExportSettings.FileName = "Avenuewise_Reports";
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

        obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] WHERE ([district_no] = '3141')";

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

    string strMembers, strSpouses = "";
    decimal total = 0; decimal actualTotal; decimal balTotal; decimal receivedTotal;
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {

        //if (e.Item is GridDataItem)
        //{
        //    GridDataItem dataItem = e.Item as GridDataItem;
        //    string payment1 = dataItem["applicable_amount"].Text;
        //    decimal fieldValue1 = decimal.Parse(payment1);
        //    actualTotal += fieldValue1;


        //    string payment2 = dataItem["balance_amount"].Text;
        //    decimal fieldValue2 = decimal.Parse(payment2);
        //    balTotal += fieldValue2;


        //    string payment3 = dataItem["received_amt"].Text;
        //    decimal fieldValue3 = decimal.Parse(payment3);
        //    receivedTotal += fieldValue3;

        //}

        //if (e.Item is GridFooterItem)
        //{

        //    GridFooterItem footerItem = e.Item as GridFooterItem;
        //    footerItem.HorizontalAlign = HorizontalAlign.Right;
        //    footerItem.Font.Bold = true;
        //    footerItem["applicable_amount"].Text = actualTotal.ToString("n0");


        //    footerItem.HorizontalAlign = HorizontalAlign.Right;
        //    footerItem.Font.Bold = true;
        //    footerItem["balance_amount"].Text = balTotal.ToString("n0");


        //    footerItem.HorizontalAlign = HorizontalAlign.Right;
        //    footerItem.Font.Bold = true;
        //    footerItem["received_amt"].Text = receivedTotal.ToString("n0");

        //}
    }
    protected void rbtnAvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnAvenue.SelectedIndex == 0)
        {
            ddlAvenue.Visible = false;
            BindGrid();
        }
        else
        {
            ddlAvenue.Visible = true;
            GetDistDesignation("2020 - 2021");
        }
    }
    protected void ddlAvenue_SelectedIndexChanged(object sender, EventArgs e)
    {
        string yrs = "2020 - 2021";
        string position = ddlAvenue.SelectedItem.Text.Trim().ToString();
        BindGrid(yrs, position);
    }
    private void BindGrid(string yrs, string position)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        // obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] where district_no='3141' and years='" + yrs + "' and avenue='" + position + "' order by Name";
        obj.SetCommandSP = "z_GetPositionByAvenue";
        obj.AddParam("@district_no", 3141);
        obj.AddParam("@years", yrs);
        obj.AddParam("@avenue", position);
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            btnExporttoExcel.Visible = true;
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            btnExporttoExcel.Visible = false;
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }
    private void GetDistDesignation(string year)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='" + year + "' ORDER BY [designation] ";
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            ddlAvenue.DataTextField = "designation";
            ddlAvenue.DataValueField = "id";
            ddlAvenue.DataSource = dt;
            ddlAvenue.DataBind();
            ddlAvenue.Items.Insert(0, "Select Avenue");
        }
    }
}

