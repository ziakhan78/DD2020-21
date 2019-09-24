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

public partial class admin_view_tashkent_registrations_f_and_b_report : System.Web.UI.Page
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
        RadGrid1.ExportSettings.FileName = "TashkentRegistrations_F_and_B_Reports_" + dt;
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

    decimal total;
    int Vegetarian = 0;
    int NonVegetarian = 0;
    int Jain = 0;   
    protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
    {
        string strFoodPref = ""; 
        string strSFoodPref = "";      

        if (e.Item is GridDataItem)
        {

            GridDataItem dataItem = e.Item as GridDataItem;

            string strRegFor = dataItem["registration_for"].Text;

            if (strRegFor == "Couple")
            {
                strSFoodPref = dataItem["spouse_food_pref"].Text;               

                if (strSFoodPref == "Veg")
                    Vegetarian++;

                if (strSFoodPref == "Non-Veg")
                    NonVegetarian++;

                if (strSFoodPref == "Jain")
                    Jain++;               
            }

            strFoodPref = dataItem["food_pref"].Text;           

            if (strFoodPref == "Veg")
                Vegetarian++;

            if (strFoodPref == "Non-Veg")
                NonVegetarian++;

            if (strFoodPref == "Jain")
                Jain++;
          
        }

        if (e.Item is GridFooterItem)
        {
            GridFooterItem footerItem = e.Item as GridFooterItem;
            footerItem.HorizontalAlign = HorizontalAlign.Right;
            footerItem.Font.Bold = true;

            //string memType = "";
            //memType = rbtnType.SelectedValue.ToString();

            //if (memType == "0")
            //{
               
                footerItem["emailId"].Text = "Veg: " + Vegetarian.ToString();
                footerItem["food_pref"].Text = "Non-Veg: " + NonVegetarian.ToString();
            footerItem["spouse_food_pref"].Text = "Jain: " + Jain.ToString();

            //}

            //if (memType == "1")
            //{
            //    footerItem["emailId"].Text = "Veg: " + Veg.ToString();
            //}

            //if (memType == "2")
            //{
            //    footerItem["food_pref"].Text = "Non-Veg: " + NonVegetarian.ToString();
            //}            

        }
    }
}
