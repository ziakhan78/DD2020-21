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

public partial class Admin_AdminM : System.Web.UI.MasterPage
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

                    if (Session["AdminType"].ToString() == "President")
                    {
                        try
                        {

                            RadTreeView1.Nodes.FindNodeByText("Admin Users").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("RI Presidents").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("RI Awards").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Abbreviations").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Glossary").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Manage District No.").Visible = false;

                            RadTreeView1.Nodes.FindNodeByText("RI & DG").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("DGs & PDGs").Visible = false;

                            RadTreeView1.Nodes.FindNodeByText("Roll of Honour").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Rotaract Clubs").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Interact Clubs").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("District Awards").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Upcoming Events").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Manage Dollor Rate").Visible = false;


                            RadTreeView1.Nodes.FindNodeByText("BOD Members").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("BOD Position").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("District Officers").Visible = false;
                            RadTreeView1.Nodes.FindNodeByText("Change Admin Password").Visible = false;


                            // Disabled / Visibility False for Child Nodes


                            RadTreeNode node1 = RadTreeView1.FindNodeByText("Manage Members");
                            foreach (RadTreeNode childNode in node1.Nodes)
                            {
                                if (childNode.Text == "View Members")
                                {
                                    childNode.Visible = false;
                                }

                            }

                            RadTreeNode node2 = RadTreeView1.FindNodeByText("Manage Clubs");
                            foreach (RadTreeNode childNode in node2.Nodes)
                            {
                                if (childNode.Text == "View Clubs")
                                {
                                    childNode.Visible = false;
                                }

                            }






                        }
                        catch { }
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


        else if (Snode.Trim() == "Add District No.")
        {
            Response.Redirect("add_district_no.aspx");
        }

        else if (Snode.Trim() == "View District No.")
        {
            Response.Redirect("view_district_no.aspx");
        }



        else if (Snode.Trim() == "Add Clubs")
        {
            Response.Redirect("add_clubs.aspx");
        }

        else if (Snode.Trim() == "View Clubs")
        {
            Response.Redirect("view_clubs.aspx");
        }


        else if (Snode.Trim() == "Add Members")
        {
            Response.Redirect("add_members.aspx");
        }

        else if (Snode.Trim() == "View Members")
        {
            Response.Redirect("view_members.aspx");
        }




        else if (Snode.Trim() == "View Presidents")
        {
            Response.Redirect("view_presidents.aspx");
        }


        else if (Snode.Trim() == "Add RI Presidents")
        {
            Response.Redirect("add_ri_president.aspx");
        }

        else if (Snode.Trim() == "View RI Presidents")
        {
            Response.Redirect("view_ri_president.aspx");
        }

        else if (Snode.Trim() == "Add RI Awards")
        {
            Response.Redirect("add_ri_awards.aspx");
        }

        else if (Snode.Trim() == "View RI Awards")
        {
            Response.Redirect("view_ri_awards.aspx");
        }

        else if (Snode.Trim() == "Add Abbreviations")
        {
            Response.Redirect("add_abbreviation.aspx");
        }

        else if (Snode.Trim() == "View Abbreviations")
        {
            Response.Redirect("view_abbreviations.aspx");
        }

        else if (Snode.Trim() == "Add Glossary")
        {
            Response.Redirect("add_glossary.aspx");
        }

        else if (Snode.Trim() == "View Glossary")
        {
            Response.Redirect("view_glossary.aspx");
        }

        else if (Snode.Trim() == "Add Dist. Rotary Clubs")
        {
            Response.Redirect("Add_where_district_clubs_meet.aspx");
        }

        else if (Snode.Trim() == "View Dist. Rotary Clubs")
        {
            Response.Redirect("View_where_district_clubs_meet.aspx");
        }

        else if (Snode.Trim() == "Add Dist. Rotary Club Data")
        {
            Response.Redirect("Add_where_district_clubs_data.aspx");
        }

        else if (Snode.Trim() == "View Dist. Rotary Club Data")
        {
            Response.Redirect("");
        }

        else if (Snode.Trim() == "Add Dist. Members")
        {
            Response.Redirect("add_distt_members.aspx");
        }

        else if (Snode.Trim() == "View Dist. Members")
        {
            Response.Redirect("view_distt3140members.aspx");
        }

        else if (Snode.Trim() == "Add BOD Position")
        {
            Response.Redirect("add_bod_position.aspx");
        }

        else if (Snode.Trim() == "View BOD Position")
        {
            Response.Redirect("view_bod_position.aspx");
        }

        else if (Snode.Trim() == "Add BOD Members")
        {
            Response.Redirect("Add_bod.aspx");
        }

        else if (Snode.Trim() == "View BOD Members")
        {
            Response.Redirect("ViewBod.aspx");
        }

        else if (Snode.Trim() == "Add BOD RY 2013-14")
        {
            Response.Redirect("add_upcoming_bod.aspx");
        }

        else if (Snode.Trim() == "View BOD RY 2013-14")
        {
            Response.Redirect("view_upcoming_bod.aspx");
        }

        else if (Snode.Trim() == "Add Rotaract Club")
        {
            Response.Redirect("add_rotaract_club.aspx");
        }

        else if (Snode.Trim() == "View Rotaract Club")
        {
            Response.Redirect("view_rotaract_club.aspx");
        }

        else if (Snode.Trim() == "Add Interact Club")
        {
            Response.Redirect("add_interact_club.aspx");
        }

        else if (Snode.Trim() == "View Interact Club")
        {
            Response.Redirect("view_interact_club.aspx");
        }

        else if (Snode.Trim() == "Add District Awards")
        {
            Response.Redirect("add_award.aspx");
        }

        else if (Snode.Trim() == "View District Awards")
        {
            Response.Redirect("view_award.aspx");
        }

        else if (Snode.Trim() == "Add Club Designation")
        {
            Response.Redirect("add_club_designations.aspx");
        }

        else if (Snode.Trim() == "View Club Designation")
        {
            Response.Redirect("view_club_designations.aspx");
        }


        else if (Snode.Trim() == "Add Dist. Avenue")
        {
            Response.Redirect("district_designations.aspx");
        }

        else if (Snode.Trim() == "View Dist. Avenue")
        {
            Response.Redirect("view_distt_designations.aspx");
        }

        else if (Snode.Trim() == "Add Dist. Designation")
        {
            Response.Redirect("district_designations_sub.aspx");
        }

        else if (Snode.Trim() == "View Dist. Designation")
        {
            Response.Redirect("view_distt_designations_sub.aspx");
        }

        else if (Snode.Trim() == "Add Dist. Officers")
        {
            Response.Redirect("add_dist_officers.aspx");
        }

        else if (Snode.Trim() == "View Dist. Officers")
        {
            Response.Redirect("view_dist_officers.aspx");
        }

        else if (Snode.Trim() == "Add RI Designation")
        {
            Response.Redirect("add_ri_designations.aspx");
        }

        else if (Snode.Trim() == "View RI Designation")
        {
            Response.Redirect("view_ri_designations.aspx");
        }

        //else if (Snode.Trim() == "Add Administrative Team")
        //{
        //    Response.Redirect("add_administrative_team.aspx");
        //}



        else if (Snode.Trim() == "Add RI & DG")
        {
            Response.Redirect("add_ri_dg_data.aspx");
        }

        else if (Snode.Trim() == "View RI & DG")
        {
            Response.Redirect("view_ri_dg_data.aspx");
        }


        else if (Snode.Trim() == "Add DGs & PDGs")
        {
            Response.Redirect("add_past_district_gove.aspx");
        }

        else if (Snode.Trim() == "View DGs & PDGs")
        {
            Response.Redirect("view_past_district_gove.aspx");
        }

        else if (Snode.Trim() == "Add Roll of Honour")
        {
            Response.Redirect("add_roll_of_honour.aspx");
        }

        else if (Snode.Trim() == "View Roll of Honour")
        {
            Response.Redirect("view_roll_of_honour.aspx");
        }

        else if (Snode.Trim() == "Add Installation Cal")
        {
            Response.Redirect("add_instalation_cal.aspx");
        }

        else if (Snode.Trim() == "View Installation Cal")
        {
            Response.Redirect("view_instalation_cal.aspx");
        }

        else if (Snode.Trim() == "Add OCV Cal")
        {
            Response.Redirect("add_ocv_cal.aspx");
        }

        else if (Snode.Trim() == "View OCV Cal")
        {
            Response.Redirect("view_ocv_cal.aspx");
        }

        else if (Snode.Trim() == "Add District Events")
        {
            Response.Redirect("add_upcoming_events.aspx");
        }

        else if (Snode.Trim() == "View District Events")
        {
            Response.Redirect("view_upcoming_events.aspx");
        }

        else if (Snode.Trim() == "Add Club Events")
        {
            Response.Redirect("AddSpeakerEvents.aspx");
        }

        else if (Snode.Trim() == "View Club Events")
        {
            Response.Redirect("ViewSpeakerEvents.aspx");
        }

        else if (Snode.Trim() == "Add Club Attendance")
        {
            Response.Redirect("add_attendance.aspx");
        }

        else if (Snode.Trim() == "View Club Attendance")
        {
            Response.Redirect("view_attendance.aspx");
        }

        else if (Snode.Trim() == "Add Projects")
        {
            Response.Redirect("add_projects.aspx");
        }

        //else if (Snode.Trim() == "View Projects")
        //{
        //    Response.Redirect("view_projects.aspx");
        //}

        //else if (Snode.Trim() == "Add Projects")
        //{
        //    Response.Redirect("add_rotary_projects.aspx");
        //}

        else if (Snode.Trim() == "View Projects")
        {
            Response.Redirect("view_rotary_projects.aspx");
        }



        else if (Snode.Trim() == "Add Hot Links")
        {
            Response.Redirect("add_hotlinks.aspx");
        }

        else if (Snode.Trim() == "View Hot Links")
        {
            Response.Redirect("view_hotlinks.aspx");
        }

        //else if (Snode.Trim() == "Add Downloads")
        //{
        //    Response.Redirect("add_downloads.aspx");
        //}

        //else if (Snode.Trim() == "View Downloads")
        //{
        //    Response.Redirect("view_downloads.aspx");
        //}

        else if (Snode.Trim() == "Add Downloads")
        {
            Response.Redirect("add_download.aspx");
        }

        else if (Snode.Trim() == "View Downloads")
        {
            Response.Redirect("view_download.aspx");
        }

        else if (Snode.Trim() == "Add Bulletin")
        {
            Response.Redirect("add_bulletin.aspx");
        }

        else if (Snode.Trim() == "View Bulletin")
        {
            Response.Redirect("view_bulletin.aspx");
        }

        else if (Snode.Trim() == "Add Dist. Thrust Area")
        {
            Response.Redirect("add_thrust_area.aspx");
        }
        else if (Snode.Trim() == "View Dist. Thrust Area")
        {
            Response.Redirect("view_thrust_area.aspx");
        }
        else if (Snode.Trim() == "Add Service Week")
        {
            Response.Redirect("add_service_week.aspx");
        }
        else if (Snode.Trim() == "View Service Week")
        {
            Response.Redirect("view_service_week.aspx");
        }

        else if (Snode.Trim() == "Add Rotary E-Clubs")
        {
            Response.Redirect("add_rotary_eclubs.aspx");
        }

        else if (Snode.Trim() == "View Rotary E-Clubs")
        {
            Response.Redirect("view_rotary_eclubs.aspx");
        }

        else if (Snode.Trim() == "Add Domain FTP Info.")
        {
            Response.Redirect("add_domain_ftp_info.aspx");
        }

        else if (Snode.Trim() == "View Domain FTP Info.")
        {
            Response.Redirect("view_domain_ftp.aspx");
        }

        else if (Snode.Trim() == "View Domain FTP & MX Record")
        {
            Response.Redirect("view_ftp_mx_record.aspx");
        }



        else if (Snode.Trim() == "Club's User Info. Send Mail")
        {
            Response.Redirect("clubs_user_info_mail.aspx");
        }


        else if (Snode.Trim() == "Domains & FTPs Report")
        {
            Response.Redirect("FTP_Domain_Report.aspx");
        }

        else if (Snode.Trim() == "Club's User Info Report")
        {
            Response.Redirect("clubs_user_info_report.aspx");
        }


        //else if (Snode.Trim() == "Add DGs & PDGs")
        //{
        //    Response.Redirect("add_3140DG_data.aspx");
        //}


        //else if (Snode.Trim() == "View DGs & PDGs")
        //{
        //    Response.Redirect("view_3140DG_data.aspx");
        //}

        else if (Snode.Trim() == "Add Monthly Message")
        {
            Response.Redirect("add_monthly_message.aspx");
        }

        else if (Snode.Trim() == "View Monthly Message")
        {
            Response.Redirect("view_monthly_message.aspx");
        }


        else if (Snode.Trim() == "Add Speaker Directory")
        {
            Response.Redirect("add_speakers_directory.aspx");
        }
        else if (Snode.Trim() == "View Speaker Directory")
        {
            Response.Redirect("view_speakers_directory.aspx");
        }

        else if (Snode.Trim() == "Add Major Donors")
        {
            Response.Redirect("add_major_donors.aspx");
        }
        else if (Snode.Trim() == "View Major Donors")
        {
            Response.Redirect("view_major_donors.aspx");
        }

        else if (Snode.Trim() == "Add PHSM")
        {
            Response.Redirect("add_phsm.aspx");
        }

        else if (Snode.Trim() == "View PHSM")
        {
            Response.Redirect("view_phsm.aspx");
        }

        else if (Snode.Trim() == "Add Benefactors & Bequest")
        {
            Response.Redirect("add_benefactors_members.aspx");
        }

        else if (Snode.Trim() == "View Benefactors & Bequest")
        {
            Response.Redirect("view_benefactors_members.aspx");
        }

        else if (Snode.Trim() == "View Pre PETS Registration")
        {
            Response.Redirect("view_pre_pets_regis.aspx");
        }

        else if (Snode.Trim() == "Add Serv Above Self Awards")
        {
            Response.Redirect("add_service_above_self_awards.aspx");
        }

        else if (Snode.Trim() == "View Serv Above Self Awards")
        {
            Response.Redirect("view_service_above_self_awards.aspx");
        }

        else if (Snode.Trim() == "Add Ave Of Service Citation")
        {
            Response.Redirect("add_avenues_of_service_citation.aspx");
        }

        else if (Snode.Trim() == "View Ave Of Service Citation")
        {
            Response.Redirect("view_avenues_of_service.aspx");
        }

        else if (Snode.Trim() == "View OCV Report Book")
        {
            Response.Redirect("view_ocv_report_book.aspx");
        }

        else if (Snode.Trim() == "Upload OCV Report Book")
        {
            Response.Redirect("upload_ocv_book.aspx");
        }

        else if (Snode.Trim() == "Add Sponsors")
        {
            Response.Redirect("add_sponsor.aspx");
        }

        else if (Snode.Trim() == "View Sponsors")
        {
            Response.Redirect("view_sponsors.aspx");
        }


        // Events Registration Module Strat

        else if (Snode.Trim() == "Add Event Registrations")
        {
            Response.Redirect("add_event_registration.aspx");
        }

        else if (Snode.Trim() == "View Events Registration Master")
        {
            Response.Redirect("view_event_registration.aspx");
        }

        else if (Snode.Trim() == "View Events Registration")
        {
            Response.Redirect("view_dist_events_registration.aspx");
        }

        else if (Snode.Trim() == "Events Registration Reports")
        {
            Response.Redirect("rpt_events_registration.aspx");
        }

        else if (Snode.Trim() == "Maximum Club Wise Reports")
        {
            Response.Redirect("rpt_events_max_clubwise.aspx");
        }

        else if (Snode.Trim() == "Registration Wise Reports")
        {
            Response.Redirect("rpt_events_reg_wise.aspx");
        }

        else if (Snode.Trim() == "Club Wise Reports")
        {
            Response.Redirect("rpt_events_reg_clubwise.aspx");
        }

        else if (Snode.Trim() == "Cheque Report")
        {
            Response.Redirect("rpt_events_reg_cheque.aspx");
        }

        else if (Snode.Trim() == "Food Drink Preference Report")
        {
            Response.Redirect("rpt_events_reg_food_drink_pref.aspx");
        }



        // Events Registration Module End


        else if (Snode.Trim() == "Address Label Printing")
        {

        }

        else if (Snode.Trim() == "View Peace Leadership")
        {
            Response.Redirect("view_peace_leadership_regis.aspx");
        }

        else if (Snode.Trim() == "Registration Report Namewise")
        {
            Response.Redirect("rpt_registration.aspx");
        }

        else if (Snode.Trim() == "Registration Report Reg.No.wise")
        {
            Response.Redirect("rpt_registration_reg_ord.aspx");
        }

        else if (Snode.Trim() == "Registration Report Clubwise")
        {
            Response.Redirect("rpt_clubwise_all_reg.aspx");
        }

        else if (Snode.Trim() == "Max Clubwise Report")
        {
            Response.Redirect("rpt_club_wise.aspx");
        }

        else if (Snode.Trim() == "Payment Report")
        {
            Response.Redirect("rpt_registration_payment.aspx");
        }

        else if (Snode.Trim() == "Cheque Report")
        {
            Response.Redirect("rpt_cheque.aspx");
        }

        // 3rd TRF Seminar

        else if (Snode.Trim() == "View 3rd TRF Seminar")
        {
            Response.Redirect("view_trf_seminar.aspx");
        }

        else if (Snode.Trim() == "Reg_No_Wise Report")
        {
            Response.Redirect("rpt_3rd_trf_registration_reg_ord.aspx");
        }

        else if (Snode.Trim() == "Clubwise Report")
        {
            Response.Redirect("rpt_3rd_trf_clubwise_all_reg.aspx");
        }

        else if (Snode.Trim() == "Max_Clubwise Report")
        {
            Response.Redirect("rpt_3rd_trf_club_wise.aspx");
        }

        else if (Snode.Trim() == "All Payment Report")
        {
            Response.Redirect("rpt_3rd_trf_registration_payment.aspx");
        }

        else if (Snode.Trim() == "All Cheque Report")
        {
            Response.Redirect("rpt_3rd_trf_cheque.aspx");
        }

        else if (Snode.Trim() == "Add Language Code")
        {
            Response.Redirect("add_language_code.aspx");
        }

        else if (Snode.Trim() == "View Language Code")
        {
            Response.Redirect("view_language_code.aspx");
        }

        else if (Snode.Trim() == "Add Discon Regis Fees")
        {
            Response.Redirect("add_discon_registration_rate.aspx");
        }

        else if (Snode.Trim() == "View Discon Regis Fees")
        {
            Response.Redirect("view_add_discon_registration_rate.aspx");
        }

        else if (Snode.Trim() == "Add Current Dollar Rate")
        {
            Response.Redirect("add_dollar_rupee_conversion.aspx");
        }

        else if (Snode.Trim() == "View Current Dollar Rate")
        {
            Response.Redirect("view_dollar_rupee_conversion.aspx");
        }


        else if (Snode.Trim() == "District Directory Data")
        {
            Response.Redirect("club_dist_directory_data.aspx");
        }


        else if (Snode.Trim() == "Add District Appointments")
        {
            Response.Redirect("add_dist_appointment.aspx");
        }

        else if (Snode.Trim() == "View District Appointments")
        {
            Response.Redirect("view_dist_appointment.aspx");
        }

        else if (Snode.Trim() == "Avenue Wise Report")
        {
            Response.Redirect("avenue_wise_report.aspx");
        }

        else if (Snode.Trim() == "Club Wise Gist Report")
        {
            Response.Redirect("club_wise_gist_report.aspx");
        }

        else if (Snode.Trim() == "Club Wise Report")
        {
           // Response.Redirect("club_wise_report.aspx");
            Response.Redirect("club_wise_district_positions_report.aspx");
        }


        else if (Snode.Trim() == "Send Static Mail")
        {
            Response.Redirect("SendStaticMail.aspx");
        }

        else if (Snode.Trim() == "View Dist Event Registrations")
        {
            Response.Redirect("view_dist_events_registration.aspx");
        }

        else if (Snode.Trim() == "Event Registrations Report")
        {
            Response.Redirect("event_registration_report.aspx");
        }

        else if (Snode.Trim() == "View RI Account")
        {
            Response.Redirect("view_rotary_account.aspx");
        }

        else if (Snode.Trim() == "RI Account Report")
        {
            Response.Redirect("ri_account_report.aspx");
        }

        else if (Snode.Trim() == "Join Rotary Report")
        {
            Response.Redirect("view_join_rotary_report.aspx");
        }        


        // Tashkent Registration

        else if (Snode.Trim() == "View Tashkent Registrations")
        {
            Response.Redirect("view_tashkent_registrations.aspx");
        }

        else if (Snode.Trim() == "TAS Registrations Report")
        {
            Response.Redirect("view_tashkent_registrations_report.aspx");
        }

        else if (Snode.Trim() == "TAS Registrations Payment Report")
        {
            Response.Redirect("view_tashkent_registrations_payment_report.aspx");
        }

        else if (Snode.Trim() == "TAS Registrations Passport Report")
        {
            Response.Redirect("view_tashkent_registrations_passport_report.aspx");
        }

        else if (Snode.Trim() == "TAS Registrations F & B Report")
        {
            Response.Redirect("view_tashkent_registrations_f_and_b_report.aspx");
        }

        else if (Snode.Trim() == "TAS Registrations Google Report")
        {
            Response.Redirect("view_tashkent_registrations_google_reports.aspx");
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
