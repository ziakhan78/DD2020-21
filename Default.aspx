<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContent" runat="Server">

    <style>
.unminify01{margin-top: 0px}
.unminify02{z-index: 100; position: relative;}
.unminify03{position: ; margin: 0 0 0px 0; right: 2px}
.unminify04{height: 10px;}
.unminify05{margin-left: 20px; text-align: center;}
.unminify06{padding: 5px 0 0 10px; margin-bottom: 10px;}
.unminify07{padding: 2px 0 0 10px;}



    </style>

  
    <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.7";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container holder">
        <div class="">

            <div class="yellow_banner_stripper">
                <div class="banner-bottom">


                    <div class="b-grid1">

                        <ul class="unminify02 partners ch_green fade_anim" >
                            <li class="no_r_border"><a href="TopProjects.aspx">
                                <img src="../images/icon01.png" alt="icon">
                                Top Projects</a></li>
                        </ul>
                    </div>





                    <div class="b-grid2">

                        <ul class="unminify02 partners ch_green fade_anim" >
                            <li class="no_r_border"><a href="DistrictThrustAreas.aspx">
                                <img src="../images/icon2.png" alt="icon">
                                District Thrust Areas</a></li>
                        </ul>
                    </div>




                    <div class="b-grid3">




                        <ul class="unminify02 partners ch_green fade_anim" >
                            <li class="no_r_border"><a href="ServiceCarnival16-17.aspx">
                                <img src="../images/icon3.png" alt="icon">
                                Service Carnival 16-17</a></li>
                        </ul>
                    </div>




                    <div class="b-grid4">
                        <ul class="unminify02 partners ch_green fade_anim" >
                            <li class="no_r_border"><a href="TRFCentennial.aspx">
                                <img src="../images/icon4.png" alt="icon">
                                TRF Centennial</a></li>
                        </ul>
                    </div>




                    <div class="b-grid5">
                        <ul class="unminify02 partners ch_green fade_anim" >
                            <li class="no_r_border"><a href="JoinRotary.aspx">
                                <img src="../images/icon5.png" alt="icon">
                                Join Rotary</a></li>
                        </ul>
                    </div>







                    <div class="clearfix"></div>
                </div>




            </div>







        </div>
    </div>

    <div class="clearfix"></div>

    <div class="container holder">
        <div class="row">


            <div class="col-lg-9 col-md-9 col-sm-9">
                <div class="row">




                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">

                            <div class="left_bar">
                                <div class="text_paragraph">

                                    <div class="hack">
                                        <h1 class="heading2">Governor’s Monthly Message</h1>
                                    </div>
                                    <asp:Label ID="lblDgMessage" runat="server" ></asp:Label>
                                    <div align="right" class="unminify03"><a href="District3141/DGMonthlyMessage.aspx" class="blue_text btn-sub "><i class="fa fa-angle-double-right"></i> Read More</a></div>

                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">

                            <div class="left_bar">
                                <div class="text_paragraph">

                                    <div class="hack">
                                        <h1 class="heading2">RI President's Monthly Message</h1>
                                    </div>
                                    <asp:Label ID="lblRiMessage" runat="server" Text="Label"></asp:Label>
                                    <div align="right" class="unminify03"><a href="RotaryInternational/RIPresidentsMonthlyMessage.aspx" class="blue_text btn-sub "><i class="fa fa-angle-double-right"></i> Read More</a></div>

                                </div>
                            </div>
                        </div>
                    </div>


                    <hr class="hr">
                    <div class="clearfix"></div>



                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="javascript:void(0)" onclick="MM_openBrWindow('popup.aspx?id=RI President','01111','width=1060, height=750, scrollbars=1')">
                            <div class="memeber_box">
                                <div class="member_img_div">
                                    <img src="images/ri_president.jpg" width="80" height="83" alt="ripresident">
                                </div>
                                <div class="">
                                    John F. Germ<br>
                                    President Rotary International
                                </div>
                            </div>
                        </a>
                    </div>


                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="javascript:void(0)" onclick="MM_openBrWindow('popup.aspx?id=District Governor Elect','01111','width=1060, height=750, scrollbars=1') ">
                            <div class="memeber_box">
                                <div class="member_img_div">
                                    <img src="images/praful.jpg" width="80" height="83" alt="praful">
                                </div>
                                <div class="memeber_rt_text">
                                    Prafull Sharma<br>
                                    District Governor Elect
                                </div>
                            </div>
                        </a>
                    </div>




                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <a href="javascript:void(0)" onclick="MM_openBrWindow('popup.aspx?id=District Governor Nominee','01111','width=1060, height=760, scrollbars=1')">
                            <div class="memeber_box">
                                <div class="member_img_div">
                                    <img src="images/imp_dge_shashi_sharma.jpg" width="80" height="83" alt="imp_dge_shashi_sharma">
                                </div>
                                <div class="memeber_rt_text">
                                    Shashikumar Sharma<br>
                                    District Governor Nominee
                                </div>
                            </div>
                        </a>
                    </div>



                    <hr class="hr">



                    <div class="clearfix"></div>
                    <div class="unminify04"></div>

<div class="today_div1"><a href="PublicRelations/GovernorsMonthlyLetter.aspx"><img src="images/thumb1.jpg" width="111" height="135"  alt="thumb1"/></a> </div>

