using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class masterpages_HomePage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDetails();
        }
    }
    private void GetDetails()
    {
        try
        {
            MembersBll obj = new MembersBll();
            DataTable dt = new DataTable();

            dt = obj.GetAllMembersTrfAmt();
            if (dt.Rows.Count > 0)
            {
                decimal trfAmount = Convert.ToDecimal(dt.Rows[0]["trfAmt"].ToString());
                lblTotalMembers.Text = "7,500";// dt.Rows[0]["TotalMember"].ToString();

                lblTrfAmt.Text = "10,00,000";// string.Format("{0:n0}", trfAmount);
            }

        }
        catch { }
    }

}
