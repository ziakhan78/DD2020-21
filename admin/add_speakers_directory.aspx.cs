using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class admin_add_speakers_directory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            if (!IsPostBack)
            {
                DDLClubName.DataSourceID = "DSDistClubNo";
                DDLClubName.DataBind();

                TRTopics.Visible = false;
                TRClubname.Visible = true;

                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    GetSpeaker(id);
                }
            }
        }
        else
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
    }

    private void GetSpeaker(int id)
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_GetSpeakers";
            obj.AddParam("@id", id);
            DataTable dt = new DataTable();
            dt = obj.ExecuteTable();
            if (dt.Rows.Count > 0)
            {
                drtitle.SelectedItem.Text = dt.Rows[0]["Title"].ToString();
                txtfname.Text = dt.Rows[0]["fname"].ToString();
                txtmname.Text = dt.Rows[0]["mname"].ToString();
                txtlname.Text = dt.Rows[0]["lname"].ToString();

                string type = dt.Rows[0]["type"].ToString();
                if (type == "Rotarians")
                {
                    TRClubname.Visible = true;                    
                    rbtnRtnType.SelectedIndex = 0;
                    DDLClubName.SelectedItem.Text = dt.Rows[0]["club_name"].ToString();
                }
                else
                {
                    TRClubname.Visible = false;
                    rbtnRtnType.SelectedIndex = 1;
                }              

                string topicType = dt.Rows[0]["topic_type"].ToString();
                if (topicType == "Rotary")
                {
                    rbtnTopicType.SelectedIndex = 0;
                }
                else
                {
                    rbtnTopicType.SelectedIndex = 1;
                }

                string [] topics = dt.Rows[0]["topics"].ToString().Split(';');
               
                for (int i = 0; i <= topics.Length-1; i++)
                {
                    TRTopics.Visible = true;
                    listTopics.Items.Add(topics[i]);
                }

                //txttopics.Text = dt.Rows[0]["topics"].ToString();
              
                txtAdd1.Text = dt.Rows[0]["address1"].ToString();
                txtAdd2.Text = dt.Rows[0]["address2"].ToString();
                txtAdd3.Text = dt.Rows[0]["address3"].ToString();
                txtCity.Text = dt.Rows[0]["city"].ToString();
                txtPin.Text = dt.Rows[0]["pin"].ToString();

                string[] rph1 = dt.Rows[0]["phone_resi"].ToString().Split('-');
                try
                {
                    txtRPhCC1.Text = rph1[0];
                    txtRPhAC1.Text = rph1[1];
                    txtRPh1.Text = rph1[2];
                }
                catch
                {
                    txtRPhCC1.Text = "";
                    txtRPhAC1.Text = "";
                    txtRPh1.Text = "";
                }

                string[] rphoff = dt.Rows[0]["phone_off"].ToString().Split('-');
                try
                {
                    txtOPhCC1.Text = rphoff[0];
                    txtOPhAC1.Text = rphoff[1];
                    txtOPh1.Text = rphoff[2];
                }
                catch
                {
                    txtOPhCC1.Text = "";
                    txtOPhAC1.Text = "";
                    txtOPh1.Text = "";
                }

                string[] mob1 = dt.Rows[0]["mobile"].ToString().Split(' ');
                try
                {
                    txtmob1cc.Text = mob1[0];
                    txtmob1.Text = mob1[1];
                }
                catch
                {
                }

                txtEmailId.Text = dt.Rows[0]["emailid"].ToString();
                txtWebsite.Text = dt.Rows[0]["website"].ToString();
            }
        }
        catch
        {
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"].ToString());
                    UpdateSpeaker(id);
                }
                else
                {
                    AddSpeaker();
                }
            }
            catch (Exception ex)
            {
            }
        }
    }

    private void UpdateSpeaker(int id)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateSpeakersDirectory";

        obj.AddParam("@id", id);

        obj.AddParam("@title", drtitle.SelectedItem.Text);
        obj.AddParam("@fname", txtfname.Text.Trim());
        obj.AddParam("@mname", txtmname.Text.Trim());
        obj.AddParam("@lname", txtlname.Text.Trim());
        obj.AddParam("@type", rbtnRtnType.SelectedItem.Text.Trim());
        obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.Trim());
        obj.AddParam("@topic_type", rbtnTopicType.SelectedItem.Text.Trim());

        string topics = "";
        if (listTopics.Items.Count > 0)
        {
            foreach (ListItem li in listTopics.Items)
            {
                topics = topics + li.Text.Trim().ToString() + ";";
            }
        }

        if (txttopics.Text != "")
        {
            topics = topics + txttopics.Text.Trim();
        }
        obj.AddParam("@topics", topics.TrimEnd(';'));
        
        
        obj.AddParam("@address1", txtAdd1.Text.Trim());
        obj.AddParam("@address2", txtAdd2.Text.Trim());
        obj.AddParam("@address3", txtAdd3.Text.Trim());
        obj.AddParam("@city", txtCity.Text.Trim());
        obj.AddParam("@pin", (txtPin.Text.Trim()));

        string rphone1;
        if (txtRPh1.Text == "")
        {
            rphone1 = "";
        }
        else
        {
            rphone1 = txtRPhCC1.Text.Trim() + "-" + txtRPhAC1.Text.Trim() + "-" + txtRPh1.Text.Trim();
        }
        obj.AddParam("@phone_resi", rphone1);

        string rphone2;
        if (txtOPh1.Text == "")
        {
            rphone2 = "";
        }
        else
        {
            rphone2 = txtOPhCC1.Text.Trim() + "-" + txtOPhAC1.Text.Trim() + "-" + txtOPh1.Text.Trim();
        }
        obj.AddParam("@phone_off", rphone2);

        if (txtmob1.Text == "")
            obj.AddParam("@mobile", "");
        else
            obj.AddParam("@mobile", txtmob1cc.Text.Trim() + " " + txtmob1.Text.Trim());

        obj.AddParam("@website", txtWebsite.Text.Trim());
        obj.AddParam("@emailid", txtEmailId.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {
            Reset();

            showmsg("Record has been updated successfully !", "view_speakers_directory.aspx");
        }
    }

    private void AddSpeaker()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddSpeakersDirectory";

        obj.AddParam("@title", drtitle.SelectedItem.Text);
        obj.AddParam("@fname", txtfname.Text.Trim());
        obj.AddParam("@mname", txtmname.Text.Trim());
        obj.AddParam("@lname", txtlname.Text.Trim());
        obj.AddParam("@type", rbtnRtnType.SelectedItem.Text.Trim());
        obj.AddParam("@club_name", DDLClubName.SelectedItem.Text.Trim());
        obj.AddParam("@topic_type", rbtnTopicType.SelectedItem.Text.Trim());

        string topics = "";
        if (listTopics.Items.Count > 0)
        {
            foreach (ListItem li in listTopics.Items)
            {
                topics = topics + li.Text.Trim().ToString() + ";";
            }
        }

        if (txttopics.Text != "")
        {
            topics = topics + txttopics.Text.Trim();
        }
        else
        {
            topics = topics.TrimEnd(';');
        }
        obj.AddParam("@topics", topics);
       
        obj.AddParam("@address1", txtAdd1.Text.Trim());
        obj.AddParam("@address2", txtAdd2.Text.Trim());
        obj.AddParam("@address3", txtAdd3.Text.Trim());
        obj.AddParam("@city", txtCity.Text.Trim());
        obj.AddParam("@pin", (txtPin.Text.Trim()));

        string rphone1;
        if (txtRPh1.Text == "")
        {
            rphone1 = "";
        }
        else
        {
            rphone1 = txtRPhCC1.Text.Trim() + "-" + txtRPhAC1.Text.Trim() + "-" + txtRPh1.Text.Trim();
        }
        obj.AddParam("@phone_resi", rphone1);

        string rphone2;
        if (txtOPh1.Text == "")
        {
            rphone2 = "";
        }
        else
        {
            rphone2 = txtOPhCC1.Text.Trim() + "-" + txtOPhAC1.Text.Trim() + "-" + txtOPh1.Text.Trim();
        }
        obj.AddParam("@phone_off", rphone2);

        if (txtmob1.Text == "")
            obj.AddParam("@mobile", "");
        else
            obj.AddParam("@mobile", txtmob1cc.Text.Trim() + " " + txtmob1.Text.Trim());

        obj.AddParam("@website", txtWebsite.Text.Trim());
        obj.AddParam("@emailid", txtEmailId.Text.Trim());

        if (obj.ExecuteNonQuery() > 0)
        {
            Reset();
            string jv = "<script>alert('Record Added Successfully');</script>";
            ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
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
        catch
        {
        }
    }

    private void Reset()
    {
        txtCity.Text = "";
        txtPin.Text = "";
        DDLClubName.SelectedIndex = 0;

        rbtnRtnType.SelectedIndex = 0;
        rbtnTopicType.SelectedIndex = 0;
        drtitle.SelectedIndex = 0;
        txtfname.Text = "";
        txtlname.Text = "";
        txtmname.Text = "";

        txtAdd1.Text = "";
        txtAdd2.Text = "";
        txtAdd3.Text = "";
        txtEmailId.Text = "";

        txtmob1cc.Text = "+91";
        txtmob1.Text = "";

        txtRPhCC1.Text = "+91";
        txtRPhAC1.Text = "22";
        txtRPh1.Text = "";

        txtOPhCC1.Text = "+91";
        txtOPhAC1.Text = "22";
        txtOPh1.Text = "";

        txtWebsite.Text = "http://www.";

        listTopics.Items.Clear();
        txttopics.Text = "";
        TRTopics.Visible = false;
    }
        
    protected void btncancel_Click(object sender, EventArgs e)
    {
        Reset();
    }

    protected void rbtnRtnType_SelectedIndexChanged(object sender, EventArgs e)
    {
        string rtnType = rbtnRtnType.SelectedItem.Text.ToString();
        if (rtnType == "Rotarians")
        {
            TRClubname.Visible = true;
        }
        else
        {
            TRClubname.Visible = false;
        }
    }

    protected void btnAddmore_Click(object sender, EventArgs e)
    {
        TRTopics.Visible = true;
        listTopics.Items.Add(txttopics.Text.Trim().ToString());
        txttopics.Text = "";
    }

    protected void btnRemove_Click(object sender, EventArgs e)
    {
        try
        {
            if (listTopics.Items.Count > 0)
            {
                listTopics.Items.Remove(listTopics.SelectedItem.Text);
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
}