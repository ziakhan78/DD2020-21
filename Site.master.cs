using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class SiteMaster : MasterPage
{
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    protected void Page_Init(object sender, EventArgs e)
    {
        // The code below helps to protect against XSRF attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;
    }

    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //AllMembersandTRF();
        if (!IsPostBack)
        {
            lnkBtnLogin.Visible = true;
            lnkBtnLogout.Visible = false;
            lblMember.Visible = false;
            //GetDetails();
        }
        try
        {
            if (Session["Username"].ToString() != "")
            {
                lnkBtnLogin.Visible = false;
                lnkBtnLogout.Visible = true;
                lblMember.Visible = true;
                lblMember.Text = Session["Username"].ToString();
            }
        }
        catch { }
    }

    protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
    {
        Context.GetOwinContext().Authentication.SignOut();
    }

    private void AllMembersandTRF()
    {
        decimal members, trf = 0;
        DataTable dt = new DataTable();
        DBconnection obj = new DBconnection();

        obj.SetCommandQry = "select count(MemberId) as members, count(TrfAmt) as trf  from ViewMembers where district_no='3141' and MemType='Active'";

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            members = decimal.Parse(dt.Rows[0]["members"].ToString());
           // lblMembers.Text = string.Format("{0:n0}", members);
            trf = decimal.Parse(dt.Rows[0]["trf"].ToString());
           // lblTrf.Text = string.Format("{0:n0}", trf);
        }
        else
        {

        }
    }
    protected void lnkBtnLogout_Click(object sender, EventArgs e)
    {
        try
        {
            try
            {
                DBconnection con = new DBconnection();
                con.AddParam("@id", int.Parse(Session["MemberTrackId"].ToString()));
                con.SetCommandSP = "z_UpdateUserLoginTracks";
                con.ExecuteNonQuery();
            }
            catch { }
        }
        catch { }

        //Session.Abandon();
        //Response.Redirect("Default.aspx");

        try
        {
            Session.Abandon();
           // lblUsername.Text = "Guest";
            lnkBtnLogin.Visible = true;
            // lnlBtnLogout.Visible = false;            
            Response.Redirect("http://rotarydist3141.com/members_login.aspx?id=Profile");
        }
        catch
        {

        }
    }

    //private void GetDetails()
    //{
    //    try
    //    {
    //        MembersBll obj = new MembersBll();
    //        DataTable dt = new DataTable();

    //        dt = obj.GetAllMembersTrfAmt();
    //        if (dt.Rows.Count > 0)
    //        {
    //            decimal trfAmount = Convert.ToDecimal(dt.Rows[0]["trfAmt"].ToString());
    //            lblTotalMembers.Text = "7,500";// dt.Rows[0]["TotalMember"].ToString();

    //            lblTrfAmt.Text = "10,00,000";// string.Format("{0:n0}", trfAmount);
    //        }

    //    }
    //    catch { }
    //}

    protected void lnkBtnLogin_Click(object sender, EventArgs e)
    {
        //int mid = int.Parse(Session["memid"].ToString());
        Response.Redirect("http://rotarydist3141.com/members_login.aspx?id='Profile'");
        //Response.Redirect("members_login.aspx?id='Profile'");
    }
}