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

public partial class user_Add_bod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {               
                BindYears();
                DDLClubName.DataSourceID = "DSDistClubNo";
                DDLClubName.DataBind();
               // BindMembers();
                //BindDesignations();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetBOD(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void BindYears()
    {
        try
        {
            int dt = DateTime.Now.Year;
            int m = DateTime.Now.Month;
            if (m > 6 && m <= 12)
                dt = dt + 1;

            for (Int32 i = Convert.ToInt32(dt); i >= Convert.ToInt32(dt)-1; i--)
            {
                string dtt = i + " - " + (i + 1);
                DDLYears.Items.Add(dtt.ToString());               
            }

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void GetBOD(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_BodMembers where id='" + id + "'";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            int clubid= int.Parse(dt.Rows[0]["DistrictClubID"].ToString());

            DDLClubName.DataSourceID = "DSDistClubNo";
            DDLClubName.DataBind();

            BindMembers(clubid);
            BindDesignations(clubid);
            DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClubName.SelectedValue = dt.Rows[0]["DistrictClubID"].ToString();
            

            try
            {
                //int desi_id = int.Parse(dt.Rows[0]["designation_id"].ToString());
                //DDLDesignation.SelectedValue = desi_id.ToString();
                DDLDesignation.SelectedItem.Text = dt.Rows[0]["designation"].ToString();
                DDLDesignation.SelectedValue = dt.Rows[0]["designation_id"].ToString();

            }
            catch { }

            try
            {
                //int mem_id = int.Parse(dt.Rows[0]["MemberId"].ToString());
                //DDLMember.SelectedValue = mem_id.ToString();
                DDLMember.SelectedItem.Text = dt.Rows[0]["fname"].ToString() + " " + dt.Rows[0]["lname"].ToString();
                DDLMember.SelectedValue = dt.Rows[0]["MemberId"].ToString();
            }
            catch { }

            DDLYears.SelectedItem.Text = dt.Rows[0]["year"].ToString();
        }
    }
    private void BindMembers(int distID)
    {
       // int distID = int.Parse(Session["DistrictClubID"].ToString());
        MembersBll obj = new MembersBll();

        obj.ClubId = distID;      
        DataTable dt = new DataTable();       
        dt = obj.GetMemberByClubId();
        if (dt.Rows.Count > 0)
        {

            DDLMember.DataTextField = "name";
            DDLMember.DataValueField = "MemberId";

            DDLMember.DataSource = dt;
            DDLMember.DataBind();

            //DDLMember.Items.Insert(0, "Select");
        }
        else
        {
            DDLMember.ClearSelection();
        }
    }
    private void BindDesignations(int distID)
    {
       // int distID = int.Parse(Session["DistrictClubID"].ToString());

        BodBll obj = new BodBll();
        obj.ClubId = distID;    

        DataTable dt = new DataTable();
        dt = obj.GetBodDesignationListByClubId();

        DDLDesignation.DataTextField = "designation";
        DDLDesignation.DataValueField = "id";

        DDLDesignation.DataSource = dt;
        DDLDesignation.DataBind();

       // DDLDesignation.Items.Insert(0, "Select");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateBodMember(id);
            }
            else
            {
                AddBodMembers();
            }           
        }
    }
    private void AddBodMembers()
    {
        try
        {

            /************Code for find IP address of user's machine**********/
            string ipaddress;
            ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (ipaddress == "" || ipaddress == null)
                ipaddress = Request.ServerVariables["REMOTE_ADDR"];
            /***************************************************************/

            int clubId = int.Parse(DDLClubName.SelectedValue.ToString()); 
            int memid = int.Parse(DDLMember.SelectedValue.ToString());
            BodBll obj = new BodBll();
            obj.ClubId = clubId;
            obj.MemberId = memid;
            obj.DesignationId = int.Parse(DDLDesignation.SelectedValue.ToString());
            obj.Year = DDLYears.SelectedItem.Text.Trim();
            obj.AddedBy = "Admin";
            obj.Ipaddress = ipaddress;
            int exe = obj.AddBod();


            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Bod Member Has Been Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }
    private void UpdateBodMember(int id)
    {
        try
        {

            int distID = int.Parse(DDLClubName.SelectedValue.ToString()); 
            int memid = int.Parse(DDLMember.SelectedValue.ToString());
            BodBll obj = new BodBll();
            obj.Id = id;
            obj.ClubId = distID;
            obj.MemberId = memid;
            obj.DesignationId = int.Parse(DDLDesignation.SelectedValue.ToString());
            obj.Year = DDLYears.SelectedItem.Text.Trim();            
           
            int exe = obj.UpdateBodMembers();
           

           
            if (exe > 0)
            {
                clear();               
                showmsg("Bod Member Has Been Updated Successfully", "ViewBod.aspx");
            }
        }
        catch { }
    }    
    private void clear()
    {
        DDLMember.SelectedIndex = 0;
        DDLDesignation.SelectedIndex = 0;
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        clear();
    }
    public void showmsg(string msg, string RedirectUrl)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "window.location='" + RedirectUrl + "';";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {  
        if (Request.QueryString["id"] != null)
        {
            CustomValidator1.Enabled = false;
        }
        else
        {
            try
            {
                int memId = int.Parse(DDLMember.SelectedValue.ToString());
                string desig = DDLDesignation.SelectedItem.ToString();              

                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select * from View_BodMembers where year='" + DDLYears.SelectedItem.Text.Trim() + "' and MemberId='" + memId + "' and designation='" + desig + "'";
                object res = obj.ExecuteScalar();
                if (res != null)
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
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {        
        //string desig = DDLDesignation.SelectedItem.ToString();
        //int distID = int.Parse(DDLClubName.SelectedValue.ToString()); // int.Parse(Session["DistrictClubID"].ToString());

        //if (Request.QueryString["id"] != null)
        //{
        //    CustomValidator2.Enabled = false;
        //}
        //else
        //{
        //    try
        //    {
        //        DBconnection obj = new DBconnection();
        //        obj.SetCommandQry = "select * from bod_tbl where year='" + DDLYears.SelectedItem.Text.Trim() + "' and designation='" + desig + "' and DistrictClubId='" + distID + "' ";
        //        object res = obj.ExecuteScalar();
        //        if (res != null)
        //            args.IsValid = false;
        //        else
        //            args.IsValid = true;
        //    }
        //    catch
        //    {
        //        args.IsValid = true;
        //    }
        //}
    }
    protected void DDLClubName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubid = int.Parse(DDLClubName.SelectedValue.ToString());
        if (clubid != null)
        {
            BindMembers(clubid);
            BindDesignations(clubid);
        }
    }    
}
