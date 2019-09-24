using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlTypes;


/// <summary>
/// Summary description for MembersBll
/// </summary>
public class MembersBll
{
    public MembersBll()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string title, firstName, middleName, lastName, callName, suffix, membershipType, charterMember, gender, classification, qualification, emailId, altEmailId, password,
        mobileCc1, mobileNo1, mobileCc2, mobileNo2, bloodGroup, rhf, donateBlood, hobbies, trfStatus, foodPreference, drinkPreference, typeOfDrink, proposedBy, morningBttc, noonBttc, eveningBttc, memberImage, 
        sFirstName, sLastName, sGender, sBg, sRhf, sDonateBlood, sMobileCc, sMobile, sEmailId, sHobbies, sFoodPreference, sDrinkPreference, sTypeOfDrink, sImage,
        rAdd1, rAdd2, rCity, rPin, rState, rCountry, rPhoneCc1, rPhoneAc1, rPhone1, rPhoneCc2, rPhoneAc2, rPhone2, rFaxCc, rFaxAc, rFax,
        companyName, companyDesignation, oAdd1, oAdd2, oCity, oPin, oState, oCountry, oPhoneCc1, oPhoneAc1, oPhone1, oPhoneCc2, oPhoneAc2, oPhone2, oFaxCc, oFaxAc, oFax, website, oEmail, mailPrefrence, addressPrefrence, faxPrefrence,
        nameC1, genderC1, nameC2, genderC2, nameC3, genderC3,
        ipaddress;

    private decimal trfAmt;
    private int id, clubId, membershipNo, clubNo;
    private SqlDateTime dob, sDob, joiningDate, anniversary, dobC1, dobC2, dobC3;


    public decimal TrfAmt { set { trfAmt = value; } get { return trfAmt; } }
    public int Id { set { id = value; } get { return id; } }
    public int ClubId { set { clubId = value; } get { return clubId; } }
    public int ClubNo { set { clubNo = value; } get { return clubNo; } }
    public string MobileNoCc1 { set { mobileCc1 = value; } get { return mobileCc1; } }
    public string MobileNo1 { set { mobileNo1 = value; } get { return mobileNo1; } }
    public string MobileNoCc2 { set { mobileCc2 = value; } get { return mobileCc2; } }
    public string MobileNo2 { set { mobileNo2 = value; } get { return mobileNo2; } }
    public int MembershipNo { set { membershipNo = value; } get { return membershipNo; } }
    public string Title { set { title = value; } get { return title; } }
    public string FirstName { set { firstName = value; } get { return firstName; } }
    public string MiddleName { set { middleName = value; } get { return middleName; } }
    public string LastName { set { lastName = value; } get { return lastName; } }
    public string CallName { set { callName = value; } get { return callName; } }
    public string Suffix { set { suffix = value; } get { return suffix; } }    
    public string MembershipType { set { membershipType = value; } get { return membershipType; } }

    public string MorningBttc { set { morningBttc = value; } get { return morningBttc; } }
    public string NoonBttc { set { noonBttc = value; } get { return noonBttc; } }
    public string EveningBttc { set { eveningBttc = value; } get { return eveningBttc; } }
    public string MemberImage { set { memberImage = value; } get { return memberImage; } }

    
    public SqlDateTime Dob { set { dob = value; } get { return dob; } }
    public SqlDateTime SDob { set { sDob = value; } get { return sDob; } }
    public SqlDateTime JoiningDate { set { joiningDate = value; } get { return joiningDate; } }
    public SqlDateTime Anniversary { set { anniversary = value; } get { return anniversary; } }

   

    public string CharterMember { set { charterMember = value; } get { return charterMember; } }
    public string Gender { set { gender = value; } get { return gender; } }   
    public string Classification { set { classification = value; } get { return classification; } }
    public string Qualification { set { qualification = value; } get { return qualification; } }
    public string EmailId { set { emailId = value; } get { return emailId; } }
    public string AltEmailId { set { altEmailId = value; } get { return altEmailId; } }
    public string Password { set { password = value; } get { return password; } }    
    public string BloodGroup { set { bloodGroup = value; } get { return bloodGroup; } }
    public string Rhf { set { rhf = value; } get { return rhf; } }

