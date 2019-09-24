using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RegistrationBLL
/// </summary>
public class RegistrationBLL
{
    public RegistrationBLL()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    #region --- Declare Variables

    private string clubName, registrationType, registrationFor, title, firstName, middleName, lastName, badgeName, gender,         
        mobileCC, mobile, emailId, foodPref, spouseFoodPref, spouseGender, spouseTitle, spouseFirstName, spouseLastName, spouseMobile, spouseEmail,
        paymentType, paymentIn, bankName, branchName, chequeNo, neftUtrNo, ipaddress, paymentStatus, paymentScheme = string.Empty;

    private int id, eventId, registrationNo = 0;   
    private System.Data.SqlTypes.SqlDateTime chequeDate, neftDate, ddDate;
    private Decimal amount, balanceAmount = 0;


    public Decimal Amount { set { amount = value; } get { return amount; } }
    public Decimal BalanceAmount { set { balanceAmount = value; } get { return balanceAmount; } }

    public int Id { set { id = value; } get { return id; } }
    public int EventId { set { eventId = value; } get { return eventId; } }
    public int RegistrationNo { set { registrationNo = value; } get { return registrationNo; } }
   
    public string ClubName { set { clubName = value; } get { return clubName; } }
    public string RegistrationType { set { registrationType = value; } get { return registrationType; } }
    public string RegistrationFor { set { registrationFor = value; } get { return registrationFor; } }
    public string PaymentScheme { set { paymentScheme = value; } get { return paymentScheme; } }

    public string Title { set { title = value; } get { return title; } }
    public string FirstName { set { firstName = value; } get { return firstName; } }
    public string MiddleName { set { middleName = value; } get { return middleName; } }
    public string LastName { set { lastName = value; } get { return lastName; } }
    public string BadgeName { set { badgeName = value; } get { return badgeName; } }
    public string Gender { set { gender = value; } get { return gender; } } 
    
    public string MobileCC { set { mobileCC = value; } get { return mobileCC; } }
    public string Mobile { set { mobile = value; } get { return mobile; } }
    public string EmailId { set { emailId = value; } get { return emailId; } }
    public string FoodPref { set { foodPref = value; } get { return foodPref; } }

    public string SpouseFoodPref { set { spouseFoodPref = value; } get { return spouseFoodPref; } }
    public string SpouseGender { set { spouseGender = value; } get { return spouseGender; } }
    public string SpouseTitle { set { spouseTitle = value; } get { return spouseTitle; } }
    public string SpouseFirstName { set { spouseFirstName = value; } get { return spouseFirstName; } }
    public string SpouseLastName { set { spouseLastName = value; } get { return spouseLastName; } }
    public string SpouseMobile { set { spouseMobile = value; } get { return spouseMobile; } }
    public string SpouseEmail { set { spouseEmail = value; } get { return spouseEmail; } }

    public string PaymentType { set { paymentType = value; } get { return paymentType; } }
    public string PaymentIn { set { paymentIn = value; } get { return paymentIn; } }
    public string BankName { set { bankName = value; } get { return bankName; } }
    public string BranchName { set { branchName = value; } get { return branchName; } }
    public string ChequeNo { set { chequeNo = value; } get { return chequeNo; } }  
    public string NeftUtrNo { set { neftUtrNo = value; } get { return neftUtrNo; } }
    public string PaymentStatus { set { paymentStatus = value; } get { return paymentStatus; } }    

