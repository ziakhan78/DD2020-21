using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for Poll
/// </summary>
public class Poll
{
	public Poll()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string title, question, option1, option2, option3, option4, option5, option6;
    private int id, clubId, pollId, quesId;
    DateTime startDate, endDate;

    public int Id { set { id = value; } get { return id; } }
    public int ClubId { set { clubId = value; } get { return clubId; } }
    public int PollId { set { pollId = value; } get { return pollId; } }
    public int QuesId { set { quesId = value; } get { return quesId; } }
    public string Title { set { title = value; } get { return title; } }
    public string Question { set { question = value; } get { return question; } }
    public string Option1 { set { option1 = value; } get { return option1; } }
    public string Option2 { set { option2 = value; } get { return option2; } }
    public string Option3 { set { option3 = value; } get { return option3; } }
    public string Option4 { set { option4 = value; } get { return option4; } }
    public string Option5 { set { option5 = value; } get { return option5; } }
    public string Option6 { set { option6 = value; } get { return option6; } }
    public DateTime StartDate { set { startDate = value; } get { return startDate; } }
    public DateTime EndDate { set { endDate = value; } get { return endDate; } }
    
    // Get Title

    public DataTable GetTitle()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "poll_GetPollTitle";
            obj.AddParam("@poll_id", this.pollId);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add Title

    public int AddTitle()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "poll_AddPollTitle";

            //obj.AddParam("@DistrictClubID", this.clubId);
            obj.AddParam("@title", this.title);
            obj.AddParam("@start_date", this.startDate);
            obj.AddParam("@end_time", this.endDate);           

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update Title

    public int UpdateTitle()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "poll_UpdatePollTitle";

            obj.AddParam("@poll_id", this.pollId);
           // obj.AddParam("@DistrictClubID", this.clubId);
            obj.AddParam("@title", this.title);
            obj.AddParam("@start_date", this.startDate);
            obj.AddParam("@end_time", this.endDate);      

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Delete Title

    public int DeleteTitle()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "poll_DeletePoll_Title";

            obj.AddParam("@poll_id", this.pollId);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Get Question

    public DataTable GetQuestion()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "poll_GetQuestion";
            obj.AddParam("@ques_id", this.quesId);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }

    // Add Question

    public int AddQuestion()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "poll_AddQuestion";

            obj.AddParam("@poll_id", this.pollId);
            obj.AddParam("@question", this.question);
            obj.AddParam("@option1", this.option1);
            obj.AddParam("@option2", this.option2);
            obj.AddParam("@option3", this.option3);
            obj.AddParam("@option4", this.option4);
            obj.AddParam("@option5", this.option5);
            obj.AddParam("@option6", this.option6);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Update Question

    public int UpdateQuestion()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "poll_UpdateQuestion";

            obj.AddParam("@ques_id", this.quesId);
            obj.AddParam("@poll_id", this.pollId);
            obj.AddParam("@question", this.question);
            obj.AddParam("@option1", this.option1);
            obj.AddParam("@option2", this.option2);
            obj.AddParam("@option3", this.option3);
            obj.AddParam("@option4", this.option4);
            obj.AddParam("@option5", this.option5);
            obj.AddParam("@option6", this.option6);

            i = obj.ExecuteNonQuery();

        }
        catch { }
        return i;
    }

    // Delete Question

    public int DeleteQuestion()
    {
        int i = 0;
        try
        {
            DBconnection obj = new DBconnection();
            obj.SetCommandSP = "poll_DeleteQuestion";

            obj.AddParam("@ques_id", this.quesId);

            i = obj.ExecuteNonQuery();
        }
        catch { }
        return i;
    }

    // Bind Question By Poll Id

    public DataTable BindQuestion()
    {
        DataTable dt = new DataTable();
        try
        {
            DBconnection obj = new DBconnection();

            obj.SetCommandSP = "poll_BindQuestions";
            obj.AddParam("@poll_id", this.pollId);

            dt = obj.ExecuteTable();

        }
        catch { }
        return dt;
    }
}


