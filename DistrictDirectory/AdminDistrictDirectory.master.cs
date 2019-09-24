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

public partial class Admin_AdminDistrictDirectory : System.Web.UI.MasterPage
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
            try
            {
                RadTreeView1.Nodes.FindNodeByText(nt).Selected = true;
                RadTreeView1.Nodes.FindNodeByText(nt).Expanded = true;
            }
            catch { }


            try
            {
                if (Session["user"] != null)
                {
                    if (Session["AdminUserName"] != null)
                    {
                        lblwelcome.Text = "Welcome : " + Session["AdminUserName"].ToString();
                    } 

                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            catch
            {
            }
        }
    }
    protected void lbtnlogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("default.aspx");
    }
    protected void RadTreeView1_NodeExpand(object sender, RadTreeNodeEventArgs e)
    {
        Session["NodeText"] = e.Node.Text;
    }
    protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
    {
        Response.Cookies["currentpage"]["pageIndex"] = "0";

        if (Session["user"] == null)
        {
            Response.Redirect("../admin/default.aspx");
        }

        string Snode = RadTreeView1.SelectedNode.Text;

        string[] s = e.Node.FullPath.Split('/');
        Session["NodeText"] = s[0];




        if (Snode.Trim() == "Add Admin Users")
        {
            Response.Redirect("add_users.aspx");
        }

        else if (Snode.Trim() == "View Admin Users")
        {
            Response.Redirect("view_users.aspx");
        }


       

        else if (Snode.Trim() == "Add Club Designation")
        {
            Response.Redirect("add_club_designations.aspx");
        }

        else if (Snode.Trim() == "View Club Designation")
        {
            Response.Redirect("view_club_designations.aspx");
        }


        else if (Snode.Trim() == "Add Avenue")
        {
            Response.Redirect("Avenues.aspx");
        }

        else if (Snode.Trim() == "View Avenue")
        {
            Response.Redirect("ViewAvenues.aspx");
        }

        else if (Snode.Trim() == "Add Designation")
        {
            Response.Redirect("Designations.aspx");
        }

        else if (Snode.Trim() == "View Designation")
        {
            Response.Redirect("ViewDesignations.aspx");
        }       

        else if (Snode.Trim() == "Add District Appointments")
        {
            Response.Redirect("DistrictAppointments.aspx");
        }

        else if (Snode.Trim() == "View District Appointments")
        {
            Response.Redirect("ViewDistrictAppointments.aspx");
        }

        else if (Snode.Trim() == "Avenue Wise Report")
        {
            Response.Redirect("ReportAvenueWise.aspx");
        }

        else if (Snode.Trim() == "Club Wise Gist Report")
        {
            Response.Redirect("club_wise_gist_report.aspx");
        }

        else if (Snode.Trim() == "Club Wise Report")
        {
           Response.Redirect("ReportClubWise.aspx");
        }      


        else if (Snode.Trim() == "Change Admin Password")
        {
            Response.Redirect("ChangePassword.aspx");
        }
    }

    protected void btnLogout_Click(object sender, ImageClickEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../admin/default.aspx");
    }
}
