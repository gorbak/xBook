using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Net;

namespace Ksiegarnia
{
    public partial class kontakt : System.Web.UI.Page
    {
        protected void SendMail()
        {
            // mail Address from where you send the mail
            var fromAddress = "twoje_meble_konsultant@yahoo.com";
            // any address where the email will be sending
            var toAddress = "twojemeble@yahoo.pl";
            // login twojemeble@yahoo.pl hasło 1qazxsw2
            //Password of your gmail address
            const string fromPassword = "tmkonsultant";
            // Passing the values and make a email formate to display
            string Temat = T_temat.Text.ToString();
            string body = "Od: " + T_imie.Text + "\n";


            body += "Pytanie: \n" + T_tresc.Text + "\n";
            // smtp settings
            var smtp = new System.Net.Mail.SmtpClient();
            {
                //twoje_meble_konsultant // tmkonsultant
                // yahoo.pl
                //azimuth // azimuth2
                smtp.Host = "smtp.mail.yahoo.com";
                smtp.Port = 587;
                smtp.EnableSsl = false;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                smtp.Timeout = 20000;
            }
            // Passing values to smtp object
            smtp.Send(fromAddress, toAddress, Temat, body);
        }

        public void Wyslij(object sender, EventArgs e)
        {
            try
            {
                //here on button click what will done 
                SendMail();
                displaymessage.Text = "Twoja wiadomość została wysłana do konsultanta";
                displaymessage.Visible = true;

                //YourName.Text = "";
                T_tresc.Text = "";
                T_temat.Text = "";

            }
            catch (Exception)
            {

            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            MailMessage ms = new MailMessage();
            //  MailAdress to = "";
            ms.From = "x@x.com";
            ms.To = "goroz@o2.pl";

            //  SmtpMail.Send();
        }

        protected void T_email_TextChanged(object sender, EventArgs e)
        {

        }
    }
}