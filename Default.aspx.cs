using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            GetRIMonthlyMessage();
            GetDGMonthlyMessage();
        }

    }
    private void GetRIMonthlyMessage()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select top(1) * from monthly_message_tbl where message_from='RI' order by month desc";


        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //lblRiMessage.Text = dt.Rows[0]["message"].ToString();
            //lblName.Text = dt.Rows[0]["name"].ToString();          
            //string strImg = dt.Rows[0]["image"].ToString();
            //if (strImg != "")
            //{
            //    imgDg.ImageUrl = "RIDGImages/" + strImg;
            //}

            string txt = dt.Rows[0]["message"].ToString();
            try
            {
                int nch = txt.Length;
                if (nch > 900)
                {
                    // btnPresidentMsg.Visible = true;
                    txt = txt.Substring(0, 900);
                    txt = txt + "...";
                }
                else
                {
                    // btnPresidentMsg.Visible = false;
                }
            }
            catch
            {
            }
            lblRiMessage.Text = txt;
        }
    }
    private void GetDGMonthlyMessage()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select top(1) * from monthly_message_tbl where message_from='DG' order by month desc";


        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //lblDg.Text = dt.Rows[0]["message"].ToString();
            //lblName.Text = dt.Rows[0]["name"].ToString();          
            //string strImg = dt.Rows[0]["image"].ToString();
            //if (strImg != "")
            //{
            //    imgDg.ImageUrl = "RIDGImages/" + strImg;
            //}

            string txt = dt.Rows[0]["message"].ToString();
            try
            {
                int nch = txt.Length;
                if (nch > 900)
                {
                    // btnPresidentMsg.Visible = true;
                    txt = txt.Substring(0, 900);
                    txt = txt + "...";
                }
                else
                {
                    // btnPresidentMsg.Visible = false;
                }
            }
            catch
            {
            }
            lblDgMessage.Text = txt;
        }
    }
}