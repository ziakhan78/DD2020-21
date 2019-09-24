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

public partial class admin_add_bod_position : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    DDLClubName.DataSourceID = "DSDistClubNo";
                    DDLClubName.DataBind();

                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetBodDesignation(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void GetBodDesignation(int id)
    {
        BodBll obj = new BodBll();
        obj.Id = id;      
        DataTable dt = new DataTable();
        dt = obj.GetBodDesignationById();
        if (dt.Rows.Count > 0)
        { 
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubId"].ToString();  
            txtBODPosi.Text = dt.Rows[0]["designation"].ToString();
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateBodDesignation(id);
            }
            else
            {
                AddBodDesignation();
            }
           
        }
    }
    private void AddBodDesignation()
    {
        try
        {
            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            BodBll obj = new BodBll();
            obj.ClubId = int.Parse(DDLClubName.SelectedValue.ToString()); 
            obj.Designation = txtBODPosi.Text.ToString();
            obj.Ipaddress = ipaddress;
            int exe = obj.AddBodDesignation();
            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('BOD Position Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateBodDesignation(int id)
    {
        try
        {
            BodBll obj = new BodBll();
            obj.Id = id;
            obj.ClubId = int.Parse(DDLClubName.SelectedValue.ToString());
            obj.Designation = txtBODPosi.Text.ToString();
          
            int exe = obj.UpdateBodDesignation();        
            if (exe > 0)
            {
                Clear();               
                Showmsg("BOD Position Has Been Updated Successfully", "view_bod_position.aspx");
            }
        }
        catch { }
    }
    private void Clear()
    {
        txtBODPosi.Text = "";
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void CVRImemNo_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVPosition.Enabled = false;
        }
        else
        {
            try
            {
                DataTable dt = new DataTable();
                BodBll obj = new BodBll();
                obj.Designation = txtBODPosi.Text.Trim().ToString();
                obj.ClubId = int.Parse(DDLClubName.SelectedValue.ToString());//int.Parse(Session["DistrictClubID"].ToString());
                dt = obj.IsDesignationAlreadyExist();

                if(dt.Rows.Count>0)
                    args.IsValid = false;
                else
                    args.IsValid = true;               
            }
            catch
            {
                args.IsValid = true;
            }
        }
    }
    public void Showmsg(string msg, string redirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + redirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
   
}
