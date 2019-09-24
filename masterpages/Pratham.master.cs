using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using Telerik.Web.UI;

public partial class masterpages_Pratham : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string nt = "";
            try
            {
                nt = Session["NodeText"].ToString();
            }
            catch
            {
                nt = "Admin Users";
            }
           
        }
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../PrathamDirectory/default.aspx");
    }  

    protected void btnLogout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../PrathamDirectory/default.aspx");
    }
}
