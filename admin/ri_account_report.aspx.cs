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

public partial class admin_ri_account_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                DDLClubName.Visible = false;
                rbtnClubwise.Visible = false;

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
        string strFileName = "";
        string date = DateTime.Now.ToString("dd_MM_yyyy");
        string clubName = DDLClubName.SelectedItem.Text.Trim().ToString();
        string accountType = rbtnAccount.SelectedValue.ToString();
        string clubWise = rbtnClubwise.SelectedValue.ToString();

        if (accountType == "0")
        {
            strFileName = date;
        }
        if (accountType == "1")
        {
            if (clubWise == "0")
            {
                strFileName = "WithAccount" + date; ;
            }
            if (clubWise == "1")
            {
                strFileName = "WithAccount" + clubName + date;
            }
        }
        if (accountType == "2")
        {
            if (clubWise == "0")
            {
                strFileName = "WithoutAccount" + date; ;
            }
            if (clubWise == "1")
            {
                strFileName = "WithoutAccount" + clubName + date;
            }
        }

        //string alternateText = (sender as ImageButton).AlternateText;
        RadGrid1.ExportSettings.Excel.Format = (GridExcelExportFormat)Enum.Parse(typeof(GridExcelExportFormat), "Biff");
        RadGrid1.ExportSettings.FileName = "RotaryAccountReport_" + strFileName;
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

        obj.SetCommandQry = "SELECT * FROM [ViewMembers] where MemType='Active' and district_no='3141' order by Name";

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
   
   
    private void BindGrid(string accountType, string clubName)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [ViewMembers] where MemType='Active' and district_no='3141' and ri_account_created='" + accountType + "' and club_name='" + clubName + "' order by Name";       
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

    private void BindGrid(string accountType)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        //if(accountType=="All")
        //    obj.SetCommandQry = "SELECT * FROM [ViewMembers] where MemType='Active' and district_no='3141' order by Name";
        //else
            obj.SetCommandQry = "SELECT * FROM [ViewMembers] where MemType='Active' and district_no='3141' and ri_account_created='" + accountType + "' order by Name";

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


    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {        
        string clubName = DDLClubName.SelectedItem.Text.Trim().ToString();
        string type = rbtnAccount.SelectedValue.ToString();

        if (type == "1")
            BindGrid("Yes", clubName);
        if (type == "2")
            BindGrid("No", clubName);       
    }

    protected void rbtnAccount_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDLClubName.SelectedIndex = 0;
        rbtnClubwise.SelectedIndex = 0;        

        if (rbtnAccount.SelectedIndex==0)
        {
            DDLClubName.Visible = false;
            rbtnClubwise.Visible = false;
            BindGrid();
        }

        if (rbtnAccount.SelectedIndex == 1)
        {
            DDLClubName.Visible = false;
            rbtnClubwise.Visible = true;
            BindGrid("Yes");
        }

        if (rbtnAccount.SelectedIndex == 2)
        {
            DDLClubName.Visible = false;
            rbtnClubwise.Visible = true;
            BindGrid("No");
        }

    }

    protected void rbtnClubwise_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDLClubName.SelectedIndex = 0;

        if (rbtnClubwise.SelectedIndex == 0)
        {
            DDLClubName.Visible = false;
            rbtnClubwise.Visible = true;

            string type = rbtnAccount.SelectedValue.ToString();
            if (type == "1")
                BindGrid("Yes");
            if (type == "2")
                BindGrid("No");
        }


        if (rbtnClubwise.SelectedIndex == 1)
        {
            DDLClubName.Visible = true;
            rbtnClubwise.Visible = true;           
        }
    }
}