    public string DonateBlood { set { donateBlood = value; } get { return donateBlood; } }
    public string Hobbies { set { hobbies = value; } get { return hobbies; } }
    public string TrfStatus { set { trfStatus = value; } get { return trfStatus; } }
    public string FoodPreference { set { foodPreference = value; } get { return foodPreference; } }
    public string DrinkPreference { set { drinkPreference = value; } get { return drinkPreference; } }
    public string TypeOfDrink { set { typeOfDrink = value; } get { return typeOfDrink; } }
    public string ProposedBy { set { proposedBy = value; } get { return proposedBy; } }
     
  
    // Spouse Details
    public string SFirstName { set { sFirstName = value; } get { return sFirstName; } }
    public string SLastName { set { sLastName = value; } get { return sLastName; } }
    public string SGender { set { sGender = value; } get { return sGender; } }
    public string SBg { set { sBg = value; } get { return sBg; } }
    public string SRhf { set { sRhf = value; } get { return sRhf; } }
    public string SDonateBlood { set { sDonateBlood = value; } get { return sDonateBlood; } }
    public string SMobileCc { set { sMobileCc = value; } get { return sMobileCc; } }
    public string SMobile { set { sMobile = value; } get { return sMobile; } }
    public string SEmailId { set { sEmailId = value; } get { return sEmailId; } }    
    public string SHobbies { set { sHobbies = value; } get { return sHobbies; } }
    public string SFoodPreference { set { sFoodPreference = value; } get { return sFoodPreference; } }
    public string SDrinkPreference { set { sDrinkPreference = value; } get { return sDrinkPreference; } }
    public string STypeOfDrink { set { sTypeOfDrink = value; } get { return sTypeOfDrink; } }
    public string SImage { set { sImage = value; } get { return sImage; } }

    // Residence address    

    public string RAdd1 { set { rAdd1 = value; } get { return rAdd1; } }
    public string RAdd2 { set { rAdd2 = value; } get { return rAdd2; } }
    public string RCity { set { rCity = value; } get { return rCity; } }
    public string RPin { set { rPin = value; } get { return rPin; } }
    public string RState { set { rState = value; } get { return rState; } }
    public string RCountry { set { rCountry = value; } get { return rCountry; } }
    public string RPhoneCc1 { set { rPhoneCc1 = value; } get { return rPhoneCc1; } }
    public string RPhoneAc1 { set { rPhoneAc1 = value; } get { return rPhoneAc1; } }
    public string RPhone1 { set { rPhone1 = value; } get { return rPhone1; } }
    public string RPhoneCc2 { set { rPhoneCc2 = value; } get { return rPhoneCc2; } }
    public string RPhoneAc2 { set { rPhoneAc2 = value; } get { return rPhoneAc2; } }
    public string RPhone2 { set { rPhone2 = value; } get { return rPhone2; } }
    public string RFaxCc { set { rFaxCc = value; } get { return rFaxCc; } }
    public string RFaxAc { set { rFaxAc = value; } get { return rFaxAc; } }
    public string RFax { set { rFax = value; } get { return rFax; } }


    // Office address    

