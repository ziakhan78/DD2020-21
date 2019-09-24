using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;


public partial class admin_uploade_image_todb : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadImage();
        }
    }
    protected void btnUploade_Click(object sender, EventArgs e)
    {
        //Create a new filestream object based on the file chosen in the FileUpload control
        FileStream fs = new FileStream(FileUpload1.PostedFile.FileName, FileMode.Open, FileAccess.Read);
        //Create a binary reader object to read the binary contents of the file to upload
        BinaryReader br = new BinaryReader(fs);
        //dump the bytes read into a new byte variable named image
        byte[] image = br.ReadBytes((int)fs.Length);
        //close the binary reader
        br.Close();
        //close the filestream
        fs.Close();

        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "AddImagetoDB";
        obj.AddParam("@Name", TextBox1.Text.Trim().ToString());
        obj.AddParam("@Picture", image);

        obj.ExecuteNonQuery();

    }

    protected void LoadImage()
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandQry = "select top 2 * from tblImgData order by id desc";
        DataTable dt = new DataTable();
        dt = obj.ExecuteTable();
        if (dt.Rows.Count > 0)
        {
            

            byte[] barrImg = (byte[])dt.Rows[0]["Picture"];
            Session["Image"] = barrImg;
            System.IO.MemoryStream mstream = new System.IO.MemoryStream(barrImg, 0, barrImg.Length);
            System.Drawing.Image img = System.Drawing.Image.FromStream(mstream);

            img.Save(Server.MapPath("~/MyImage/test2.jpg"));
            Image1.ImageUrl = "~/MyImage/test2.jpg"; //Server.MapPath("../Image/test3.jpg");
            Image1.Height = 100;
            Image1.Width = 150;
            mstream.Close();
            img.Dispose();

            // Image1.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(barrImg);

        }

    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        DBconnection obj = new DBconnection();
        obj.SetCommandSP = "UpdateImagetoDB";
        obj.AddParam("@ID", 1);
        obj.AddParam("@Name", TextBox1.Text.Trim().ToString());
        obj.AddParam("@Picture", (byte[])Session["Image"]);
        obj.ExecuteNonQuery();
    }
}