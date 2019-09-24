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

public partial class admin_club_wise_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                DDLClubName.Visible = false;

                //RadGrid1.Visible = true;
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
        if (rbtnClub.SelectedIndex == 0)
        {
            RadGrid1.ExportSettings.FileName = "DistrictOfficers_" + DateTime.Now.ToString("dd-MM-yyyy");
        }
        else
        {
            RadGrid1.ExportSettings.FileName = DDLClubName.SelectedItem.Text + "_DistrictOfficers_" + DateTime.Now.ToString("dd-MM-yyyy");
        }
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

        obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] WHERE ([district_no] = '3141') Order by name";

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
   
    private void BindGrid(string yrs, string clubName)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "SELECT * FROM [View_DistPositionHeldMembers] where district_no='3141' and years='" + yrs + "' and club_name='" + clubName + "' order by Name";

        obj.SetCommandSP = "z_GetClubwiseReport";       
        obj.AddParam("@years", yrs);
        obj.AddParam("@club_name", clubName);

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSourceID = string.Empty;
            RadGrid1.DataSource = dt;
            RadGrid1.Rebind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }   

    protected void rbtnClub_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnClub.SelectedIndex == 0)
        {
            DDLClubName.Visible = false;
            BindGrid();
        }
        else
        {
            RadGrid1.Visible = false;
            DDLClubName.Visible = true;          
        }
    }

    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        string yrs = "2016 - 2017";
        string clubName = DDLClubName.SelectedItem.Text.Trim().ToString();
        BindGrid(yrs, clubName);
    }
}

