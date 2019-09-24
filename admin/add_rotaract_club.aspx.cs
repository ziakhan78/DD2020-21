using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class admin_add_rotaract_club : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                BindDays();
                BindMonth();
                BindYear();

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetRotaractClub(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }        
    }

    #region Bind days month year
    private void BindDays()
    {
        string s = "";
        try
        {

            for (int i = 1; i <= 31; i++)
            {
                if (i <= 9)
                {
                    s = "0" + i;
                    //i = int.Parse(s.ToString());
                }
                else
                {
                    s = i.ToString();
                }
                DDLDays.Items.Add(s.ToString());
                DDLpbDay.Items.Add(s.ToString());
                DDLsbDay.Items.Add(s.ToString());

            }
            DDLDays.Items.Insert(0, "Day");
            DDLpbDay.Items.Insert(0, "Day");
            DDLsbDay.Items.Insert(0, "Day");


        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void BindMonth()
    {
        try
        {

            for (int i = 1; i <= 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = new DateTime(1900, i, 1).ToString("MMMM");
                item.Value = i.ToString();
                DDLMonth.Items.Add(item);
                DDLpbMonth.Items.Add(item);
                DDLsbMonth.Items.Add(item);
            }
            DDLMonth.Items.Insert(0, "Month");
            DDLpbMonth.Items.Insert(0, "Month");
            DDLsbMonth.Items.Insert(0, "Month");

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    private void BindYear()
    {
        try
        {
            for (Int32 i = 1920; i <= Convert.ToInt32(DateTime.Now.Year); i++)
            {
                DDLYear.Items.Add(i.ToString());
                DDLpbYear.Items.Add(i.ToString());
                DDLsbYear.Items.Add(i.ToString());
            }
            DDLYear.Items.Insert(0, "Year");
            DDLpbYear.Items.Insert(0, "Year");
            DDLsbYear.Items.Insert(0, "Year");

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }
    #endregion

    private void GetRotaractClub(int id)
    {

        RotaractClub rc = new RotaractClub();
        rc.Id = id;

        DataTable dt = new DataTable();
        dt = rc.GetRotaractClub();
        if (dt.Rows.Count > 0)
        {
            txtClubName.Text = dt.Rows[0]["club_name"].ToString();
            txtClubNo.Text = dt.Rows[0]["club_no"].ToString();
            string []charterDate = dt.Rows[0]["charter_date"].ToString().Split('/');            
            DDLDays.SelectedItem.Text= charterDate[0].ToString();
            DDLMonth.SelectedItem.Text = charterDate[1].ToString();
            DDLYear.SelectedItem.Text = charterDate[2].ToString();

            DDLSponser.SelectedItem.Text = dt.Rows[0]["sponserd"].ToString();
            txtNoOfMembers.Text = dt.Rows[0]["no_of_members"].ToString();

            //President

            txtPFName.Text = dt.Rows[0]["pf_name"].ToString();
            txtPMName.Text = dt.Rows[0]["pm_name"].ToString();
            txtPLName.Text = dt.Rows[0]["pl_name"].ToString();
            txtpemail.Text = dt.Rows[0]["pemailid1"].ToString();
            txtPemail2.Text = dt.Rows[0]["pemailid2"].ToString();
            txtmobcc.Text = dt.Rows[0]["pmobile1CC"].ToString();
            txtPmob1.Text = dt.Rows[0]["pmobile1"].ToString();
            txtmob2cc.Text = dt.Rows[0]["pmobile2CC"].ToString();
            txtPMob2.Text = dt.Rows[0]["pmobile2"].ToString();
            txtPBlackberry.Text = dt.Rows[0]["pblackberry"].ToString();
            txtRPhone.Text = dt.Rows[0]["pphone"].ToString();           

            string[] pdob = dt.Rows[0]["pdob"].ToString().Split('/');
            DDLpbDay.SelectedItem.Text = pdob[0].ToString();
            DDLpbMonth.SelectedItem.Text = pdob[1].ToString();
            DDLpbYear.SelectedItem.Text = pdob[2].ToString();

            //Secratary

            txtSFName.Text = dt.Rows[0]["sf_name"].ToString();
            txtSMName.Text = dt.Rows[0]["sm_name"].ToString();
            txtSLName.Text = dt.Rows[0]["sl_name"].ToString();
            txtSEmail1.Text = dt.Rows[0]["semailid1"].ToString();
            txtSEmail2.Text = dt.Rows[0]["semailid2"].ToString();
            txtSmob1cc.Text = dt.Rows[0]["smobile1CC"].ToString();
            txtSMob1.Text = dt.Rows[0]["smobile1"].ToString();
            txtSmob2cc.Text = dt.Rows[0]["smobile2CC"].ToString();
            txtSMob2.Text = dt.Rows[0]["smobile2"].ToString();
            txtSBlackberry.Text = dt.Rows[0]["sblackberry"].ToString();
            txtSPhone.Text = dt.Rows[0]["sphone"].ToString();

            string[] sdob = dt.Rows[0]["sdob"].ToString().Split('/');
            DDLsbDay.SelectedItem.Text = sdob[0].ToString();
            DDLsbMonth.SelectedItem.Text = sdob[1].ToString();
            DDLsbYear.SelectedItem.Text = sdob[2].ToString();
           

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
                    UpdateRotaractClub(id);
                }
                else
                {
                    AddRotaractClub();
                }
            }
        }
    }

    private void AddRotaractClub()
    {
        RotaractClub rc = new RotaractClub();
        rc.Club_name = txtClubName.Text.Trim().ToString();
        try
        {
            rc.Club_no = int.Parse(txtClubNo.Text.Trim().ToString());
        }
        catch
        {
            rc.Club_no = 0;
        }
        rc.Charter_date = DDLDays.SelectedItem.Text.Trim().ToString() + "/" + DDLMonth.SelectedItem.Text.Trim().ToString() + "/" + DDLYear.SelectedItem.Text.Trim().ToString();
        rc.Sponserd = DDLSponser.SelectedItem.Text.Trim().ToString();
        try
        {
            rc.No_of_members = int.Parse(txtNoOfMembers.Text.Trim().ToString());
        }
        catch
        {
            rc.No_of_members = 0;
        }

        rc.Pf_name = txtPFName.Text.Trim().ToString();
        rc.Pm_name = txtPMName.Text.Trim().ToString();
        rc.Pl_name = txtPLName.Text.Trim().ToString();
        rc.Pemail1 = txtpemail.Text.Trim().ToString();
        rc.Pemail2 = txtPemail2.Text.Trim().ToString();
        rc.Pmobile1CC = txtmobcc.Text.Trim().ToString();
        rc.Pmobile1 = txtPmob1.Text.Trim().ToString();
        rc.Pmobile2CC = txtmob2cc.Text.Trim().ToString();
        rc.Pmobile2 = txtPMob2.Text.Trim().ToString();
        rc.Pblackberry = txtPBlackberry.Text.Trim().ToString();
        rc.Pphone_resi = txtRPhone.Text.Trim().ToString();
        rc.Pdob = DDLpbDay.SelectedItem.Text.Trim().ToString() + "/" + DDLpbMonth.SelectedItem.Text.Trim().ToString() + "/" + DDLpbYear.SelectedItem.Text.Trim().ToString();


        rc.Sf_name = txtSFName.Text.Trim().ToString();
        rc.Sm_name = txtSMName.Text.Trim().ToString();
        rc.Sl_name = txtSLName.Text.Trim().ToString();
        rc.Semail1 = txtSEmail1.Text.Trim().ToString();
        rc.Semail2 = txtSEmail2.Text.Trim().ToString();
        rc.Smobile1CC = txtSmob1cc.Text.Trim().ToString();
        rc.Smobile1 = txtSMob1.Text.Trim().ToString();
        rc.Smobile2CC = txtSmob2cc.Text.Trim().ToString();
        rc.Smobile2 = txtSMob2.Text.Trim().ToString();
        rc.Sblackberry = txtSBlackberry.Text.Trim().ToString();
        rc.Sphone_resi = txtSPhone.Text.Trim().ToString();
        rc.Sdob = DDLsbDay.SelectedItem.Text.Trim().ToString() + "/" + DDLsbMonth.SelectedItem.Text.Trim().ToString() + "/" + DDLsbYear.SelectedItem.Text.Trim().ToString();



        int exe = rc.AddRotaractClub();
        if (exe > 0)
        {
            clear();
            string jv = "<script>alert('Record Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
        }
    }

    private void UpdateRotaractClub(int id)
    {
        RotaractClub rc = new RotaractClub();
        rc.Id = id;
        rc.Club_name = txtClubName.Text.Trim().ToString();
        try
        {
            rc.Club_no = int.Parse(txtClubNo.Text.Trim().ToString());
        }
        catch
        {
            rc.Club_no = 0;
        }
        rc.Charter_date = DDLDays.SelectedItem.Text.Trim().ToString() + "/" + DDLMonth.SelectedItem.Text.Trim().ToString() + "/" + DDLYear.SelectedItem.Text.Trim().ToString();
        rc.Sponserd = DDLSponser.SelectedItem.Text.Trim().ToString();
        try
        {
            rc.No_of_members = int.Parse(txtNoOfMembers.Text.Trim().ToString());
        }
        catch
        {
            rc.No_of_members = 0;
        }


        rc.Pf_name = txtPFName.Text.Trim().ToString();
        rc.Pm_name = txtPMName.Text.Trim().ToString();
        rc.Pl_name = txtPLName.Text.Trim().ToString();
        rc.Pemail1 = txtpemail.Text.Trim().ToString();
        rc.Pemail2 = txtPemail2.Text.Trim().ToString();
        rc.Pmobile1CC = txtmobcc.Text.Trim().ToString();
        rc.Pmobile1 = txtPmob1.Text.Trim().ToString();
        rc.Pmobile2CC = txtmob2cc.Text.Trim().ToString();
        rc.Pmobile2 = txtPMob2.Text.Trim().ToString();
        rc.Pblackberry = txtPBlackberry.Text.Trim().ToString();
        rc.Pphone_resi = txtRPhone.Text.Trim().ToString();
        rc.Pdob = DDLpbDay.SelectedItem.Text.Trim().ToString() + "/" + DDLpbMonth.SelectedItem.Text.Trim().ToString() + "/" + DDLpbYear.SelectedItem.Text.Trim().ToString();


        rc.Sf_name = txtSFName.Text.Trim().ToString();
        rc.Sm_name = txtSMName.Text.Trim().ToString();
        rc.Sl_name = txtSLName.Text.Trim().ToString();
        rc.Semail1 = txtSEmail1.Text.Trim().ToString();
        rc.Semail2 = txtSEmail2.Text.Trim().ToString();
        rc.Smobile1CC = txtSmob1cc.Text.Trim().ToString();
        rc.Smobile1 = txtSMob1.Text.Trim().ToString();
        rc.Smobile2CC = txtSmob2cc.Text.Trim().ToString();
        rc.Smobile2 = txtSMob2.Text.Trim().ToString();
        rc.Sblackberry = txtSBlackberry.Text.Trim().ToString();
        rc.Sphone_resi = txtSPhone.Text.Trim().ToString();
        rc.Sdob = DDLsbDay.SelectedItem.Text.Trim().ToString() + "/" + DDLsbMonth.SelectedItem.Text.Trim().ToString() + "/" + DDLsbYear.SelectedItem.Text.Trim().ToString();



        int exe = rc.UpdateRotaractClub();
        if (exe > 0)
        {
            clear();

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "redirect", "location.href = 'view_rotaract_club.aspx'", true);
            //string jv = "<script>alert('Record Updated Successfully');</script>";
            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);

            showmsg("Record updated successfully !", "view_rotaract_club.aspx");
        }
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
    private void clear()
    {
        txtClubName.Text = "";
        txtClubNo.Text = "";
        txtmob2cc.Text = "";
        txtmobcc.Text = "";
        txtNoOfMembers.Text = "";
        txtPBlackberry.Text = "";
        txtpemail.Text = "";
        txtPemail2.Text = "";
        txtPFName.Text = "";
        txtPLName.Text = "";
        txtPMName.Text = "";
        txtPmob1.Text = "";
        txtPMob2.Text = "";
        txtRPhAC1.Text = "";
        txtRPhCC1.Text = "";
        txtRPhone.Text = "";
        txtSBlackberry.Text = "";
        txtSEmail1.Text = "";
        txtSEmail2.Text = "";
        txtSFName.Text = "";
        txtSLName.Text = "";
        txtSMName.Text = "";
        txtSMob1.Text = "";
        txtSMob2.Text = "";
        txtSPhone.Text = "";
        txtSmob1cc.Text = "";
        txtSmob2cc.Text = "";
        txtSRPhCC1.Text = "";
        txtSRPhAC1.Text = "";

        DDLDays.ClearSelection();
        DDLMonth.ClearSelection();
        DDLpbDay.ClearSelection();
        DDLpbMonth.ClearSelection();
        DDLpbYear.ClearSelection();
        DDLsbDay.ClearSelection();
        DDLsbMonth.ClearSelection();
        DDLsbYear.ClearSelection();
        DDLSponser.ClearSelection();
        DDLYear.ClearSelection();
    }
    protected void CVClubname_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVClubname.Enabled = false;
        }
        else
        {

            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select club_name from rotaract_club_tbl where club_name='" + txtClubName.Text.Trim().ToString() + "'";
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
}

