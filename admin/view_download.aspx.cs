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
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_download : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                bool b = true;
                if (b == true)
                {
                    Session["Alphabet"] = null;
                    Session["SearchByEvents"] = null;
                    Session["SearchByDownloadTypes"] = null;
                    Session["SearchField"] = null;                   
                   
                    b = false;
                }

                ViewState["CurrentAlphabet"] = "ALL";
                this.GenerateAlphabets();

                lblMsg.Visible = false;
                CheckUserPermission();
                ManageGrid();
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void ManageGrid()
    {
        try
        {
            if (Session["Alphabet"] != null)
            {
                SearchByAlphabet(Session["Alphabet"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["SearchByEvents"] != null)
            {
                SearchByEvents(Session["SearchField"].ToString(), Session["SearchByEvents"].ToString());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
            }

            else if (Session["SearchByDownloadTypes"] != null)
            {
                SearchByDownloadTypes(rbtnDownloadType.SelectedItem.Text.Trim());
                RadGrid1.CurrentPageIndex = Convert.ToInt16(Request.Cookies["currentpage"]["pageIndex"].ToString());
                Request.Cookies["currentpage"].Expires = DateTime.Now.AddDays(-1);
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
        catch
        {
        }
    }

    private void BindGrid()
    {
        Session["Alphabet"] = null;
        Session["SearchByEvents"] = null;
        Session["SearchByDownloadTypes"] = null;
        Session["SearchField"] = null;

        DataTable dt = new DataTable();
        DownloadsBll obj = new DownloadsBll();
        dt = obj.GetDownloads();
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
    protected void rbtnDownloadType_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["Alphabet"] = null;
        Session["SearchByEvents"] = null;        
        Session["SearchField"] = null;

        string strValue = rbtnDownloadType.SelectedValue.ToString();
        Session["SearchByDownloadTypes"] = strValue;
        if (strValue == "0")
        {
            RadGrid1.Columns[RadGrid1.Columns.Count - 3].Visible = true;
        }
        else
        {
            RadGrid1.Columns[RadGrid1.Columns.Count - 3].Visible = false;
        }
        SearchByDownloadTypes(rbtnDownloadType.SelectedItem.Text.Trim().ToString());
    }
    protected void Alphabet_Click(object sender, EventArgs e)
    {
        LinkButton lnkAlphabet = (LinkButton)sender;
        ViewState["CurrentAlphabet"] = lnkAlphabet.Text;

        this.GenerateAlphabets();
        // RadGrid1.PageIndex = 0;
        //this.BindGrid1();
        SearchByAlphabet(lnkAlphabet.Text.Trim());
    }
    private void SearchByDownloadTypes(string strEvent)
    {
        DataTable dt = new DataTable();
        DownloadsBll obj = new DownloadsBll();
        obj.DownloadType = strEvent;
        dt = obj.GetDownloadsByDownloadsType();
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
    private void GenerateAlphabets()
    {
        List<ListItem> alphabets = new List<ListItem>();
        ListItem alphabet = new ListItem();

        for (int i = 65; i <= 91; i++)
        {
            alphabet = new ListItem();
            alphabet.Value = Char.ConvertFromUtf32(i);

            alphabet.Selected = alphabet.Value.Equals(ViewState["CurrentAlphabet"]);
            alphabets.Add(alphabet);
        }

        alphabet.Value = "ALL";
        alphabet.Selected = alphabet.Value.Equals(ViewState["CurrentAlphabet"]);
        //alphabets.Add(alphabet);

        rptAlphabets.DataSource = alphabets;
        rptAlphabets.DataBind();
    }    
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Alphabet"] = null;
        Session["SearchByEvents"] = null;
        Session["SearchByDownloadTypes"] = null;
        Session["SearchField"] = null;      

        string searchField = "";
        string val = "";
        int i = int.Parse(rbtnSearch.SelectedValue.ToString());
        if (i == 0)
        {
            searchField = "title";
            val = txtName.Text.Trim();
        }
        if (i == 1)
        {
            searchField = "author";
            val = txtName.Text.Trim();
        }

        Session["SearchField"] = searchField;
        Session["SearchByEvents"] = val;
        SearchByEvents(searchField, val);
    }
    private void SearchByEvents(string searchField, string pname)
    {
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from download_tbl where " + searchField + " like  '%'+'" + pname + "'+ '%' order by title";

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
    private void SearchByAlphabet(string name)
    {
        Session["Alphabet"] = name;
        Session["SearchByEvents"] = null;
        Session["SearchByDownloadTypes"] = null;
        Session["SearchField"] = null;

        DataTable dt = new DataTable();
        DownloadsBll obj = new DownloadsBll();
        obj.Title = name;
        dt = obj.SearchDownloadsByAlphabet();

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
    private void GetDowonloadsByEvents(string searchField)
    {
        Session["Alphabet"] = null;
        Session["SearchByEvents"] = null;
        Session["SearchByDownloadTypes"] = null;
        Session["SearchField"] = null;

        DataTable dt = new DataTable();
        DownloadsBll obj = new DownloadsBll();
        obj.EventName = searchField;
        dt = obj.GetDownloadsByEventType();
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
    public void CheckUserPermission()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetAdminUsersList";

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
    protected void RadGrid1_ItemCommand(object source, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DownloadsBll obj = new DownloadsBll();
            obj.Id = id;
            if (obj.DeleteDownloads() > 0)
            {
                RadGrid1.DataBind();
            }
        }
    }
    protected void RadGrid1_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
    {
        //Label lblSize = (Label)e.Item.FindControl("lblSize");
        //if (lblSize != null)
        //{
        //    Decimal size = Convert.ToDecimal(lblSize.Text.ToString());
        //    Decimal i = (size / 1024) / 1024;
        //    i = Math.Round(i, 2);
        //    lblSize.Text = i.ToString() + " MB";
        //}

        string ext, fileName, strPath = "";
        Label lblFile = (Label)e.Item.FindControl("lblFile");
        HtmlAnchor a1 = (HtmlAnchor)e.Item.FindControl("hrefLink");

        if (lblFile != null)
        {
            fileName = lblFile.Text.Trim();
            ext = fileName.Substring(fileName.LastIndexOf("."));

            if (ext == ".ppt" || ext == ".pptx" || ext == ".pps" || ext == ".ppsx")
            {
                strPath = "../Downloads/Ppts";
            }
            else
            {
                strPath = "../Downloads/Documents";
            }

            a1.HRef = strPath + "/" + fileName;

        }
    }

}

