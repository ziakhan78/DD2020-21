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

public partial class admin_ViewSpeakerEvents : System.Web.UI.Page
{
    protected void Page_preRender(object sender, EventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = RadGrid1.CurrentPageIndex.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                PanelDate.Visible = false;
                bool b;
                if (b = true)
                {
                    Session["searchField"] = null;                 

                    b = false;
                }
                lblMsg.Visible = false;
                permission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
       
    }
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "sp_DeleteSpeakerEvents";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                //RadGrid1.DataBind();  
                ManageGrid();
            }
        }
    }
    protected void rbtnsort_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rbtnsort.SelectedValue == "0")
        {
            Session["searchField"] = "All";  
            rbtnsort.SelectedIndex = 0;           
            PanelDate.Visible = false;
            BindGrid();
        }

        if (rbtnsort.SelectedValue == "1")
        {
            Session["searchField"] = "Speaker";  
            rbtnsort.SelectedIndex = 1;
            BindList("Speaker");
            PanelDate.Visible = false;
        }

        if (rbtnsort.SelectedValue == "2")
        {
            Session["searchField"] = "Event";  
            rbtnsort.SelectedIndex = 2;
            BindList("Event");
            PanelDate.Visible = false;
        }

        if (rbtnsort.SelectedValue == "3")
        {
            Session["searchField"] = "Date";  
            rbtnsort.SelectedIndex = 3;           
            PanelDate.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void BindList(string str)
    {
        DBconnection con = new DBconnection();
        DataTable dt = new DataTable();
        //con.SetCommandQry = "SELECT * FROM [SpeakerEvents_tbl] where speaker_events='" + str + "'";
        con.SetCommandQry = "SELECT SUBSTRING(club_name, 16, 500) AS ClubName, * FROM [View_SpeakerEvents] where speaker_events='" + str + "'";
        dt = con.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RadGrid1.DataSourceID = null;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
    }
    protected void btnSortdateSubmit_Click(object sender, EventArgs e)
    {
        GetEventByDate();
    }

    private void GetEventByDate()
    {
        //string[] dFrom = dateFrom.SelectedDate.ToString().Split(' ');
        //string[] dTo = dateTo.SelectedDate.ToString().Split(' ');

        //string dFromm = dFrom[0].Replace('/', '-');
        //string dtoo = dTo[0].Replace('/', '-');

        DateTime dFromm = DateTime.Parse(dateFrom.DbSelectedDate.ToString());
        DateTime dtoo = DateTime.Parse(dateTo.DbSelectedDate.ToString());
        //string dtoo = dTo[0].Replace('/', '-');

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_SortOrderbyDate_sp";
        obj.AddParam("@dFrom", dFromm);
        obj.AddParam("@dTo", dtoo);
        DataTable dt = new DataTable();
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
    private void BindGrid()
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT ROW_NUMBER () OVER (ORDER BY date DESC) AS RowNumber, SUBSTRING(club_name, 16, 500) AS ClubName, * FROM [View_SpeakerEvents]";
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            lblMsg.Visible = false;
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            lblMsg.Visible = true;
            RadGrid1.Visible = false;
        }
    }

    private void ManageGrid()
    {
        try
        {
            if (Session["searchField"] != null)
            {
                if (Session["searchField"] == "All")
                {
                    BindGrid();
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }

                if (Session["searchField"] == "Speaker")
                {
                    BindList("Speaker");
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }

                if (Session["searchField"] == "Event")
                {
                    BindList("Event");
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }

                if (Session["searchField"] == "Date")
                {
                    GetEventByDate();
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
                }

            }           

            else
            {
                try
                {
                    RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                    Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);

                    BindGrid();
                }
                catch
                {
                    BindGrid();
                }
            }
        }
        catch { }
    }
    protected void RadGrid1_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
    {
        ManageGrid();
    }
    protected void RadGrid1_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
    {
        ManageGrid();
    }
    public void permission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandQry = "SELECT * FROM [Users]";

            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();

            if (dt.Rows.Count > 0)
            {
                string st = Session["Edit"].ToString();
                if (Convert.ToBoolean(Session["Edit"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 2].Visible = false;

                if (Convert.ToBoolean(Session["Delete"]) == false)
                    RadGrid1.Columns[RadGrid1.Columns.Count - 1].Visible = false;
            }
        }
        catch (Exception ex)
        {
            string ss = ex.Message;
        }
    }
}