    public System.Data.SqlTypes.SqlDateTime ChequeDate { set { chequeDate = value; } get { return chequeDate; } }
    public System.Data.SqlTypes.SqlDateTime NeftDate { set { neftDate = value; } get { return neftDate; } }
    public System.Data.SqlTypes.SqlDateTime DDDate { set { ddDate = value; } get { return ddDate; } }

    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }

    // Passport Details

    public System.Data.SqlTypes.SqlDateTime MemberDob { set; get; }
    public string MemberPassportNo { set; get; }
    public string MemberPlaceofIssue { set; get; }
    public System.Data.SqlTypes.SqlDateTime MemberDateofIssue { set; get; }
    public System.Data.SqlTypes.SqlDateTime MemberDateofExpiry { set; get; }
    public string MemberImg { set; get; }
    public string MemberPassportFrontImg { set; get; }
    public string MemberPassportBackImg { set; get; }


    public System.Data.SqlTypes.SqlDateTime SpouseDob { set; get; }
    public string SpousePassportNo { set; get; }
    public string SpousePlaceofIssue { set; get; }
    public System.Data.SqlTypes.SqlDateTime SpouseDateofIssue { set; get; }
    public System.Data.SqlTypes.SqlDateTime SpouseDateofExpiry { set; get; }
    public string SpouseImg { set; get; }
    public string SpousePassportFrontImg { set; get; }
    public string SpousePassportBackImg { set; get; }

    #endregion

    public int AddRegistration()
    {
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddEventRegistration";
        obj.AddParam("@event_id", this.eventId);
        obj.AddParam("@registration_no", this.registrationNo);
        obj.AddParam("@registration_for", this.registrationFor);
        obj.AddParam("@club_name", this.clubName); 
        obj.AddParam("@title", this.title);
        obj.AddParam("@fname", this.firstName);
        obj.AddParam("@mname", this.middleName);
        obj.AddParam("@lname", this.lastName);       
        obj.AddParam("@gender", this.gender);       
        obj.AddParam("@mobile_cc", this.mobileCC);
        obj.AddParam("@mobile", this.mobile);
        obj.AddParam("@emailId", this.emailId);
        obj.AddParam("@spouse_gender", this.spouseGender);       
        obj.AddParam("@spouse_first_name", this.spouseFirstName);
        obj.AddParam("@spouse_last_name", this.spouseLastName);

        obj.AddParam("@payment_type", this.paymentType);
        obj.AddParam("@amount", this.amount);       

        obj.AddParam("@bank_name", this.bankName);
        obj.AddParam("@branch_name", this.branchName);
        obj.AddParam("@cheque_no", this.chequeNo);
        obj.AddParam("@cheque_date", this.chequeDate);
        obj.AddParam("@neft_utr_no", this.neftUtrNo);
        obj.AddParam("@neft_date", this.neftDate); 
        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int AddTashkentRegistration()
    {
        
        int i = 0;
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddTashkentRegistrations";
       
        obj.AddParam("@registration_no", this.registrationNo);
        obj.AddParam("@registration_type", this.registrationType);
        obj.AddParam("@registration_for", this.registrationFor);
        obj.AddParam("@club_name", this.clubName);
      
        obj.AddParam("@fname", this.firstName);
        obj.AddParam("@mname", this.middleName);
        obj.AddParam("@lname", this.lastName);
        obj.AddParam("@gender", this.gender);     
        obj.AddParam("@mobile", this.mobile);
        obj.AddParam("@emailId", this.emailId);
        obj.AddParam("@food_pref", this.foodPref);

        obj.AddParam("@spouse_first_name", this.spouseFirstName);
        obj.AddParam("@spouse_last_name", this.spouseLastName);
        obj.AddParam("@spouse_mobile", this.spouseMobile);
        obj.AddParam("@spouse_emailid", this.spouseEmail);
        obj.AddParam("@spouse_food_pref", this.spouseFoodPref);

        obj.AddParam("@payment_type", this.paymentType);
        obj.AddParam("@payment_in", this.paymentIn);
        obj.AddParam("@amount", this.amount);
        obj.AddParam("@balance_amt", this.balanceAmount);
        obj.AddParam("@bank_name", this.bankName);
        obj.AddParam("@branch_name", this.branchName);
        obj.AddParam("@cheque_no", this.chequeNo);
        obj.AddParam("@cheque_date", this.chequeDate);     

        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }

    public int UpdateRegistration()
    {
        int i = 0;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_UpdateRegistration";
        

        obj.AddParam("@id", this.id);
        obj.AddParam("@event_id", this.eventId);
        obj.AddParam("@registration_no", this.registrationNo);
        obj.AddParam("@registration_for", this.registrationFor);
        obj.AddParam("@club_name", this.clubName);
        obj.AddParam("@title", this.title);
        obj.AddParam("@fname", this.firstName);
        obj.AddParam("@mname", this.middleName);
        obj.AddParam("@lname", this.lastName);
        obj.AddParam("@gender", this.gender);
        obj.AddParam("@mobile_cc", this.mobileCC);
        obj.AddParam("@mobile", this.mobile);
        obj.AddParam("@emailId", this.emailId);
        obj.AddParam("@spouse_gender", this.spouseGender);
        obj.AddParam("@spouse_first_name", this.spouseFirstName);
        obj.AddParam("@spouse_last_name", this.spouseLastName);

        obj.AddParam("@payment_type", this.paymentType);
        obj.AddParam("@amount", this.amount);

        obj.AddParam("@bank_name", this.bankName);
        obj.AddParam("@branch_name", this.branchName);
        obj.AddParam("@cheque_no", this.chequeNo);
        obj.AddParam("@cheque_date", this.chequeDate);
        obj.AddParam("@neft_utr_no", this.neftUtrNo);
        obj.AddParam("@neft_date", this.neftDate);


        i = obj.ExecuteNonQuery();
        return i;
    }
    public int AddPassportDetails()
    {
        int i = 0;

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "z_AddPassportDetails";

        obj.AddParam("@booking_id", this.registrationNo);

        obj.AddParam("@mem_dob", this.MemberDob);
        obj.AddParam("@mem_passport_no", this.MemberPassportNo);
        obj.AddParam("@mem_place_of_issue", this.MemberPlaceofIssue);
        obj.AddParam("@mem_date_of_issue", this.MemberDateofIssue);
        obj.AddParam("@mem_date_of_expiry", this.MemberDateofExpiry);
        obj.AddParam("@mem_img", this.MemberImg);
        obj.AddParam("@mem_pass_front_img", this.MemberPassportFrontImg);
        obj.AddParam("@mem_pass_back_img", this.MemberPassportBackImg);

        obj.AddParam("@spouse_dob", this.SpouseDob);
        obj.AddParam("@spouse_passport_no", this.SpousePassportNo);
        obj.AddParam("@spouse_place_of_issue", this.SpousePlaceofIssue);
        obj.AddParam("@spouse_date_of_issue", this.SpouseDateofIssue);
        obj.AddParam("@spouse_date_of_expiry", this.SpouseDateofExpiry);
        obj.AddParam("@spouse_img", this.SpouseImg);
        obj.AddParam("@spouse_pass_front_img", this.SpousePassportFrontImg);
        obj.AddParam("@spouse_pass_back_img", this.SpousePassportBackImg);

        obj.AddParam("@ipaddress", this.ipaddress);

        i = obj.ExecuteNonQuery();
        return i;
    }
}