using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_dist_officers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
               // TRTopics.Visible = false;
                RFVDesig.Visible = true;

                BindTime();
                BindYears();
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetDistOfficer(id);                   
                }
            }
        }
        else
        {
            Session.Abandon();
            Server.Transfer("Default.aspx");
        }
    }

    private void BindYears()
    {
        try
        {
            for (Int32 i = Convert.ToInt32(DateTime.Now.Year - 1); i >= 1980; i--)
            {
                string dt = i + " - " + (i + 1);
                DDLYears.Items.Add(dt.ToString());
            }
            string currentyears = Convert.ToInt32(DateTime.Now.Year).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 1).ToString();
            string nextyears = Convert.ToInt32(DateTime.Now.Year + 1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year + 2).ToString();
            //DDLYears.Items.Insert(0, "Select");
            DDLYears.Items.Insert(1, nextyears);
            DDLYears.Items.Insert(2, currentyears);

        }
        catch (Exception E)
        {
            Response.Write(E.Message.ToString());
        }
    }

    //private void BindYears()
    //{
    //    try
    //    {
    //        for (Int32 i = 2000; i <= Convert.ToInt32(DateTime.Now.Year); i++)
    //        {
    //            string dt = i + " - " + (i + 1);
    //            DDLYears.Items.Add(dt.ToString());
    //        }
    //        //DDLYears.Items.Insert(0, "Year");
    //        string currentyears = Convert.ToInt32(DateTime.Now.Year-1).ToString() + " - " + Convert.ToInt32(DateTime.Now.Year).ToString();
    //        DDLYears.Items.Insert(0, currentyears);

    //    }
    //    catch (Exception E)
    //    {
    //        Response.Write(E.Message.ToString());
    //    }
    //}
        

    private void GetDistOfficer(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "sp_GetDistOfficers";
        obj.AddParam("@id", id);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {

            string type= dt.Rows[0]["type"].ToString();
            if (type == "District")
                rbtnType.SelectedIndex = 0;

            if (type == "Club")
                rbtnType.SelectedIndex = 1;

            if (type == "RI")
                rbtnType.SelectedIndex = 2;

            DDLMemName.DataSourceID = "DSdistMembers";
            DDLMemName.DataBind();
           
            GetDistDesignation(dt.Rows[0]["years"].ToString());
           
            DDLYears.SelectedItem.Text = dt.Rows[0]["years"].ToString();
           
            DDLMemName.SelectedItem.Text = dt.Rows[0]["Name"].ToString();
            DDLMemName.SelectedValue= dt.Rows[0]["Member_id"].ToString();


            GetProfile(int.Parse(dt.Rows[0]["Member_id"].ToString()));
           
            DDLDesig.SelectedItem.Text = dt.Rows[0]["designation"].ToString();
            DDLDesig.SelectedValue = dt.Rows[0]["DistDesigID"].ToString();           
        }
    }
    private void BindTime()
    {
        string s = "";
        for (int i = 1; i <= 12; i++)
        {
            if (i <= 9)
            {
                s = "0" + i;
            }
            else
            {
                s = i.ToString();
            }
            DDLh1.Items.Add(s.ToString());
            DDLh2.Items.Add(s.ToString());
            DDLh3.Items.Add(s.ToString());
            DDLh4.Items.Add(s.ToString());
        }

        DDLh1.Items.Insert(0, "HH");
        DDLh1.Items.Insert(1, "00");

        DDLh2.Items.Insert(0, "HH");
        DDLh2.Items.Insert(1, "00");

        DDLh3.Items.Insert(0, "HH");
        DDLh3.Items.Insert(1, "00");

        DDLh4.Items.Insert(0, "HH");
        DDLh4.Items.Insert(1, "00");

        for (int i = 5; i <= 55; i = i + 5)
        {
            if (i <= 9)
            {
                s = "0" + i;
            }
            else
            {
                s = i.ToString();
            }
            DDLm1.Items.Add(s.ToString());
            DDLm2.Items.Add(s.ToString());
            DDLm3.Items.Add(s.ToString());
            DDLm4.Items.Add(s.ToString());
        }
        DDLm1.Items.Insert(0, "MM");
        DDLm1.Items.Insert(1, "00");

        DDLm2.Items.Insert(0, "MM");
        DDLm2.Items.Insert(1, "00");

        DDLm3.Items.Insert(0, "MM");
        DDLm3.Items.Insert(1, "00");

        DDLm4.Items.Insert(0, "MM");
        DDLm4.Items.Insert(1, "00");
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                UpdateDistOfficers(id);
            }
            else
            {
                AddDistOfficers();
            }
        }
    }

    private void AddDistOfficers()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDistOfficers";

            obj.AddParam("@Member_id", int.Parse(DDLMemName.SelectedValue.ToString()));
            obj.AddParam("@years", DDLYears.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@type", rbtnType.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@DistDesigID", int.Parse(DDLDesig.SelectedValue.ToString()));

            //try
            //{
            //    obj.AddParam("@DistSubDesigID", int.Parse(DDLSubDesig.SelectedValue.ToString()));
            //}
            //catch
            //{
            //    obj.AddParam("@DistSubDesigID", 0);
            //}


            //string topics = "";
            //if (listTopics.Items.Count > 0)
            //{
            //    RFVDesig.Visible = false;

            //    foreach (ListItem li in listTopics.Items)
            //    {
            //        topics = topics + li.Value.Trim().ToString() + ";";
            //    }
            //}

            //if (int.Parse(DDLDesig.SelectedValue.ToString())!= 0)
            //{
            //    topics = topics + int.Parse(DDLDesig.SelectedValue.ToString());
            //}           


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void UpdateDistOfficers(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateDistOfficers";

            obj.AddParam("@id", id);
            obj.AddParam("@Member_id", int.Parse(DDLMemName.SelectedValue.ToString()));           
            obj.AddParam("@DistDesigID", int.Parse(DDLDesig.SelectedValue.ToString()));
            obj.AddParam("@years", DDLYears.SelectedItem.Text.Trim().ToString());
            obj.AddParam("@type", rbtnType.SelectedItem.Text.Trim().ToString());

            //string topics = "";
            //if (listTopics.Items.Count > 0)
            //{
            //    foreach (ListItem li in listTopics.Items)
            //    {
            //        topics = topics + li.Text.Trim().ToString() + ";";
            //    }
            //}

            //if (int.Parse(DDLDesig.SelectedValue.ToString()) != 0)
            //{
            //    topics = topics + int.Parse(DDLDesig.SelectedValue.ToString());
            //}

            //obj.AddParam("@DistDesigID", topics.TrimEnd(';'));
           


            int exe = obj.ExecuteNonQuery();
            if (exe > 0)
            {
                clear();
                showmsg("Record has been updated successfully !", "view_dist_officers.aspx");
            }
        }
        catch { }
    }

    private void clear()
    {
        DDLYears.SelectedIndex = 0;
        DDLMemName.SelectedIndex = 0;
        DDLDesig.SelectedIndex = 0;
        lblClubName.Text = "";
        lbldoj.Text = "";
        lblMemNo.Text = "";
        lblyrsInRotary.Text = "";
       // listTopics.Items.Clear();        
       // TRTopics.Visible = false;
    }
    protected void DDLMemName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = int.Parse(DDLMemName.SelectedValue.ToString());//int.Parse(Request.QueryString["id"].ToString());
        GetProfile(id);
    }

    private void GetProfile(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetDistMemberforDistOffi";
            obj.AddParam("@MemberId", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                lblMemNo.Text = dt.Rows[0]["MembershipNo"].ToString();
                DateTime dtdoj = DateTime.Parse(dt.Rows[0]["doj"].ToString());               

                if (dtdoj.Year == 1900)
                {
                    lbldoj.Text = "";
                    lblyrsInRotary.Text = "";
                }
                else
                {
                    string years = CalculateAge(dtdoj);
                    lblyrsInRotary.Text = years;
                    lbldoj.Text = dtdoj.Date.ToLongDateString();
                }
               
                lblClubName.Text = dt.Rows[0]["club_name"].ToString();
            }
        }
        catch { }
    }
    private string CalculateAge(DateTime birthdate)
    {
        string yearsMonth = "";
        if (DateTime.Now.Month < birthdate.Month || (DateTime.Now.Month == birthdate.Month && DateTime.Now.Day < birthdate.Day))
        {
            int years = (DateTime.Now.Year - birthdate.Year) - 1;
            //int days = DateTime.Now.Day - birthdate.Day;
            int month = 12 + (DateTime.Now.Month - birthdate.Month);
            if (month > 1)
            {
                yearsMonth = years + " Years " + month + " Months ";
            }
            else
            {
                yearsMonth = years + " Years " + month + " Month ";
            }
        }
        else
        {
            int years = DateTime.Now.Year - birthdate.Year;
            //int days = DateTime.Now.Day - birthdate.Day;
            int month = DateTime.Now.Month - birthdate.Month;
            if (month > 1)
            {
                yearsMonth = years + " Years " + month + " Months ";
            }
            else
            {
                yearsMonth = years + " Years " + month + " Month ";
            }
        }

        return yearsMonth;
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
    //protected void btnAddmore_Click(object sender, EventArgs e)
    //{
    //    if (Page.IsValid)
    //    {
    //        ListItem li = new ListItem();
    //        TRTopics.Visible = true;

    //        li.Text = DDLDesig.SelectedItem.Text.ToString();
    //        li.Value = DDLDesig.SelectedValue.ToString();
    //        listTopics.Items.Add(li);
    //        DDLDesig.SelectedIndex = 0;
    //    }
    //}
    //protected void btnRemove_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        if (listTopics.Items.Count > 0)
    //        {
    //            ListItem li = new ListItem();
    //            li.Text = listTopics.SelectedItem.Text.ToString();
    //            li.Value = listTopics.SelectedValue.ToString();

    //            listTopics.Items.Remove(li);
    //        }
    //        else
    //        {
    //            TRTopics.Visible = false;
    //        }
    //    }
    //    catch
    //    {
    //    }
    //}
    protected void CVMember_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (Request.QueryString["id"] != null)
        {
            CVMember.Enabled = false;
        }
        else
        {
            try
            {
                DBconnection obj = new DBconnection();
                obj.SetCommandQry = "select Member_id from dist_officers_tbl where years='"+DDLYears.SelectedItem.Text.Trim()+"' and Member_id='" + int.Parse(DDLMemName.SelectedValue.ToString()) + "'";

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
    protected void DDLYears_SelectedIndexChanged(object sender, EventArgs e)
    {
        string years = DDLYears.SelectedItem.Text.Trim().ToString();
        DDLDesig.Items.Clear();
        GetDistDesignation(years);
    }
    private void GetDistDesignation(string year)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "SELECT * FROM [distt_designation_tbl] where years='" + year + "' ORDER BY [designation] ";
        //obj.AddParam("@id", id);
        DataTable dt = new DataTable();

        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            DDLDesig.DataTextField = "designation";
            DDLDesig.DataValueField = "id";
            DDLDesig.DataSource = dt;
            DDLDesig.DataBind();
            DDLDesig.Items.Insert(0, "Select");
        }
    }

    //private void GetDistSubDesignation(int desig_id)
    //{
    //    DBconnection obj = new DBconnection();
    //    obj.SetCommandQry = "SELECT * FROM [distt_designation_sub_tbl] where desig_id='" + desig_id + "' ORDER BY [sub_designation] ";
    //    //obj.AddParam("@id", id);
    //    DataTable dt = new DataTable();

    //    dt = obj.ExecuteTable();
    //    if (dt.Rows.Count > 0)
    //    {
    //        DDLSubDesig.DataTextField = "sub_designation";
    //        DDLSubDesig.DataValueField = "id";
    //        DDLSubDesig.DataSource = dt;
    //        DDLSubDesig.DataBind();
    //        DDLSubDesig.Items.Insert(0, "Select");
    //    }
    //}
    //protected void DDLDesig_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int desig_id=int.Parse(DDLDesig.SelectedValue.ToString());
    //    DDLSubDesig.Items.Clear();
    //    GetDistSubDesignation(desig_id);
    //}
}
