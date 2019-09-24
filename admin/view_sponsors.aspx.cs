using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;

public partial class admin_view_sponsors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TrList.Visible = false;
            btnDispOrder.Visible = false;
        }
    }
    protected void btnOrder_Click(object sender, EventArgs e)
    {
        btnDispOrder.Visible = true;
        TrList.Visible = true;
    }
    protected void btnDispOrder_Click(object sender, EventArgs e)
    {
        string order = "";
        string currentOrd = "";

        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT id FROM dist_sponsers_tbl";
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();

        if (dt.Rows.Count > 0)
        {
            for (int i = 0; i <= dt.Rows.Count-1; i++)
            {
                currentOrd = currentOrd + dt.Rows[i]["id"].ToString() + ",";
            }
        }
        
        //foreach (GridDataItem item in RadGrid1.MasterTableView.Items)
        //{
        //    try
        //    {
        //        Label lblid = (Label)item.FindControl("lblid");
        //        if (lblid.Text != "")
        //        {
        //            currentOrd = currentOrd + lblid.Text.ToString() + ",";
        //        }
        //    }
        //    catch { }
        //}

        currentOrd = currentOrd.TrimEnd(','); ;

        foreach (RadListBoxItem item in ListOrder.Items)
        {
            order = order + item.Value.ToString() + ",";
        }
        order = order.TrimEnd(',');

        UpdteDisplayOrder(currentOrd, order);
    }

    private void UpdteDisplayOrder(string currentOrd, string order)
    {
        string[] dord = order.Split(',');
        string[] cdord = currentOrd.Split(',');

        for (int i = 0; i <= dord.Length - 1; i++)
        {
            //for (int j = 0; j <= cdord.Length - 1; j++)
            //{

            int dor = int.Parse(dord[i].ToString());
            int cor = int.Parse(cdord[i].ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateSponsorDisplayOrder";
            obj.AddParam("@display_order", dor);
            obj.AddParam("@current_order", cor);
            int exe = obj.ExecuteNonQuery();
            //}
        }

        RadGrid1.DataBind();
    }
    protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_DeleteSponsor_Dist";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
}