    public string CompanyName { set { companyName = value; } get { return companyName; } }
    public string CompanyDesignation { set { companyDesignation = value; } get { return companyDesignation; } }
    public string OAdd1 { set { oAdd1 = value; } get { return oAdd1; } }
    public string OAdd2 { set { oAdd2 = value; } get { return oAdd2; } }
    public string OCity { set { oCity = value; } get { return rCity; } }
    public string OPin { set { oPin = value; } get { return oPin; } }
    public string OState { set { oState = value; } get { return oState; } }
    public string OCountry { set { oCountry = value; } get { return oCountry; } }
    public string OPhoneCc1 { set { oPhoneCc1 = value; } get { return oPhoneCc1; } }
    public string OPhoneAc1 { set { oPhoneAc1 = value; } get { return oPhoneAc1; } }
    public string OPhone1 { set { oPhone1 = value; } get { return oPhone1; } }
    public string OPhoneCc2 { set { oPhoneCc2 = value; } get { return oPhoneCc2; } }
    public string OPhoneAc2 { set { oPhoneAc2 = value; } get { return oPhoneAc2; } }
    public string OPhone2 { set { oPhone2 = value; } get { return oPhone2; } }
    public string OFaxCc { set { oFaxCc = value; } get { return oFaxCc; } }
    public string OFaxAc { set { oFaxAc = value; } get { return oFaxAc; } }
    public string OFax { set { oFax = value; } get { return oFax; } }
    public string OEmail { set { oEmail = value; } get { return oEmail; } }
    public string Website { set { website = value; } get { return website; } }

    // Children Details

    public SqlDateTime DobC1 { set { dobC1 = value; } get { return dobC1; } }
    public SqlDateTime DobC2 { set { dobC2 = value; } get { return dobC2; } }
    public SqlDateTime DobC3 { set { dobC3 = value; } get { return dobC3; } }

    public string NameC1 { set { nameC1 = value; } get { return nameC1; } }
    public string NameC2 { set { nameC2 = value; } get { return nameC2; } }
    public string NameC3 { set { nameC3 = value; } get { return nameC3; } }

    public string GenderC1 { set { genderC1 = value; } get { return genderC1; } }
    public string GenderC2 { set { genderC2 = value; } get { return genderC2; } }
    public string GenderC3 { set { genderC3 = value; } get { return genderC3; } }
    


    // Communication Preferences
    public string MailPrefrence { set { mailPrefrence = value; } get { return mailPrefrence; } }
    public string AddressPrefrence { set { addressPrefrence = value; } get { return addressPrefrence; } }
    public string FaxPrefrence { set { faxPrefrence = value; } get { return faxPrefrence; } }

    public string Ipaddress { set { ipaddress = value; } get { return ipaddress; } }
   
