﻿using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Default_Old : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //this.Form.DefaultButton = this.btnSign.UniqueID;

        try
        {
            Page.SetFocus("txtUsername");
            if (!IsPostBack)
            {
                if (Session["uname"] != null)
                {
                    Response.Redirect("~/admin/view_users.aspx");
                }
                Response.Cache.SetNoStore();
                Response.Buffer = true;
                Response.ExpiresAbsolute = System.DateTime.Now;
                Response.Expires = 0;
                Response.CacheControl = "no-cache";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetExpires(DateTime.Now);

                string email = Request.Form["txtUsername"];
                string psw = Request.Form["txtPassword"];
                string remember = Request.Form["ckremember"];
                Page.SetFocus("txtUsername");
                if (email != null)
                {
                    txtUsername.Text = email.Trim();
                    txtPassword.Attributes.Add("value", psw.Trim());
                    if (remember == "on")
                    {
                        ckremember.Checked = true;
                    }
                    else
                    {
                        ckremember.Checked = false;
                    }
                }
                else
                {
                    if (Request.Cookies["UserCook1"] != null)
                    {
                        ckremember.Checked = true;
                        HttpCookie cook = Request.Cookies["UserCook1"];
                        txtUsername.Text = cook["AdminUserName"].ToString();
                        //txtpsw.Text = cook["pass"].ToString();
                        txtPassword.Attributes.Add("value", cook["AdminPass"].ToString());
                    }
                }
            }
        }
        catch { }
    }
    protected void btnSign_Click(object sender, EventArgs e)
    {
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUsername.Text = "";
        txtPassword.Text = "";
        //LblInvalid.Visible = false;
    }
    protected void btnSign_Click1(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            DBconnection con = new DBconnection();
            DataTable objdt = new DataTable();
            con.SetCommandSP = "z_LoginUser";
            con.AddParam("@uname", txtUsername.Text.Trim().ToString());
            con.AddParam("@pass", txtPassword.Text.Trim().ToString());
            objdt = con.ExecuteTable();
            if (objdt.Rows.Count > 0)
            {
                // LblInvalid.Visible = false;
                Session["user"] = txtUsername.Text;
                //Session["AdminUserName"] = txtUsername.Text;                
                //Session["AdminUserName"] = objdt.Rows[0]["FName"].ToString() + " " + objdt.Rows[0]["LName"].ToString();
                Session["AdminUserName"] = objdt.Rows[0]["Name"].ToString();

                Session["Uid"] = objdt.Rows[0]["UID"].ToString();
                Session["Edit"] = objdt.Rows[0]["UEdit"].ToString();
                Session["Delete"] = objdt.Rows[0]["UDelete"].ToString();
                Session["Add"] = objdt.Rows[0]["UAdd"].ToString();
               


                if (ckremember.Checked)
                {
                    if (ckremember.Checked)
                    {
                        if (Request.Browser.Cookies == true)
                        {
                            HttpCookie loginCook = new HttpCookie("UserCook1");
                            loginCook["AdminUserName"] = txtUsername.Text.ToString();
                            loginCook["AdminPass"] = txtPassword.Text.ToString();
                            loginCook.Expires = DateTime.Now.AddDays(1);
                            Response.Cookies.Add(loginCook);
                        }
                    }
                }

                Response.Redirect("view_users.aspx");
            }
            else
            {
                //LblInvalid.Visible = true;
                string msg = "Invalid Username or Password";
                showmsg(msg);
            }
        }
    }
    public void showmsg(string msg)
    {
        try
        {
            string strScript = "<script>";
            strScript += "alert('" + msg + "');";
            strScript += "</script>";
            Label lbl = new Label();
            lbl.Text = strScript;
            Page.Controls.Add(lbl);
        }
        catch { }
    }
}