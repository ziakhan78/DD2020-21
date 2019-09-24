using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_add_event_registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TRCC.Visible = false;
            TRto.Visible = false;
            BindTime();
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

            DDLeh.Items.Add(s.ToString());
            DDLch.Items.Add(s.ToString());
        }

        DDLeh.Items.Insert(0, "HH");
        DDLeh.Items.Insert(1, "00");

        DDLch.Items.Insert(0, "HH");
        DDLch.Items.Insert(1, "00");

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
            DDLem.Items.Add(s.ToString());
            DDLcm.Items.Add(s.ToString());
        }

        DDLem.Items.Insert(0, "MM");
        DDLem.Items.Insert(1, "00");

        DDLcm.Items.Insert(0, "MM");
        DDLcm.Items.Insert(1, "00");
    }
  
    protected void btnAddmoreTo_Click(object sender, EventArgs e)
    {
        TRto.Visible = true;
        listemailTo.Items.Add(txtEmailTo.Text.Trim().ToString());
        txtEmailTo.Text = "";
    }

    protected void btnRemoveTo_Click(object sender, EventArgs e)
    {
        try
        {
            if (listemailTo.Items.Count > 0)
            {
                listemailTo.Items.Remove(listemailTo.SelectedItem.Text);
            }
            else
            {
                TRto.Visible = false;
            }
        }
        catch
        {
        }
    }
    protected void btnAddmoreCC_Click(object sender, EventArgs e)
    {
        TRCC.Visible = true;
        listemailCC.Items.Add(txtEmailCC.Text.Trim().ToString());
        txtEmailCC.Text = "";

    }
    protected void btnRemoveCC_Click(object sender, EventArgs e)
    {
        try
        {
            if (listemailCC.Items.Count > 0)
            {
                listemailCC.Items.Remove(listemailCC.SelectedItem.Text);
            }
            else
            {
                TRCC.Visible = false;
            }
        }
        catch
        {
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Request.QueryString["id"] != null)
            {
                int id = int.Parse(Request.QueryString["id"].ToString());
                // UpdateDistEventRegMaster(id);
            }
            else
            {
                AddDistEventRegMaster();
            }
        }
    }
    private void AddDistEventRegMaster()
    {
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddDistEventRegMaster";


            obj.AddParam("@event_title", txtEventTitle.Text.Trim().ToString());
            obj.AddParam("@event_date", DateTime.Parse(event_date.SelectedDate.ToString()));
            string eh, em, eampm, event_time = "";
            eh = DDLeh.SelectedItem.Text;
            em = DDLem.SelectedItem.Text;
            eampm = DDLeampm.SelectedItem.Text;
            event_time = eh + ":" + em + " " + eampm;

            if (eh != "HH" || em != "MM")
            {
                obj.AddParam("@event_time", event_time);
            }
            else
            {
                obj.AddParam("@event_time", "");
            }
            obj.AddParam("@venue1", txtVenu.Text.Trim().ToString());
            obj.AddParam("@venue2", txtVenu2.Text.Trim().ToString());
            //int cid = int.Parse(DDLClubName.SelectedValue.ToString());
            //obj.AddParam("@DistrictClubID", cid);
            string  hostclub = DDLClubName.SelectedItem.Text.ToString();
            if (hostclub == "Select")
                hostclub = "";
            obj.AddParam("@host_club", hostclub);
            obj.AddParam("@orgnized_by", "");

            obj.AddParam("@event_charge", Decimal.Parse(txtEventCharge.Text.Trim().ToString()));
            obj.AddParam("@event_closing_date", DateTime.Parse(event_closing_date.SelectedDate.ToString()));
            string ch, cm, campm, event_closing_time = "";
            ch = DDLeh.SelectedItem.Text;
            cm = DDLem.SelectedItem.Text;
            campm = DDLeampm.SelectedItem.Text;
            event_time = ch + ":" + cm + " " + campm;

            if (ch != "HH" || cm != "MM")
            {
                obj.AddParam("@event_closing_time", event_closing_time);
            }
            else
            {
                obj.AddParam("@event_closing_time", "");
            }

            obj.AddParam("@cheque_drawn_on", txtDrawnOn.Text.Trim().ToString());
            obj.AddParam("@cheque_receiver_name", txtChequeRece.Text.Trim().ToString());
            obj.AddParam("@address1", txtAdd.Text.Trim().ToString());
            obj.AddParam("@address2", txtAdd2.Text.Trim().ToString());
            obj.AddParam("@mobile", txtMobile.Text.Trim().ToString());


            string phone1;
            if (txtPhone1.Text == "")
            {
               phone1 = "";
            }
            else
            {
                phone1 = txtPhCC1.Text.Trim() + "-" + txtPhAC1.Text.Trim() + "-" + txtPhone1.Text.Trim();
            }
            obj.AddParam("@phone1", phone1);
            string phone2;
            if (txtPhone2.Text == "")
            {
                phone2 = "";
            }
            else
            {
                phone2 = txtPhCC2.Text.Trim() + "-" + txtPhAC2.Text.Trim() + "-" + txtPhone2.Text.Trim();
            }
            obj.AddParam("@phone2", phone2);
           
            obj.AddParam("@emailId", txtEmail.Text.Trim().ToString());

            obj.AddParam("@emailSubject", txtEmailSubject.Text.Trim());

            string emailTo = "";
            emailTo = txtEmailTo.Text.Trim();
            if (emailTo != "")
                emailTo = emailTo + ";";

            if (listemailTo.Items.Count > 0)
            {
                foreach (ListItem li in listemailTo.Items)
                {
                    emailTo = emailTo + li.Text.Trim().ToString() + ";";
                }
            }
            obj.AddParam("@emailTo", emailTo);

            string emailCC = "";
            emailCC = txtEmailCC.Text.Trim();
            if (emailCC != "")
                emailCC = emailCC + ";";

            if (listemailCC.Items.Count > 0)
            {
                foreach (ListItem li in listemailCC.Items)
                {
                    emailCC = emailCC + li.Text.Trim().ToString() + ";";
                }
            }
            obj.AddParam("@emailCC", emailCC);

            obj.AddParam("@emailBCC", txtEmailBCC.Text.Trim());
           
         
            int exe = obj.ExecuteNonQuery();

            if (exe > 0)
            {
                Clear();
                string jv = "<script>alert('Record has been added successfully');</script>";
                ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "alert", jv, false);
            }
        }
        catch { }
    }

    private void Clear()
    {
        txtAdd.Text = "";
        txtChequeRece.Text = "";
        txtDrawnOn.Text = "";
        txtEmail.Text = "";
        txtEmailCC.Text = "";
        txtEmailTo.Text = "";
        txtEventCharge.Text = "";
        txtEventTitle.Text = "";
        txtMobCC.Text = "+91";
        txtMobile.Text = "";
        //txtOrgnizedBy.Text = "";
        txtPhAC1.Text = "";
        txtPhAC2.Text = "";
        txtPhCC1.Text = "+91";
        txtPhCC2.Text = "+91";
        txtPhone1.Text = "";
        txtPhone2.Text = "";
        txtVenu.Text = "";
        DDLcampm.ClearSelection();
        DDLch.ClearSelection();
        DDLClubName.ClearSelection();
        DDLcm.ClearSelection();
        DDLeampm.ClearSelection();
        DDLeh.ClearSelection();
        DDLem.ClearSelection();
        event_closing_date.Clear();
        event_date.Clear();
        listemailCC.Items.Clear();
        listemailTo.Items.Clear();        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
}