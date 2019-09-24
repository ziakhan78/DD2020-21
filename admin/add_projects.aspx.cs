using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;

public partial class admin_add_projects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                Session["ProjectImages"] = null;
                //RadGrid1.Visible = false;
               // BindMembers();
              //  BindMembersSpouses();
                BindYears();
                TRPartnerClub_JointList.Visible = false;
                txtDistClubName.Visible = false;
                txtDistrictNo.Visible = false;
                TRPartnerClub_JointList.Visible = false;
                TRDistType_Joint.Visible = false;
                TRPartnerClub_Joint.Visible = false;
                // TRDistrictNo_Joint.Visible = false;
                TRDistrictGrantNo.Visible = false;
                TRGlobalGrantNo.Visible = false;
                // TRPartnerClub_Global.Visible = false;
                // TRDistrictNo_Global.Visible = false;
                // TRDistNoGlobal.Visible = false;

                if (Request.QueryString["id"] != null)
                {
                    //RadGrid1.Visible = true;
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetProjects(id);
                    BindImages(id);
                }
            }

        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }
    private void BindImages(int id)
    {
        try
        {
            DataTable dt = new DataTable();
            ProjectsBLL objPro = new ProjectsBLL();
            objPro.ID = id;
            dt = objPro.GetPrtojects();
            if (dt.Rows.Count > 0)
            {
                string thumbnail = dt.Rows[0]["project_images"].ToString();
                if (thumbnail != "")
                {
                    Session["ProjectImages"] = thumbnail;
                    string[] strImages = thumbnail.Split(',');
                    Array.Sort(strImages);
                    DataTable dtt = new DataTable("MyDataTable");
                    dtt.Columns.Add("project_images");
                    foreach (string value in strImages)
                    {
                        dtt.Rows.Add(value);
                    }

                    Repeater1.DataSource = dtt;
                    Repeater1.DataBind();
                }

            }
        }
        catch { }

    }
    private void GetProjects(int id)
    {
        ProjectsBLL objPro = new ProjectsBLL();
        objPro.ID = id;

        DataTable dt = new DataTable();
        dt = objPro.GetPrtojects();
        if (dt.Rows.Count > 0)
        {
            DDLClub.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
            DDLClub.SelectedValue = dt.Rows[0]["club_id"].ToString();

            DDLYears.SelectedItem.Text = dt.Rows[0]["project_year"].ToString();
            txtProName.Text = dt.Rows[0]["project_title"].ToString();
            dtStartDate.DbSelectedDate = dt.Rows[0]["start_date"].ToString();
            dtEndDate.DbSelectedDate = dt.Rows[0]["end_date"].ToString();

            //DDLClubName2.SelectedValue = dt.Rows[0]["club_id"].ToString();
            rbtnProjectType.SelectedItem.Text = dt.Rows[0]["project_type"].ToString();
            txtProjectLocation.Text = dt.Rows[0]["project_location"].ToString();
            txtDesc.Text = dt.Rows[0]["project_description"].ToString();
            txtProjectCost.Text = dt.Rows[0]["project_cost"].ToString();
            ddlAvenueCovered.SelectedItem.Text = dt.Rows[0]["avenue_of_covered"].ToString();
            DDLChairperson.SelectedItem.Text = dt.Rows[0]["project_chairperson"].ToString();

            string strComMembers = dt.Rows[0]["committee_members"].ToString();
            if (strComMembers != "")
            {
                string[] mems = strComMembers.Split(',');
                for (int i = 0; i <= mems.Length - 1; i++)
                {
                    listTopics.Items.Add(mems[i]);
                }
            }

            txtBeneficiaries.Text = dt.Rows[0]["beneficiaries"].ToString();
            // txtProName.Text = dt.Rows[0]["project_images"].ToString();
            // txtProName.Text = dt.Rows[0]["partner_club_district_no"].ToString();
            // txtProName.Text = dt.Rows[0]["partner_club_name"].ToString();


            txtDistGrantNo.Text = dt.Rows[0]["district_grant_no"].ToString();
            txtGlobalGrantNo.Text = dt.Rows[0]["district_global_no"].ToString();
            txtAdd1.Text = dt.Rows[0]["add1"].ToString();
            txtAdd2.Text = dt.Rows[0]["add2"].ToString();
            txtCity.Text = dt.Rows[0]["city"].ToString();
            txtPin.Text = dt.Rows[0]["pin"].ToString();
            txtState.Text = dt.Rows[0]["state"].ToString();
            txtCountry.Text = dt.Rows[0]["country"].ToString();


            txtPhCC1.Text = dt.Rows[0]["ph1_cc"].ToString();
            txtPhAC1.Text = dt.Rows[0]["ph1_ac"].ToString();
            txtPh1.Text = dt.Rows[0]["phone1"].ToString();
            txtPhCC2.Text = dt.Rows[0]["ph2_cc"].ToString();
            txtPhAC2.Text = dt.Rows[0]["ph2_ac"].ToString();
            txtPh2.Text = dt.Rows[0]["phone2"].ToString();
            txtFaxCC.Text = dt.Rows[0]["fax_cc"].ToString();
            txtFaxAC.Text = dt.Rows[0]["fax_ac"].ToString();
            txtFax.Text = dt.Rows[0]["fax"].ToString();
            txtWebsite.Text = dt.Rows[0]["website"].ToString();

            txtGeoLatitude.Text = dt.Rows[0]["geo_latitude"].ToString();
            txtGeoLongitude.Text = dt.Rows[0]["geo_longitude"].ToString();
            txtProjectDrection.Text = dt.Rows[0]["direction_project_site"].ToString();

            //objPro.Project_Chairperson = DDLMemNameSpouse.SelectedItem.Text.ToString(); 
            //objPro.Committee_Members = strTopics; // Multiple members comes here
            //objPro.Beneficiaries = txtBeneficiaries.Text.ToString(); 

            string strImages = dt.Rows[0]["project_images"].ToString();
            if (strImages != "")
            {
                Session["ProjectImages"] = strImages;
            }


            //BindContacts(id);

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

            for (Int32 i = Convert.ToInt32(dt - 1); i >= 2005; i--)
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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Page.IsValid)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    UpdateProjects(id);
                }
                else
                {
                    AddProjects();
                }
            }
        }
    }
    protected void UploadImages()
    {
        

        string strSession = "";
        try
        {

            foreach (UploadedFile file in RadAsyncUpload1.UploadedFiles)
            {
                string strPath = "ProjectImages";
                string fileName = "";
                string ext = "";

                fileName = file.FileName;
                string strDate = System.DateTime.Now.ToString();
                strDate = strDate.Replace("/", "");
                strDate = strDate.Replace("-", "");
                strDate = strDate.Replace(":", "");
                strDate = strDate.Replace(" ", "");
                ext = fileName.Substring(fileName.LastIndexOf("."));
                string path = Server.MapPath("~/" + strPath + "/" + strDate + fileName);
                file.SaveAs(path);
                strSession = strSession + strDate + fileName + ",";
            }

            Session["ProjectImages"] = Session["ProjectImages"] + strSession.Remove(strSession.Length - 1);

        }
        catch { }
    }
    private void AddProjects()
    {
        if (RadAsyncUpload1.UploadedFiles.Count > 0)
        {
            Session["ProjectImages"] = null;
            UploadImages();
        }

        /************Code for find IP address of user's machine**********/
        string ipaddress;
        ipaddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        if (ipaddress == "" || ipaddress == null)
            ipaddress = Request.ServerVariables["REMOTE_ADDR"];
        /***************************************************************/

        ProjectsBLL objPro = new ProjectsBLL();

       
        int clubNo = int.Parse(DDLClub.SelectedValue.ToString());

        objPro.ClubName = DDLClub.SelectedItem.Text.Trim();
        objPro.ClubPresident = "";

        objPro.Project_Year = DDLYears.SelectedItem.Text.Trim();
        objPro.Project_Title = txtProName.Text.ToString();
        objPro.Start_Date = DateTime.Parse(dtStartDate.SelectedDate.ToString());
        objPro.End_Date = DateTime.Parse(dtEndDate.SelectedDate.ToString());
        objPro.ClubNo = clubNo;
        objPro.Project_Type = rbtnProjectType.SelectedItem.Text.Trim();
        objPro.Project_Location = txtProjectLocation.Text.ToString();
        objPro.Project_Description = txtDesc.Text.ToString();
        objPro.Project_Cost = decimal.Parse(txtProjectCost.Text.ToString());
        objPro.Avenue_of_Covered = ddlAvenueCovered.SelectedItem.Text.ToString();
        objPro.Project_Chairperson = DDLChairperson.SelectedItem.Text.ToString();

        string strTopics = "";
        foreach (ListItem li in listTopics.Items)
        {
            strTopics = strTopics + li.Text + ",";
        }

        objPro.Committee_Members = strTopics; // Multiple members comes here

        objPro.Beneficiaries = txtBeneficiaries.Text.ToString();

        try
        {
            string strImages = Session["ProjectImages"].ToString();
            objPro.Project_Images = strImages;
        }
        catch { objPro.Project_Images = ""; }

        objPro.Partner_Club_District_no = "";

        string strPartnerClub = "";
        foreach (ListItem li in listPartnerClub.Items)
        {
            strPartnerClub = strPartnerClub + li.Text + ",";
        }

        objPro.Partner_Club_Name = strPartnerClub;
        objPro.District_Grant_no = txtDistGrantNo.Text.ToString();
        objPro.District_Global_no = txtGlobalGrantNo.Text.ToString();
        objPro.Address1 = txtAdd1.Text.ToString();
        objPro.Address2 = txtAdd2.Text.ToString();
        try
        {
            objPro.Pin = int.Parse(txtPin.Text.ToString());
        }
        catch { objPro.Pin = 0; }
        objPro.City = txtCity.Text.ToString();
        objPro.State = txtState.Text.ToString();
        objPro.Country = txtCountry.Text.ToString();
        objPro.Ph1_AC = txtPhAC1.Text.ToString();
        objPro.Ph1_CC = txtPhCC1.Text.ToString();
        objPro.Phone1 = txtPh1.Text.ToString();
        objPro.Ph2_AC = txtPhAC2.Text.ToString();
        objPro.Ph2_CC = txtPhCC2.Text.ToString();
        objPro.Phone2 = txtPh2.Text.ToString();
        objPro.Fax_CC = txtFaxCC.Text.ToString();
        objPro.Fax_AC = txtFaxAC.Text.ToString();
        objPro.Fax = txtFax.Text.ToString();
        objPro.Website = txtWebsite.Text.ToString();
        objPro.GEO_Latitude = txtGeoLatitude.Text.ToString();
        objPro.GEO_longitude = txtGeoLongitude.Text.ToString();
        objPro.Direction_Project_Site = txtProjectDrection.Text.ToString();
        objPro.Ipaddress = ipaddress;

        int exe = objPro.AddPrtoject();

        if (exe > 0)
        {
            try
            {
                string jv = "<script>alert('Record Added Successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
            catch { }

            int pid = GetProjectId();
            UpdateProjectContacts(pid);
            Clear();
        }
    }
    private void UpdateProjects(int id)
    {


        if (RadAsyncUpload1.UploadedFiles.Count > 0)
        {
            if (Session["ProjectImages"] != null)
            {
                Session["ProjectImages"] = Session["ProjectImages"] + ",";
            }
            UploadImages();
        }

        int clubNo = int.Parse(DDLClub.SelectedValue.ToString());
  ProjectsBLL objPro = new ProjectsBLL();
        objPro.ClubName = DDLClub.SelectedItem.Text.Trim();
        objPro.ClubPresident = "";



      
        objPro.ID = id;
        objPro.Project_Year = DDLYears.SelectedItem.Text.Trim();
        objPro.Project_Title = txtProName.Text.ToString();
        objPro.Start_Date = DateTime.Parse(dtStartDate.SelectedDate.ToString());
        objPro.End_Date = DateTime.Parse(dtEndDate.SelectedDate.ToString());
        objPro.ClubNo = clubNo;
        objPro.Project_Type = rbtnProjectType.SelectedItem.Text.Trim();
        objPro.Project_Location = txtProjectLocation.Text.ToString();
        objPro.Project_Description = txtDesc.Text.ToString();
        objPro.Project_Cost = decimal.Parse(txtProjectCost.Text.ToString());
        objPro.Avenue_of_Covered = ddlAvenueCovered.SelectedItem.Text.ToString();
        objPro.Project_Chairperson = DDLChairperson.SelectedItem.Text.ToString();

        string strTopics = "";
        foreach (ListItem li in listTopics.Items)
        {
            strTopics = strTopics + li.Text + ",";
        }

        objPro.Committee_Members = strTopics; // Multiple members comes here

        objPro.Beneficiaries = txtBeneficiaries.Text.ToString();

        try
        {
            string strImages = Session["ProjectImages"].ToString();
            //strImages = strImages.Remove(strImages.Length - 1);
            objPro.Project_Images = strImages;
        }
        catch { objPro.Project_Images = ""; }

        objPro.Partner_Club_District_no = "";

        string strPartnerClub = "";
        foreach (ListItem li in listPartnerClub.Items)
        {
            strPartnerClub = strPartnerClub + li.Text + ",";
        }

        objPro.Partner_Club_Name = strPartnerClub;
        objPro.District_Grant_no = txtDistGrantNo.Text.ToString();
        objPro.District_Global_no = txtGlobalGrantNo.Text.ToString();
        objPro.Address1 = txtAdd1.Text.ToString();
        objPro.Address2 = txtAdd2.Text.ToString();
        objPro.Pin = int.Parse(txtPin.Text.ToString());
        objPro.City = txtCity.Text.ToString();
        objPro.State = txtState.Text.ToString();
        objPro.Country = txtCountry.Text.ToString();
        objPro.Ph1_AC = txtPhAC1.Text.ToString();
        objPro.Ph1_CC = txtPhCC1.Text.ToString();
        objPro.Phone1 = txtPh1.Text.ToString();
        objPro.Ph2_AC = txtPhAC2.Text.ToString();
        objPro.Ph2_CC = txtPhCC2.Text.ToString();
        objPro.Phone2 = txtPh2.Text.ToString();
        objPro.Fax_CC = txtFaxCC.Text.ToString();
        objPro.Fax_AC = txtFaxAC.Text.ToString();
        objPro.Fax = txtFax.Text.ToString();
        objPro.Website = txtWebsite.Text.ToString();
        objPro.GEO_Latitude = txtGeoLatitude.Text.ToString();
        objPro.GEO_longitude = txtGeoLongitude.Text.ToString();
        objPro.Direction_Project_Site = txtProjectDrection.Text.ToString();

        int exe = objPro.UpdatePrtoject();
        if (exe > 0)
        {
            ShowMsg("Record Updated Successfully", "view_rotary_projects.aspx");
        }
    }
    private void AddProject_ContactPersons()
    {
        //ProjectsBLL objPro = new ProjectsBLL();
        //objPro.Project_id = 0;
        //objPro.Title = ddlCtitle.SelectedItem.Text;
        //objPro.Fname = txtCFName.Text.ToString();
        //objPro.Mname = txtCMName.Text.ToString();
        //objPro.Lname = txtCLName.Text.ToString();
        //objPro.Designation = txtCDesignation.Text.ToString();
        //objPro.EmailId = txtCEmail.Text.ToString();
        //objPro.Mobile_cc = txtCMobCC.Text.ToString();
        //objPro.Mobile = txtCMobile.Text.ToString();
        //int exe = objPro.AddPrtojectContact();
        //if (exe > 0)
        //{
        //   // BindContacts(0);
        //}
    }
    //private void BindContacts(int id)
    //{
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "SELECT * FROM project_contact_tbl WHERE project_id = " + id + " ORDER BY [id] DESC";
    //    DataTable dt = new DataTable();
    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        RadGrid1.Visible = true;
    //        RadGrid1.DataSource = dt;
    //        RadGrid1.DataBind();
    //    }
    //    else
    //    {
    //        RadGrid1.Visible = false;
    //    }
    //}
    protected void btncancel_Click(object sender, EventArgs e)
    {

    }
    protected void rbtnProjectType_SelectedIndexChanged(object sender, EventArgs e)
    {
        rbtnDistNo.SelectedIndex = 0;
        txtDistrictNo.Visible = false;

        string type = rbtnProjectType.SelectedValue.ToString();

        if (type == "0")
        {
            TRDistType_Joint.Visible = false;
            TRPartnerClub_Joint.Visible = false;
            TRDistrictGrantNo.Visible = false;
            TRGlobalGrantNo.Visible = false;

        }
        if (type == "1")
        {
            TRDistType_Joint.Visible = true;
            TRPartnerClub_Joint.Visible = true;
            TRDistrictGrantNo.Visible = false;
            TRGlobalGrantNo.Visible = false;

        }
        if (type == "2")
        {
            TRDistType_Joint.Visible = true;
            TRPartnerClub_Joint.Visible = true;
            TRDistrictGrantNo.Visible = true;
            TRGlobalGrantNo.Visible = false;
        }
        if (type == "3")
        {
            TRDistType_Joint.Visible = true;
            TRPartnerClub_Joint.Visible = true;
            TRDistrictGrantNo.Visible = false;
            TRGlobalGrantNo.Visible = true;
        }
    }
    //protected void rbtnDist_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string districtType = rbtnDist.SelectedValue.ToString();
    //    if (districtType == "0")
    //    {
    //        TRPartnerClub_Joint.Visible = true;
    //        TRDistrictNo_Joint.Visible = false;
    //    }
    //    else
    //    {
    //        TRPartnerClub_Joint.Visible = false;
    //        TRDistrictNo_Joint.Visible = true;
    //    }
    //}

    //protected void rbtnDistGlobal_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    string districtTypeGlobal = rbtnDistGlobal.SelectedValue.ToString();
    //    if (districtTypeGlobal == "0")
    //    {
    //        TRDistrictNo_Global.Visible = true;
    //        TRDistNoGlobal.Visible = false;
    //    }
    //    else
    //    {
    //        TRDistNoGlobal.Visible = true;
    //        TRDistrictNo_Global.Visible = false;

    //    }
    //}
    protected void btnAddmore_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ListItem li = new ListItem();
            TRTopics.Visible = true;
            li.Text = DDLMembers.SelectedItem.Text.ToString();
            li.Value = DDLMembers.SelectedValue.ToString();
            listTopics.Items.Add(li);
            DDLMembers.SelectedIndex = 0;
        }
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        try
        {
            if (listTopics.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listTopics.SelectedItem.Text.ToString();
                li.Value = listTopics.SelectedValue.ToString();

                listTopics.Items.Remove(li);
            }
            else
            {
                TRTopics.Visible = false;
            }
        }
        catch
        {
        }
    }
    private void BindMembers(int clubId)
    {
        DBconnection obj = new DBconnection();
        //obj.SetCommandQry = "select * from ViewMembers where MemberId=" + Session["MemberId"].ToString() + " and Status='True' order by Name asc";
        obj.SetCommandQry = "select * from ViewMembers where ri_club_no= " + clubId + " and MemType='Active' order by Name asc";

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLMembers.DataTextField = "Name";
        DDLMembers.DataValueField = "MemberId";

        DDLMembers.DataSource = dt;
        DDLMembers.DataBind();
        //DDLMember.Items.Insert(0, "Select");


        //DDLChairperson.DataTextField = "Name";
        //DDLChairperson.DataValueField = "MemberId";

        //DDLChairperson.DataSource = dt;
        //DDLChairperson.DataBind();

    }
    private void BindMembersSpouses(int clubId)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select * from View_MemberSpouse where ri_club_no= " + clubId + " order by Name asc";

        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();

        DDLChairperson.DataTextField = "Name";
        DDLChairperson.DataValueField = "memberId";

        DDLChairperson.DataSource = dt;
        DDLChairperson.DataBind();
        //DDLMember.Items.Insert(0, "Select");
    }
    protected void btnAddMoreContacts_Click(object sender, EventArgs e)
    {
        AddProject_ContactPersons();
    }
    private int GetProjectId()
    {
        int pid = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_GetProjectID";
        object o = obj.ExecuteScalar().ToString();
        pid = int.Parse(o.ToString());
        return pid;
    }
    private void UpdateProjectContacts(int pid)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateProjectContacts";
            obj.AddParam("@project_id", pid);
            int exe = obj.ExecuteNonQuery();
        }
        catch { }

    }
    private void Clear()
    {
        txtAdd1.Text = "";
        txtAdd2.Text = "";
        txtBeneficiaries.Text = "";
        //txtCDesignation.Text = "";
        //txtCEmail.Text = "";
        //txtCFName.Text = "";
        //txtCity.Text = "";
        //txtCLName.Text = "";
        //txtCMName.Text = "";
        //txtCMobCC.Text = "";
        //txtCMobile.Text = "";
        txtCountry.Text = "";
        txtDesc.Text = "";
        txtDistClubName.Text = "";
        txtDistGrantNo.Text = "";
        txtDistrictNo.Text = "";
        txtFax.Text = "";
        txtFaxAC.Text = "";
        txtFaxCC.Text = "";
        txtGeoLatitude.Text = "";
        txtGeoLongitude.Text = "";
        txtGlobalGrantNo.Text = "";
        txtPh1.Text = "";
        txtPh2.Text = "";
        txtPhAC1.Text = "";
        txtPhAC2.Text = "";
        txtPhCC1.Text = "";
        txtPhCC2.Text = "";
        txtPin.Text = "";
        txtProjectCost.Text = "";
        txtProjectDrection.Text = "";
        txtProName.Text = "";
        txtState.Text = "";
        txtWebsite.Text = "";
        txtProjectLocation.Text = "";

        ddlAvenueCovered.SelectedIndex = 0;
        DDLClubName.SelectedIndex = 0;
        //DDLClubName2.SelectedIndex = 0;
        //ddlCtitle.SelectedIndex = 0;
        DDLMembers.SelectedIndex = 0;
        DDLChairperson.SelectedIndex = 0;
        DDLYears.SelectedIndex = 0;
        rbtnDistNo.SelectedIndex = 0;
        rbtnProjectType.SelectedIndex = 0;
        listPartnerClub.Items.Clear();
        listTopics.Items.Clear();

        TRPartnerClub_JointList.Visible = false;
        txtDistClubName.Visible = false;
        txtDistrictNo.Visible = false;
        TRPartnerClub_JointList.Visible = false;
        TRDistType_Joint.Visible = false;
        TRPartnerClub_Joint.Visible = false;
        TRDistrictGrantNo.Visible = false;
        TRGlobalGrantNo.Visible = false;

    }
    protected void rbtnDistNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        int value = int.Parse(rbtnDistNo.SelectedValue.ToString());
        txtDistrictNo.Text = "";
        txtDistClubName.Text = "";
        if (value == 0)
        {
            DDLClubName.Visible = true;
            txtDistClubName.Visible = false;
            txtDistrictNo.Visible = false;
        }

        if (value == 1)
        {
            DDLClubName.Visible = false;
            txtDistClubName.Visible = true;
            txtDistrictNo.Visible = true;
        }
    }
    protected void btnPartnerClub_Click(object sender, EventArgs e)
    {
        TRPartnerClub_JointList.Visible = true;
        int value = int.Parse(rbtnDistNo.SelectedValue.ToString());

        if (Page.IsValid)
        {
            ListItem li = new ListItem();
            listPartnerClub.Visible = true;
            if (value == 0)
                li.Text = "3141 - " + DDLClubName.SelectedItem.Text.ToString();
            else
                li.Text = txtDistrictNo.Text + " - " + txtDistClubName.Text.ToString();

            listPartnerClub.Items.Add(li);

            txtDistrictNo.Text = "";
            txtDistClubName.Text = "";
        }
    }
    protected void btnPartnerClubRemove_Click(object sender, EventArgs e)
    {
        try
        {
            if (listPartnerClub.Items.Count > 0)
            {
                ListItem li = new ListItem();
                li.Text = listPartnerClub.SelectedItem.Text.ToString();

                listPartnerClub.Items.Remove(li);
            }
            else
            {
                listPartnerClub.Visible = false;
            }
        }
        catch
        {
        }
    }
    public void ShowMsg(string msg, string redirectUrl)
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
    protected void RadGrid1_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_DeleteProjectContacts";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                // RadGrid1.DataBind();
                //BindContacts(0);

                //int idd = int.Parse(Request.QueryString["id"].ToString());
                // GetProjects(idd);
                // BindImages(idd);
            }
        }

        if (e.CommandName == "Edit")
        {
            string i = e.CommandArgument.ToString();
            int id = int.Parse(i.ToString());
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetProjectContactsById";
            obj.AddParam("@id", id);
            if (obj.ExecuteNonQuery() > 0)
            {
                GetContacts(id);
            }
        }

    }
    private void GetContacts(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM project_contact_tbl WHERE id = " + id + " ORDER BY [id] DESC";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            //txtCFName.Text = dt.Rows[0]["fname"].ToString();
            //txtCMName.Text = dt.Rows[0]["mname"].ToString();
            //txtCLName.Text = dt.Rows[0]["lname"].ToString();
            //txtCDesignation.Text = dt.Rows[0]["designation"].ToString();
            //txtCEmail.Text = dt.Rows[0]["email"].ToString();
            //txtCMobCC.Text = dt.Rows[0]["mobile_cc"].ToString();
            //txtCMobile.Text = dt.Rows[0]["mobile"].ToString();
        }
        else
        {
            //RadGrid1.Visible = false;
        }
    }
    protected void Insert(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
        ClearCP();
    }
    //protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex != e.Row.RowIndex)
    //    {
    //        //(e.Row.Cells[5].Controls[5] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
    //    }
    //}
    private void ClearCP()
    {
        txtName.Text = "";
        txtDesignation.Text = "";
        txtEmailId.Text = "";
        txtMobile.Text = "";
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label lblImgPath = (Label)e.Item.FindControl("lblImgPath");
        if (lblImgPath != null)
        {
            string strImgPath = lblImgPath.Text;
            Image img1 = (Image)e.Item.FindControl("img1");
            img1.Visible = true;
            img1.ImageUrl = "../ProjectImages/" + strImgPath.ToString();
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string strImages = "";
        string strUpdatedImages = "";
        if (e.CommandName == "Delete")
        {
            int id = Int32.Parse(Request.QueryString["id"].ToString());
            string[] aImages = Session["ProjectImages"].ToString().Split(',');
            strImages = e.CommandArgument.ToString();
            for (int i = 0; i <= aImages.Length - 1; i++)
            {
                if (strImages != aImages[i])
                {
                    strUpdatedImages = strUpdatedImages + aImages[i] + ",";
                }
            }

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateProjectImages";
            if (aImages.Length == 1)
                obj.AddParam("@project_images", "");
            else
                obj.AddParam("@project_images", strUpdatedImages.Remove(strUpdatedImages.Length - 1));

            obj.AddParam("@id", id);

            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                BindImages(id);
            }
        }
    }
    protected void DDLClub_SelectedIndexChanged(object sender, EventArgs e)
    {
        int clubId = int.Parse(DDLClub.SelectedValue.ToString());

        BindMembers(clubId);
        BindMembersSpouses(clubId);
    }
}