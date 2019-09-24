using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_view_project_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {               
                int id = int.Parse(Request.QueryString["id"].ToString());
                GetProjects(id);
                BindImages(id);
                BindContacts(id);
            }
        }
    }
    private void GetProjects(int id)
    {
        ProjectsBLL objPro = new ProjectsBLL();
        objPro.ID = id;

        DataTable dt = new DataTable();
        dt = objPro.GetPrtojects();
        if (dt.Rows.Count > 0)
        {
            lblProjectYear.Text = dt.Rows[0]["project_year"].ToString();
            lblProjectTitle.Text = dt.Rows[0]["project_title"].ToString();
            lblStartDate.Text = dt.Rows[0]["start_date"].ToString();
            lblEndDate.Text = dt.Rows[0]["end_date"].ToString();
            lblProjectType.Text = dt.Rows[0]["project_type"].ToString();
            lblProjectLocation.Text = dt.Rows[0]["project_location"].ToString();
            lblProjectDescription.Text = dt.Rows[0]["project_description"].ToString();
            lblProjectCost.Text = dt.Rows[0]["project_cost"].ToString();
            lblAvenueOfCovered.Text = dt.Rows[0]["avenue_of_covered"].ToString();
            lblProjectChairperson.Text = dt.Rows[0]["project_chairperson"].ToString();

            lblCommitteeMembers.Text = dt.Rows[0]["committee_members"].ToString();
            lblBeneficiaries.Text = dt.Rows[0]["beneficiaries"].ToString();
            // txtProName.Text = dt.Rows[0]["project_images"].ToString();
            // txtProName.Text = dt.Rows[0]["partner_club_district_no"].ToString();
            // txtProName.Text = dt.Rows[0]["partner_club_name"].ToString();


            lblDistrictGrantNo.Text = dt.Rows[0]["district_grant_no"].ToString();
            lblDistrictGlobalNo.Text = dt.Rows[0]["district_global_no"].ToString();
            lblAdd.Text = dt.Rows[0]["add1"].ToString() + " " + dt.Rows[0]["add2"].ToString();
            //txtAdd2.Text = dt.Rows[0]["add2"].ToString();
            lblCity.Text = dt.Rows[0]["city"].ToString();
            lblPin.Text = dt.Rows[0]["pin"].ToString();
            lblState.Text = dt.Rows[0]["state"].ToString();
            lblCountry.Text = dt.Rows[0]["country"].ToString();


            lblPhone1.Text = dt.Rows[0]["ph1_cc"].ToString() + " " + dt.Rows[0]["ph1_ac"].ToString() + " " + dt.Rows[0]["phone1"].ToString();
            lblPhone2.Text = dt.Rows[0]["ph2_cc"].ToString() + " " + dt.Rows[0]["ph2_ac"].ToString() + " " + dt.Rows[0]["phone2"].ToString();
            lblFax.Text = dt.Rows[0]["fax_cc"].ToString() + " " + dt.Rows[0]["fax_ac"].ToString() + " " + dt.Rows[0]["fax"].ToString();
            //txtPhAC1.Text = dt.Rows[0]["ph1_ac"].ToString();
            //txtPh1.Text = dt.Rows[0]["phone1"].ToString();
            //txtPhCC2.Text = dt.Rows[0]["ph2_cc"].ToString();
            //txtPhAC2.Text = dt.Rows[0]["ph2_ac"].ToString();
            //txtPh2.Text = dt.Rows[0]["phone2"].ToString();
            //txtFaxCC.Text = dt.Rows[0]["fax_cc"].ToString();
            //txtFaxAC.Text = dt.Rows[0]["fax_ac"].ToString();
            //txtFax.Text = dt.Rows[0]["fax"].ToString();
            //txtWebsite.Text = dt.Rows[0]["website"].ToString();

            //txtGeoLatitude.Text = dt.Rows[0]["geo_latitude"].ToString();
            //txtGeoLongitude.Text = dt.Rows[0]["geo_longitude"].ToString();
            //txtProjectDrection.Text = dt.Rows[0]["direction_project_site"].ToString();

            //objPro.Project_Chairperson = DDLMemNameSpouse.SelectedItem.Text.ToString(); 
            //objPro.Committee_Members = strTopics; // Multiple members comes here
            //objPro.Beneficiaries = txtBeneficiaries.Text.ToString(); 

            string strImages = dt.Rows[0]["project_images"].ToString();
            if (strImages != "")
            {
                Session["ProjectImages"] = strImages;
            }

        }
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

    private void BindContacts(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM project_contact_tbl WHERE project_id = " + id + " ORDER BY [id] DESC";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            RadGrid1.Visible = true;
            RadGrid1.DataSource = dt;
            RadGrid1.DataBind();
        }
        else
        {
            RadGrid1.Visible = false;
        }
    }
}