    public int AddMember()
    {
        int i = 0;
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_AddMember";      
           

            obj.AddParam("@DistrictClubID", this.clubId);
            obj.AddParam("@MembershipNo", this.membershipNo);
            obj.AddParam("@MemType", this.membershipType);
            obj.AddParam("@CharterMember", this.charterMember);
            obj.AddParam("@Title", this.title);
            obj.AddParam("@FName", this.firstName);
            obj.AddParam("@MName", this.middleName);
            obj.AddParam("@LName", this.lastName);
            obj.AddParam("@CallName", this.callName);
            obj.AddParam("@Suffix", this.suffix);
            obj.AddParam("@Gender", this.gender);
           
            obj.AddParam("@Classification", this.classification);
            obj.AddParam("@Qualification", this.qualification);
            obj.AddParam("@EmailId", this.emailId);
            obj.AddParam("@AltEmailId", this.altEmailId);
            obj.AddParam("@Password", this.password);
            obj.AddParam("@MobileCc1", this.mobileCc1);
            obj.AddParam("@Mobile1", this.mobileNo1);
            obj.AddParam("@MobileCc2", this.mobileCc2);
            obj.AddParam("@Mobile2", this.mobileNo2);
            obj.AddParam("@DOB", this.dob);
            obj.AddParam("@BG", this.bloodGroup);
            obj.AddParam("@Hobbies", this.hobbies);
            obj.AddParam("@RHF", this.rhf);
            obj.AddParam("@donateBlood", this.donateBlood);
            obj.AddParam("@TrfAmt", this.trfAmt);
            obj.AddParam("@TRF", this.trfStatus);           
            obj.AddParam("@DOJ", this.joiningDate);
            obj.AddParam("@FoodPreference", this.foodPreference);
            obj.AddParam("@DrinkPreference", this.drinkPreference);
            obj.AddParam("@type_of_drink", this.typeOfDrink);
            obj.AddParam("@ProposedBy", this.proposedBy);
            obj.AddParam("@MorningBTTC", this.morningBttc);
            obj.AddParam("@NoonBTTC", this.noonBttc);
            obj.AddParam("@EveningBTTC", this.eveningBttc);
            obj.AddParam("@MemberImage", this.memberImage);

            // Spouse Details

            obj.AddParam("@SName", this.sFirstName);
            obj.AddParam("@SDOB", this.sDob);
            obj.AddParam("@SBG", this.sBg);
            obj.AddParam("@SRHF", this.sRhf);
            obj.AddParam("@SDonateBlood", this.sDonateBlood);
            obj.AddParam("@Anniversary", this.anniversary);
            obj.AddParam("@SMobileCc", this.sMobileCc);
            obj.AddParam("@SMobile", this.sMobile);
            obj.AddParam("@SEmailId", this.sEmailId);
            obj.AddParam("@SHobbies", this.sHobbies);
            obj.AddParam("@SFoodPreference", this.sFoodPreference);
            obj.AddParam("@SDrinkPreference", this.sDrinkPreference);
            obj.AddParam("@spouse_type_of_drink", this.sTypeOfDrink);
            obj.AddParam("@SImage", this.sImage);
           
            // Residence Address

            obj.AddParam("@RAdd1", this.rAdd1);
            obj.AddParam("@RAdd2", this.rAdd2);
            obj.AddParam("@RCity", this.rCity);
            obj.AddParam("@RState", this.rState);
            obj.AddParam("@RCountry", this.rCountry);
            obj.AddParam("@RPin", this.rPin);            
            obj.AddParam("@RPhoneCc1", this.rPhoneCc1);
            obj.AddParam("@RPhoneAc1", this.rPhoneAc1);
            obj.AddParam("@RPhone1", this.rPhone1);
            obj.AddParam("@RPhoneCc2", this.rPhoneCc2);
            obj.AddParam("@RPhoneAc2", this.rPhoneAc2);
            obj.AddParam("@RPhone2", this.rPhone2);
            obj.AddParam("@RFaxCc", this.rFaxCc);
            obj.AddParam("@RFaxAc", this.rFaxAc);
            obj.AddParam("@RFax", this.rFax);
           
            // Office Details

            obj.AddParam("@CompanyName", this.companyName);
            obj.AddParam("@CompanyDesignation", this.companyDesignation);
            obj.AddParam("@OAdd1", this.oAdd1);
            obj.AddParam("@OAdd2", this.oAdd2);
            obj.AddParam("@OCity", this.oCity);
            obj.AddParam("@OPin", this.oPin);
            obj.AddParam("@OState", this.oState);
            obj.AddParam("@OCountry", this.oCountry);            
            obj.AddParam("@OPhoneCc1", this.oPhoneCc1);
            obj.AddParam("@OPhoneAc1", this.oPhoneAc1);
            obj.AddParam("@OPhone1", this.oPhone1);
            obj.AddParam("@OPhoneCc2", this.oPhoneCc2);
            obj.AddParam("@OPhoneAc2", this.oPhoneAc2);
            obj.AddParam("@OPhone2", this.oPhone2);
            obj.AddParam("@OFaxCc", this.oFaxCc);
            obj.AddParam("@OFaxAc", this.oFaxAc);
            obj.AddParam("@OFax", this.oFax);
            obj.AddParam("@OMail", this.oEmail);
            obj.AddParam("@Website", this.website);
            
            // Children Details

            obj.AddParam("@C1Name", this.nameC1);
            obj.AddParam("@C1DOB_D", this.dobC1);
            obj.AddParam("@GenderC1", this.genderC1);
            obj.AddParam("@C2Name", this.nameC2);
            obj.AddParam("@C2DOB_D", this.dobC2);
            obj.AddParam("@GenderC2", this.genderC2);
            obj.AddParam("@C3Name", this.nameC3);
            obj.AddParam("@C3DOB_D", this.dobC3);
            obj.AddParam("@GenderC3", this.genderC3);

            // Communication Prefrence

            obj.AddParam("@MailPreference", this.mailPrefrence);
            obj.AddParam("@FaxPreference", this.faxPrefrence);
            obj.AddParam("@AddressPreference", this.addressPrefrence);


            obj.AddParam("@IpAddress", this.ipaddress);


            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // update  

    public int UpdateMember()
    {
        int i = 0;
        try
        {

            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "z_UpdateMember";
            obj.AddParam("@MemberId", this.id);
            obj.AddParam("@DistrictClubID", this.clubId);
            obj.AddParam("@MembershipNo", this.membershipNo);
            obj.AddParam("@MemType", this.membershipType);
            obj.AddParam("@CharterMember", this.charterMember);
            obj.AddParam("@Title", this.title);
            obj.AddParam("@FName", this.firstName);
            obj.AddParam("@MName", this.middleName);
            obj.AddParam("@LName", this.lastName);
            obj.AddParam("@CallName", this.callName);
            obj.AddParam("@Suffix", this.suffix);
            obj.AddParam("@Gender", this.gender);

            obj.AddParam("@Classification", this.classification);
            obj.AddParam("@Qualification", this.qualification);
            obj.AddParam("@EmailId", this.emailId);
            obj.AddParam("@AltEmailId", this.altEmailId);
           
            obj.AddParam("@MobileCc1", this.mobileCc1);
            obj.AddParam("@Mobile1", this.mobileNo1);
            obj.AddParam("@MobileCc2", this.mobileCc2);
            obj.AddParam("@Mobile2", this.mobileNo2);
            obj.AddParam("@DOB", this.dob);
            obj.AddParam("@BG", this.bloodGroup);
            obj.AddParam("@Hobbies", this.hobbies);
            obj.AddParam("@RHF", this.rhf);
            obj.AddParam("@donateBlood", this.donateBlood);
            obj.AddParam("@TrfAmt", this.trfAmt);
            obj.AddParam("@TRF", this.trfStatus);
            obj.AddParam("@DOJ", this.joiningDate);
            obj.AddParam("@FoodPreference", this.foodPreference);
            obj.AddParam("@DrinkPreference", this.drinkPreference);
            obj.AddParam("@type_of_drink", this.typeOfDrink);
            obj.AddParam("@ProposedBy", this.proposedBy);
            obj.AddParam("@MorningBTTC", this.morningBttc);
            obj.AddParam("@NoonBTTC", this.noonBttc);
            obj.AddParam("@EveningBTTC", this.eveningBttc);
            obj.AddParam("@MemberImage", this.memberImage);

            // Spouse Details

            obj.AddParam("@SName", this.sFirstName);
            obj.AddParam("@SDOB", this.sDob);
            obj.AddParam("@SBG", this.sBg);
            obj.AddParam("@SRHF", this.sRhf);
            obj.AddParam("@SDonateBlood", this.sDonateBlood);
            obj.AddParam("@Anniversary", this.anniversary);
            obj.AddParam("@SMobileCc", this.sMobileCc);
            obj.AddParam("@SMobile", this.sMobile);
            obj.AddParam("@SEmailId", this.sEmailId);
            obj.AddParam("@SHobbies", this.sHobbies);
            obj.AddParam("@SFoodPreference", this.sFoodPreference);
            obj.AddParam("@SDrinkPreference", this.sDrinkPreference);
            obj.AddParam("@spouse_type_of_drink", this.sTypeOfDrink);
            obj.AddParam("@SImage", this.sImage);

            // Residence Address

            obj.AddParam("@RAdd1", this.rAdd1);
            obj.AddParam("@RAdd2", this.rAdd2);
            obj.AddParam("@RCity", this.rCity);
            obj.AddParam("@RState", this.rState);
            obj.AddParam("@RCountry", this.rCountry);
            obj.AddParam("@RPin", this.rPin);
            obj.AddParam("@RPhoneCc1", this.rPhoneCc1);
            obj.AddParam("@RPhoneAc1", this.rPhoneAc1);
            obj.AddParam("@RPhone1", this.rPhone1);
            obj.AddParam("@RPhoneCc2", this.rPhoneCc2);
            obj.AddParam("@RPhoneAc2", this.rPhoneAc2);
            obj.AddParam("@RPhone2", this.rPhone2);
            obj.AddParam("@RFaxCc", this.rFaxCc);
            obj.AddParam("@RFaxAc", this.rFaxAc);
            obj.AddParam("@RFax", this.rFax);

            // Office Details

            obj.AddParam("@CompanyName", this.companyName);
            obj.AddParam("@CompanyDesignation", this.companyDesignation);
            obj.AddParam("@OAdd1", this.oAdd1);
            obj.AddParam("@OAdd2", this.oAdd2);
            obj.AddParam("@OCity", this.oCity);
            obj.AddParam("@OPin", this.oPin);
            obj.AddParam("@OState", this.oState);
            obj.AddParam("@OCountry", this.oCountry);
            obj.AddParam("@OPhoneCc1", this.oPhoneCc1);
            obj.AddParam("@OPhoneAc1", this.oPhoneAc1);
            obj.AddParam("@OPhone1", this.oPhone1);
            obj.AddParam("@OPhoneCc2", this.oPhoneCc2);
            obj.AddParam("@OPhoneAc2", this.oPhoneAc2);
            obj.AddParam("@OPhone2", this.oPhone2);
            obj.AddParam("@OFaxCc", this.oFaxCc);
            obj.AddParam("@OFaxAc", this.oFaxAc);
            obj.AddParam("@OFax", this.oFax);
            obj.AddParam("@OMail", this.oEmail);
            obj.AddParam("@Website", this.website);

            // Children Details

            obj.AddParam("@C1Name", this.nameC1);
            obj.AddParam("@C1DOB_D", this.dobC1);
            obj.AddParam("@GenderC1", this.genderC1);
            obj.AddParam("@C2Name", this.nameC2);
            obj.AddParam("@C2DOB_D", this.dobC2);
            obj.AddParam("@GenderC2", this.genderC2);
            obj.AddParam("@C3Name", this.nameC3);
            obj.AddParam("@C3DOB_D", this.dobC3);
            obj.AddParam("@GenderC3", this.genderC3);

            // Communication Prefrence

            obj.AddParam("@MailPreference", this.mailPrefrence);
            obj.AddParam("@FaxPreference", this.faxPrefrence);
            obj.AddParam("@AddressPreference", this.addressPrefrence);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }


    #region --- Get Club ---


    public DataTable GetAllDist3141Members()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllDist3141Members";
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetAllMembers()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllMembers";       
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetMemberById()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetMemberById";
        obj.AddParam("@MemberId", this.id);
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetMemberByClubId()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetMemberByClubId";
        obj.AddParam("@DistrictClubID", this.clubId);
        dt = obj.ExecuteTable();
        return dt;
    }


     public DataTable GetAllMembersTrfAmt()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetAllMembersTrfAmt";       
        dt = obj.ExecuteTable();
        return dt;
    }

    public DataTable GetMemberByClubNo()
    {
        DBconnection obj = new DBconnection();
        DataTable dt = new DataTable();
        obj.SetCommandSP = "z_GetMemberByClubNo";
        obj.AddParam("@ri_club_no", this.clubNo);
        dt = obj.ExecuteTable();
        return dt;
    }



    #endregion

}