<div class="today_div2">
<div class="blak_strip">Gallery</div><a href="Gallery.aspx">
<img src="images/photo_imger1.jpg" width="210" height="135"  alt="photo_imger1"/></a> 
</div>


<div class="today_imp_dl">

<div class="today_imp_left">
<h2>Important Links</h2>
<div class="in_rry">
                            <ul class="in_rry">
                                <li><a href="https://www.rotary.org/myrotary/en/news-media/office-president/presidential-citation-rotary-clubs-frequently-asked-questions" target="_blank">RI Presidential Citation FAQ's</a></li>
                                <li><a href="District3141/RotaryCentres.aspx">Rotary Service Centers - RID 3141</a></li>
                            </ul>
                        </div>

</div>

<div class="today_imp_right">
<h2>Downloads</h2>

<div class="in_rry">
                            <ul class="in_rry">
                                <li><a href="http://rotarydist3141.com/Downloads/Documents/RIOfficialDirectory201617-9242016124321PM.pdf" target="_blank">Official RI Directory 2016-17</a></li>
                                <li><a href="http://rotarydist3141.com/downloads/pratham-district-directory-1617.pdf" target="_blank">Pratham District Directory 2016-17</a></li>
                                <li><a href="http://rotarydist3141.com/Downloads/Documents/RotaryCodeofPoliciesApril2016edition-38201680814AM.pdf" target="_blank">Rotary Code of Policies (April 2016)</a></li>
                                <li><a href="http://rotarydist3141.com/Downloads/Documents/RotaryFoundationCodeofPoliciesApril2016edition-38201680847AM.pdf" target="_blank">Rotary Foundation Code of Policies (April 2016)</a></li>
                                <li><a href="http://rotarydist3141.com/Downloads/Documents/GlobalGrantsAreasofFocusPolicyStatementsen-38201675827AM.pdf" target="_blank">Global Grants - Areas of Focus Policy Statements</a></li>
                            </ul>
                        </div>
</div>

</div>

<div class=" extra_height"></div>

     <%-- end new today code --%>        


                </div>
            </div>

            <div class="col-lg-3 col-md-3 col-sm-3">

                <div class="right_bar">
                    <div class="yellow_rupees_box">
                        <div class="yellow_heading_text">
                            Conversion Rate <strong>1$ = <i class="fa fa-inr"></i>67</strong>
                        </div>
                    </div>
                     <a href="http://www.rotarydist3141.com/tashkent/Default.aspx" class="pdf_button" target="_blank"><b><i class="fa fa-plane" aria-hidden="true"></i> &nbsp; &nbsp;</b>Tour to Tashkent</a>
                    <div class="clearfix"></div>
                    <a href="downloads/pratham-district-directory-1617.pdf" class="pdf_button" target="_blank"><b><i class="fa fa-download"></i>&nbsp; &nbsp;</b>District Directory 2016-17</a>
                    <div><a href="#" class="pdf_button" target="_blank"><i class="fa fa-newspaper-o">&nbsp;</i>Pledge your Organs</a></div>
                    <div><a href="PublicRelations/GovernorsMonthlyLetter.aspx" class="pdf_button" target="_blank"><i class="fa fa-newspaper-o">&nbsp;</i>Governor's Monthly Letter</a></div>


                    <div class="right_gray_box">

                        <div class="cate_heading_bg">
                            <div class="member_txt_white">The 4 - Way Test</div>
                        </div>

                        <div id='carousel-example-generic' class='carousel slide carousel-fade' data-ride='carousel'>
                            <!-- Indicators -->

                            <!-- Wrapper for slides -->
                            <div class='carousel-inner'>
                                <div class='item active'>
                                    <div class="unminify05">
                                        <img class="img-responsive text-center" src='slider_img/banner01.jpg' alt='banner01' /></div>
                                </div>
                                <div class='item'>
                                  <div class="unminify05">
                                        <img class="img-responsive text-center" src='slider_img/banner02.jpg' alt='banner01' /></div>
                                </div>
                                <div class='item'>
                                  <div class="unminify05">
                                        <img class="img-responsive text-center" src='slider_img/banner03.jpg' alt='banner01' /></div>
                                </div>

                                <div class='item'>
                                   <div class="unminify05">
                                        <img class="img-responsive text-center" src='slider_img/banner04.jpg' alt='banner01' /></div>
                                </div>


                                <div class='item'>
                                   <div class="unminify05">
                                        <img class="img-responsive text-center" src='slider_img/banner05.jpg' alt='banner01' /></div>
                                </div>




                            </div>

                        </div>


                    </div>


                </div>


                <div class="yellow_button_box">
                    <a href="GetInvolved/JoinRotary.aspx">
                        <div class="yellow_heading_text unminify06">Like to Join Rotary!</div>
                        <div class="unminify07" align="left"><a href="GetInvolved/JoinRotary.aspx" class="btn_dhy">Click Here</a></div>
                    </a>
                </div>



                <div>

<div class="fb-page" data-href="https://www.facebook.com/RotaryDist3141" data-tabs="timeline" data-height="200" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"><blockquote cite="https://www.facebook.com/RotaryDist3141" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/RotaryDist3141">Rotary District 3141</a></blockquote></div>
                </div>

            </div>






            <div class="unminify04"></div>
        </div>
    </div>
</asp:Content>

